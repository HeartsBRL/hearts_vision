#!/bin/bash

# Tiago steel
source ~/tiago_public_ws/devel/setup.bash
roslaunch tiago_gazebo tiago_gazebo.launch public_sim:=true robot:=steel
