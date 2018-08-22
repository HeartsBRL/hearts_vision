#!/bin/bash

# source this file to persist exported variables
export ROS_MASTER_URI="http://10.68.0.1:11311"
export ROS_IP=$(echo -e $(hostname -I) | tr -d '[:space]')
