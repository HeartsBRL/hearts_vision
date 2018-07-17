#!/usr/bin/env python
# 
# # launch Triago in Gazebo
# roslaunch tiago_gazebo tiago_gazebo.launch robot:=steel public_sim:=true world:=look_to_point
# see tiago_public_ws/src/tiago_tutorials/look_to_point/src/look_to_point.cpp.
# see also: https://codegists.com/snippet/python/examplespy_awesomebytes_python


import rospy
from control_msgs.msg import PointHeadAction, PointHeadGoal
from actionlib import SimpleActionClient

import random

rospy.init_node('look')

pub = rospy.Publisher('/head_controller/point_head_action', PointHeadAction, queue_size=1)

# To send goals to Point head action server
class Looker(object):
    def __init__(self):
        rospy.loginfo("Initializing Looker...")
        self.ac = SimpleActionClient(
            '/head_controller/point_head_action', PointHeadAction)
        rospy.loginfo("Connecting to /head_controller/point_head_action...")
        # If more than 5s pass by, we crash
        self.ac.wait_for_server(rospy.Duration(5.0))
        rospy.loginfo("Connected!")
 
    def look_at(self, x, y, z, block=True):
        # x is forward, y is left-right (positive is left), z is height
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

# Create a looker object
looker = Looker()

# set rate to 3Hz for continuous motion (Tiago stops for safety reasons after 1 second)
rate = rospy.Rate(1)
while not rospy.is_shutdown():
    x = random.uniform(-1,1)
    y = random.uniform(-1,1)
    z = 1
    # Use it to look at a position, e.g. x=1 meter forward, y = right 0.5m, z = 1m tall
    looker.look_at(x, y, z, block=False)
    rate.sleep()