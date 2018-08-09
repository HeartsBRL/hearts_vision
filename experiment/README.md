Tiago ROS experiments
=====================

To run these experiments cd to the hearts_vision/experiment workspace

hello
-----
This is the 'hello world' of ROS, a node that logs "Hello, ROS!".
Adapted for Python from the example in 'A Gentle Introduction to ROS', O'Kane
The Python source in in src/steve/nodes

1 roscore
2 ./hello.sh

pubvel
------
Publishes random directions to the turtlesim on topic 'turtle1/cmd_vel'
Adapted for Python from the example in 'A Gentle Introduction to ROS', O'Kane

1 roscore
2 rosrun turtlesim turtlesim_node
3 ./pubvel.sh

tiagovel
--------
Publishes random directions to tiago on topic '/mobile_base_controller/cmd_vel'
It uses the Gazebo Tiago simulation with the 'steel' robot (gripper)
Adapted for Python and Tiago from the example in 'A Gentle Introduction to ROS', O'Kane

1 ./steel.sh
2 ./tiagovel.sh

looksee
-------
It uses the Gazebo Tiago simulation with the 'look_to_point' world

Key publisher issues keystrokes on topic 'keys' 
Python source from 'Programming Robots with ROS', Quigley et al
You can use the controls, x,X,y,Y,z,Z to steer Tiago's head (gaze).

'look_see' node publishes head directions to tiago on topic '/head_controller/point_head_action'
It uses the base_link coordinate frame rigidly attached to the mobile robot base. 
In relation to a body the standard is: x forward, y left, z up.
See: http://www.ros.org/reps/rep-0103.html and http://www.ros.org/reps/rep-0105.html
It converts the ROS Image from the (simulated) camera to OpenCV2 and displays this in a window.

1 ./look.sh
2 ./key.sh
3 ./looksee.sh

lookcanny
---------
This is like looksee above, but uses OpenCV Canny edge-detection
see: https://docs.opencv.org/3.0-beta/doc/py_tutorials/py_imgproc/py_canny/py_canny.html#canny
It converts the ROS Image from the (simulated) camera to OpenCV2, applies greyscale and canny then displays this in a window.

1 ./look.sh
2 ./key.sh
3 ./lookcanny.sh

rm-background
-------------
This is a Python script (can be run independently of ROS from the command line or IDLE)
The script is: src/steve/scripts/rm-background.py

This code takes images saved from the Tiago sim camera (Pringles, biscuits, etc) and removes the background leaving only the object of interest (Pringles) - change the code to change the object.
It uses the OpenCV MOG2 background subtractor, a threshold function to binarize the image, then bitwise AND of the image and the mask to isolate the object of interest.

1. cd experiment
2. ./rm-background.sh

features.py
-----------
This is a Python script (best run from IDLE) src/steve/scripts/features.py

This code compares a target image (Pringles sans background) to a number of other images (with backgrounds) and scores them by the number of matching features. It uses the ORB feature detector that finds rotation and translation invariant feature descriptors, uses brute-force matching, then scores each one according to the number of _good_ matches using the Lowe ratio test.

It outputs the target features as an image then lists the scores for each image.

cd experiment
./features.sh

