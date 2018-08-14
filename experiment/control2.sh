#!/bin/bash

# Tiago gaze control
# depends:
# roscore
# ./mock-action-server.sh

# send start, stop messages to the controller with:
# rostopic pub /vision/control std_msgs/String start
# rostopic pub /vision/control std_msgs/String stop

# kill controller with:
# rosnode kill /control

source devel/setup.bash
rosrun steve control.py --wait 2 --bounds 0 0.25 0.25 --coords UP_LEFT UP UP_RIGHT RIGHT AHEAD LEFT DOWN_LEFT DOWN DOWN_RIGHT AHEAD
