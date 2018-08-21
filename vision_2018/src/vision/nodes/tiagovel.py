#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
import random

rospy.init_node('publish_velocity')
pub = rospy.Publisher('/mobile_base_controller/cmd_vel',Twist, queue_size=1)

# set rate to 3Hz for continuous motion (Tiago stops for safety reasons after 1 second)
rate = rospy.Rate(3)
while not rospy.is_shutdown():
    msg = Twist()
    msg.linear.x = 0 #random.random()
    msg.angular.z = -0.2 #random.uniform(-1,1)
    pub.publish(msg)
    rate.sleep()
