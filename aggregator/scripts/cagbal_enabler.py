#!/usr/bin/env python
import sys
import roslib #Ros libraries
import rospy #Python library
import tf #ROS Transform library
from cob_perception_msgs.msg import DetectionArray, Detection#, DetectionLife, Life #Cagbal messages
from geometry_msgs.msg import PoseStamped
from std_msgs.msg import String
import roslaunch
import rospy


class PS_broadcaster():

    def __init__(self):
        self.uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
        roslaunch.configure_logging(self.uuid)
        self.obj_launch = roslaunch.parent.ROSLaunchParent(self.uuid, ["/home/assistedliving/workspaces/hearts_erl/src/hearts_vision/aggregator/launch/object_detector.launch"])
        self.face_launch = roslaunch.parent.ROSLaunchParent(self.uuid, ["/home/assistedliving/workspaces/hearts_erl/src/hearts_vision/aggregator/launch/face_detector.launch"])
    def decision_making(self):

        rate = rospy.Rate(10) # update rate of 10hz
        self.obj_launch.start()
        while not rospy.is_shutdown():
            rospy.loginfo("Only objects!")
            input("Press to add face recog")
            self.face_launch.start()
            rospy.loginfo("Detecting faces")
            input("Press to remove face recog")
            self.face_launch.shutdown()
            rate.sleep()
        self.obj_launch.shutdown()
        rospy.loginfo("Everything is OFF")




################################MAIN SCRIPT#############################

if __name__ == '__main__': #Main function that calls other functions

    rospy.init_node('launch_manager', anonymous=True) # Node initialisation ANONYMOUS=True to allow different nodes with the same name
    n = PS_broadcaster() #Class instantiation
    n.decision_making()
    rospy.spin() # spin() simply keeps python from exiting until this node is stopped
