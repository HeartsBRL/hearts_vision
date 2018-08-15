#!/bin/bash

# instruct control.py to start head movement sequence
rostopic pub -1 /vision/control std_msgs/String start