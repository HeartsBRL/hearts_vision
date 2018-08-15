#!/usr/bin/env python

__author__ = "Steve Battle"
__email__ = "steve.battle@uwe.ac.uk"

import rospy
from smach import State, StateMachine, Concurrence
from smach_ros import MonitorState
from std_msgs.msg import String
from control_msgs.msg import PointHeadAction, PointHeadGoal
from geometry_msgs.msg import Point
from actionlib import SimpleActionClient
from time import sleep
import constants
import random
import Queue
import argparse

ap = argparse.ArgumentParser()
ap.add_argument('--wait', type=float, default=3)
ap.add_argument('--bounds', type=float, nargs=3, default=[0,1,1])
ap.add_argument('--coords', nargs='+', default=['AHEAD'])
ap.add_argument('--end', action='store_true', help="terminates coords")

# this is required to ignore additional args added by roslaunch
args = ap.parse_known_args()[0]

# globals
end = False
sm = None
queue = Queue.Queue()

def shutdown():
    global end, sm
    rospy.loginfo("shutting down..")
    end = True
    sm.request_preempt()

# True if we are still in a valid Inactive state (ie. unless start requested)
def inactiveCallback(data,msg):
    rospy.loginfo(msg)
    # return False when we want to terminate the monitoring state
    return msg.data != 'start'

# True if we are still in a valid Active state (ie. unless stop requested)
def activeCallback(data,msg):
    rospy.loginfo(msg)
    return msg.data != 'stop'

# A Queueing request always falsifies the queue monitor, pass the input to the QUEUE state
def queueCallback(data,msg):
    data.point_out = msg
    return False

# active state
# checks for shutdown before continuing to monitoring the control topic
class Active(State):
    def __init__(self):
        # User defined outcomes 'continue' and 'finish'
        # see: http://wiki.ros.org/smach/Tutorials/Getting%20Started
        State.__init__(self, outcomes=['continue','stop'])

    def execute(self, data):
        global end
        return 'stop' if end else 'continue'

# Inactive state
# checks for shutdown before continuing to monitoring the control topic
class Inactive(State):
    def __init__(self):
        State.__init__(self, outcomes=['continue','stop'])

    def execute(self, data):
        global end
        return 'stop' if end else 'continue'

# random Gaze state
# checks for shutdown before continuing
# looks in direction specified by x,y,z coordinates, +/- x,y,z offsets within specified bounds
class Gaze(State):
    def __init__(self,gc,coords,bounds,queue):
        global args
        State.__init__(self, outcomes=['continue','stop','exit','repeat'])
        self.gazeControl = gc
        self.coords = coords
        self.bounds = bounds
        self.q = queue

    def execute(self, data):
        global end
        if self.preempt_requested():
            self.service_preempt()
            # return head to neutral position
            self.neutral()
            return 'exit'

        if not self.q.empty():
            p = self.q.get()
            self.gazeControl.look(p.x,p.y,p.z)
            self.gazeControl.publish(p.x,p.y,p.z)
            rospy.loginfo('gaze: {0}, {1}, {2}'.format(p.x,p.y,p.z))
            sleep(args.wait)
            return 'stop' if end else 'repeat'         

        # look towards coords +/- random offset within bounds
        x = self.coords['x'] + random.uniform(-self.bounds[0],self.bounds[0])
        y = self.coords['y'] + random.uniform(-self.bounds[1],self.bounds[1])
        z = self.coords['z'] + random.uniform(-self.bounds[2],self.bounds[2])
        self.gazeControl.look(x,y,z)
        self.gazeControl.publish(x,y,z)
        rospy.loginfo('gaze: {0}, {1}, {2}'.format(x,y,z))
        sleep(args.wait)
        return 'stop' if end else 'continue'

    # see: http://wiki.ros.org/mysmach/Tutorials/State%20Preemption%20Implementation
    def request_preempt(self):
        State.request_preempt(self)

    def neutral(self):
        x = constants.AHEAD['x']
        y = constants.AHEAD['y']
        z = constants.AHEAD['z']
        self.gazeControl.look(x,y,z)

class Q(State):
    def __init__(self,queue):
        State.__init__(self, outcomes=['continue','stop','exit'], input_keys=['point_in'])
        self.q = queue
        self.point = None

    def duplicate(self,p):
        return self.point is not None and self.point.x==p.x and self.point.y==p.y and self.point.z==p.z
    
    def execute(self, data):
        global end
        if self.preempt_requested():
            self.service_preempt()
            return 'exit'

        if 'point_in' in data and not self.duplicate(data.point_in):    
            # queue requested point
            self.q.put(data.point_in)
            rospy.loginfo(data.point_in)
            self.point = data.point_in
        sleep(1)
        return 'stop' if end else 'continue'

    def request_preempt(self):
        State.request_preempt(self)

class GazeControl:
    def __init__(self):
        self.ac = SimpleActionClient('/head_controller/point_head_action', PointHeadAction)
        rospy.loginfo('waiting for action server..')
        self.ac.wait_for_server() #rospy.Duration(5.0)
        rospy.loginfo("Publishing to: /head_controller/point_head_action")
        self.pub = rospy.Publisher('vision/control/gaze', Point, queue_size=1)

# The base_link coordinate frame is relative to the mobile robot base: x forward, y left(+ve)/right(-ve), z height
# see: http://www.ros.org/reps/rep-0103.html and http://www.ros.org/reps/rep-0105.html
 
    def look(self, x, y, z, block=True):
        g = PointHeadGoal()
        g.pointing_frame = 'xtion_optical_frame'
        g.pointing_axis.z = 1.0
        g.max_velocity = 1.0
        g.min_duration = rospy.Duration(0.5)
        g.target.header.frame_id = 'base_link'
        g.target.point.x = x
        g.target.point.y = y
        g.target.point.z = z
        if block:
            self.ac.send_goal_and_wait(g)
        else:
            self.ac.send_goal(g)

    def publish(self,x,y,z):
        p = Point()
        p.x = x
        p.y = y
        p.z = z
        self.pub.publish(p)

# terminator callback preempts other concurrent threads once the ACTIVE state is exited (by a stop request)

def terminator(outcome_map):
    rospy.loginfo("terminator")
    print outcome_map
    if 'SUBACTIVE' in outcome_map and outcome_map['SUBACTIVE']=='exit':
        return True
    return False

def main():
    global sm
    global args
    global queue

    rospy.on_shutdown(shutdown)
    rospy.init_node('control')

    gc = GazeControl()

    sm = StateMachine(outcomes=['stop'])
    with sm:
        # state-machine starts in Inactive state
        StateMachine.add('INACTIVE', Inactive(), transitions={'continue':'INACTIVE_MONITOR', 'stop':'stop'})
        
        StateMachine.add('INACTIVE_MONITOR', MonitorState('/vision/control',String,inactiveCallback),
        # INVALID : termination of the monitoring state and transition to the next state
        # VALID : monitoring condition holds so remain in current state
        transitions={'invalid':'CONACTIVE', 'valid':'INACTIVE', 'preempted':'INACTIVE'})

        # concurrent container for CONACTIVE state with children: SUBACTIVE
        conActive = Concurrence(outcomes=['exit','stop'], default_outcome='exit', 
        outcome_map={'exit':{'SUBACTIVE':'exit'}, 'stop':{'SUBACTIVE':'stop'}},
        child_termination_cb = terminator)

        # hierarchical state machine for SUBACTIVE state with substates: ACTIVE and ACTIVE_MONITOR
        subActive = StateMachine(outcomes=['exit','stop'])
        with subActive:
            StateMachine.add('ACTIVE', Active(), transitions={'continue':'ACTIVE_MONITOR', 'stop':'stop'})
            StateMachine.add('ACTIVE_MONITOR', MonitorState('/vision/control',String,activeCallback),
            transitions={'invalid':'exit', 'valid':'ACTIVE', 'preempted':'ACTIVE'})

        # hierarchical state machine for SUBGAZE
        subGaze = StateMachine(outcomes=['exit', 'stop'])
        with subGaze:
            #StateMachine.add('GAZE',Gaze(gc,constants.AHEAD,args.bounds),transitions={'continue':'GAZE', 'preempted':'exit', 'stop':'stop'})
            # add gaze targets programmatically
            n = len(args.coords)
            coords=constants.AHEAD
            # All but the last state in the list transition to the next i+1th state
            for i in range(n-1):
                exec("coords = constants."+args.coords[i])
                StateMachine.add('GAZE_{0}'.format(i),Gaze(gc,coords,args.bounds,queue),
                transitions={'continue':'GAZE_{0}'.format(i+1), 'repeat':'GAZE_{0}'.format(i), 'exit':'exit', 'stop':'stop'})
            exec("coords = constants."+args.coords[n-1])
            # The last state in the cycle returns to the first
            StateMachine.add('GAZE_{0}'.format(n-1),Gaze(gc,coords,args.bounds,queue),
            transitions={'continue':'GAZE_0', 'repeat':'GAZE_{0}'.format(n-1), 'exit':'exit', 'stop':'stop'})

        # hierarchical state machine for SUBQUEUE
        subQueue = StateMachine(outcomes=['exit', 'stop'])
        with subQueue:
            StateMachine.add('QUEUE', Q(queue), transitions={'continue':'QUEUE_MONITOR', 'stop':'stop', 'exit':'exit'},
            remapping={'point_in':'point'})
            StateMachine.add('QUEUE_MONITOR', MonitorState('/vision/control/request',Point, queueCallback, output_keys=['point_out']),
            transitions={'invalid':'QUEUE', 'valid':'QUEUE', 'preempted':'exit'}, remapping={'point_out':'point'})            

        # build concurrent container
        with conActive:
            Concurrence.add('SUBACTIVE', subActive)
            Concurrence.add('SUBGAZE', subGaze)
            Concurrence.add('SUBQUEUE', subQueue)

        StateMachine.add('CONACTIVE',conActive,transitions={'exit':'INACTIVE', 'stop':'stop'})

    sm.execute()


#does this work with launch?
#if __name__ == '__main__':
main()