#!/bin/bash

# instruct control.py to stop head movement sequence
rostopic pub -1 /vision/control std_msgs/String stop

# kill control.py
rosnode kill /control
rosnode kill /orb_detector
rosnode kill /hog_detector
rosnode kill /gaze
rosnode kill /watch
rosnode kill /cob_adapter