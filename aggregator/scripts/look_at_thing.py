#!/usr/bin/env python

import rospy
from actionlib import SimpleActionClient
from geometry_msgs import PointStamped
from control_msgs import PointHeadAction, PointHeadGoal


def look_at(pose):
    goal = PointHeadGoal()
    point = PointStamped()
    point.point.x = pose.pose.position.x
    point.point.y = pose.pose.position.y
    point.point.z = pose.pose.position.z

    goal.pointing_frame = "/xtion_rgb_optical_frame"
    goal.pointing_axis.x = 0.0;
    goal.pointing_axis.y = 0.0;
    goal.pointing_axis.z = 1.0;
    goal.min_duration = rospy.Duration(1)
    goal.max_velocity = 0.25
    goal.target = point
    headMove.send_goal_and_wait(goal)



rospy.Subscriber('/look_at',PoseStamped,look_at)

headMove = SimpleActionClient('/point_head', PointHeadAction)
headMove.wait_for_server()

if __name__ == '__main__':
    rospy.init_node('look_at')
