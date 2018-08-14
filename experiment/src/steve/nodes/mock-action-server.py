#!/usr/bin/env python

# see: wiki.ros.org/actionlib

import roslib
roslib.load_manifest('steve') # <-- package name here
import rospy
import actionlib
from control_msgs.msg import PointHeadAction, PointHeadGoal

class PointHeadActionServer:
    def __init__(self):
        self.server = actionlib.SimpleActionServer('/head_controller/point_head_action',PointHeadAction, self.execute, False)
        self.server.start()

    def execute(self, goal):
        rospy.loginfo(goal)
        self.server.set_succeeded()

def main():
    rospy.init_node('point_head_action_server')
    PointHeadActionServer()
    rospy.spin()

main()