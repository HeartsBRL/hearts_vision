#!/bin/bash

# Publisher issues random directions to tiago on topic '/mobile_base_controller/cmd_vel'

# run before:
# ./steel.sh
source devel/setup.bash
rosrun steve tiagovel.py

