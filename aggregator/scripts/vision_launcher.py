#!/usr/bin/env python
import sys
import roslib #Ros libraries
import rospy #Python library
import roslaunch

from std_msgs.msg import Bool

class vision_sense():

    def __init__(self):
        self.args = rospy.myargv(argv=sys.argv) # rospy adapatation of sys arguments

        #Main variables for interaction with launch files
        self.uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
        roslaunch.configure_logging(self.uuid)
        self.obj_launch = roslaunch.parent.ROSLaunchParent(self.uuid, ["/home/hearts/workspaces/hearts_erl/src/hearts_vision/aggregator/launch/object_detector.launch"])
        self.face_launch = roslaunch.parent.ROSLaunchParent(self.uuid, ["/home/hearts/workspaces/hearts_erl/src/hearts_vision/aggregator/launch/face_detector.launch"])

        self.obj_sub = rospy.Subscriber('hearts_vision/obj_toggle', Bool, self.obj_toggle)
        self.face_sub = rospy.Subscriber('hearts_vision/face_toggle', Bool, self.face_toggle)

####Toggle object detection
    def obj_toggle(self,data):
        if data.data == True:
            self.obj_launch.start()
        else:
            self.obj_launch.shutdown()

####LToggle face recognition
    def face_toggle(self):
        if data.data == True:
            self.face_launch.start()
        else:
            self.face_launch.shutdown()

if __name__ == '__main__':
    rospy.init_node('vision_aggregator', anonymous=False) #Initialize node
    n = vision_sense() #Class instantiation
    rospy.spin() # spin() simply keeps python from exiting until this node is stopped
