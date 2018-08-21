#!/bin/bash

# send start, stop messages to the controller with:
# rostopic pub -1 /vision/control std_msgs/String start
# rostopic pub -1 /vision/control std_msgs/String stop

# request gaze e.g. x,y,z = 1,0,1
# rostopic pub -1 /vision/control/request geometry_msgs/Point 1 0 1

source devel/setup.bash
roslaunch vision orb.launch