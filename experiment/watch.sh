#!/bin/bash

# key publisher issues keystrokes on topic 'keys'
# Publisher issues head directions to tiago on topic '/head_controller/point_head_action'

# run before:
# ./look.sh

source devel/setup.bash
rosrun steve watch.py
