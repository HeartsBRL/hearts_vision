#!/usr/bin/env python
import rospy

rospy.init_node('hello')
rospy.loginfo("Hello, ROS! at %s", rospy.get_time())
rospy.spin()

