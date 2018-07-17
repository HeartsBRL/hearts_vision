#!/bin/bashrosrun turtlesim turtlesim_node

# Publisher issues random directions to turtlesim on topic 'turtle1/cmd_vel'

# run before:
# roscore
# rosrun turtlesim turtlesim_node
source devel/setup.bash
rosrun steve pubvel.py

