#!/bin/bash

# Tiago gaze control
# depends:
# roscore

# kill action server with:
# rosnode kill /point_head_action_server

source devel/setup.bash
rosrun steve mock-action-server.py
