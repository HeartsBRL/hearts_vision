#!/bin/bash

# send start, stop messages to the controller with:
# rostopic pub -1 /vision/control std_msgs/String start
# rostopic pub -1 /vision/control std_msgs/String stop

# request gaze e.g. x,y,z = 1,0,1
# rostopic pub -1 /vision/control/request geometry_msgs/Point 1 0 1

# doesn't work in my python virtual environment
#source ~/pyv/bin/activate
source devel/setup.bash
roslaunch vision cob-gaze.launch