#!/bin/bash

# test dependency:
# ./mock-image-raw.sh

source devel/setup.bash
rosrun steve mock-image-raw.py 'photos/cv - 5.jpg' 'photos/cv - 6.jpg' 'photos/cv - 7.jpg' 'photos/cv - 8.jpg' 'photos/cv - 9.png'