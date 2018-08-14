#!/bin/bash

# Tiago gaze control
# depends:
# roscore
# ./mock-action-server.sh

# send start, stop messages to the controller with:
# rostopic pub -1 /vision/control std_msgs/String start
# rostopic pub -1 /vision/control std_msgs/String stop

# request gaze e.g. x,y,z = 1,0,1
# rostopic pub -1 /vision/control/request geometry_msgs/Point 1 0 1

# kill controller with:
# rosnode kill /control

source devel/setup.bash
rosrun steve control.py --wait 1 --bounds 0 0 0 --coords UP_LEFT UP UP_RIGHT RIGHT AHEAD LEFT DOWN_LEFT DOWN DOWN_RIGHT
