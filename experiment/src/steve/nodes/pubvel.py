#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
import random

rospy.init_node('publish_velocity')
pub = rospy.Publisher('turtle1/cmd_vel',Twist, queue_size=1)

rate = rospy.Rate(1)
while not rospy.is_shutdown():
    msg = Twist()
    msg.linear.x = random.random()
    msg.angular.z = random.uniform(-1,1)
    pub.publish(msg)
    rate.sleep()
