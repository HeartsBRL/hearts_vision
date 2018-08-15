#!/bin/bash

# instruct control.py to stop head movement sequence
rostopic pub -1 /vision/control std_msgs/String stop