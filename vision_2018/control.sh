#!/bin/bash

# Tiago gaze control
# depends:
# roscore
# ./mock-action-server.sh

# send start, stop messages to the controller with:
# rostopic pub -1 /vision/control std_msgs/String start
# rostopic pub -1 /vision/control std_msgs/String stop

# kill controller with:
# rosnode kill /control

# view gaze output:
# rostopic echo /vision/control/gaze

# request gaze
# rostopic pub -1 /vision/control/request geometry_msgs/Point 1 0 1

source devel/setup.bash
rosrun vision control.py
