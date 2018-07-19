#!/usr/bin/env python
import rospy
import sys
import cv2

rospy.init_node('hello')
rospy.loginfo(sys.version)
rospy.loginfo(cv2.__version__)
rospy.loginfo("Hello, ROS! at %s", rospy.get_time())
rospy.spin()

