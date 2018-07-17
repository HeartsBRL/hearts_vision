#!/bin/bash

# key publisher issues keystrokes on topic 'keys'
# see: 'Programming Robots with ROS', Quigley et al

# run before:
# ./look.sh

source devel/setup.bash
rosrun steve key_publisher.py
