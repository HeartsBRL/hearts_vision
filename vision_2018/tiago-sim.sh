#!/bin/bash

# Tiago steel look_to_point world
source ~/tiago_public_ws/devel/setup.bash
roslaunch tiago_gazebo tiago_gazebo.launch robot:=steel public_sim:=true world:=look_to_point
