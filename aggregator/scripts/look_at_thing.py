#!/usr/bin/env python

import rospy
from actionlib import SimpleActionClient
from geometry_msgs.msg import PointStamped, PoseStamped
from control_msgs.msg import PointHeadAction, PointHeadGoal


def look_at(pose):
    goal = PointHeadGoal()
    point = PointStamped()
    point.point.x = pose.pose.position.x
    point.point.y = pose.pose.position.y
    point.point.z = pose.pose.position.z
    point.header.frame_id = "/xtion_rgb_optical_frame"

    goal.pointing_frame = "/xtion_rgb_optical_frame"
    goal.pointing_axis.x = 0.0;
    goal.pointing_axis.y = 0.0;
    goal.pointing_axis.z = 1.0;
    goal.min_duration = rospy.Duration(1)
    goal.max_velocity = 0.25
    goal.target = point
    headMove.send_goal_and_wait(goal)
    headP.publish(goal)

rospy.init_node('look_at')
rospy.Subscriber('/look_at',PoseStamped,look_at)

headMove = SimpleActionClient('/head_controller/point_head_action', PointHeadAction)
headMove.wait_for_server()
headP = rospy.Publisher('/head_controller/point_head_action/goal',PointHeadGoal,queue_size=1)
rospy.spin()

#if __name__ == '__main__':
