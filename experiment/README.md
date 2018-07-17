Tiago ROS experiments

To run these experiments cd to the hearts_vision/experiment workspace

hello
-----
This is the 'hello world' of ROS, a node that logs "Hello, ROS!".
Adapted for Python from the example in 'A Gentle Introduction to ROS', O'Kane
The Python source in in src/steve/nodes

$ roscore
$ ./hello.sh

pubvel
------
Publishes random directions to the turtlesim on topic 'turtle1/cmd_vel'
Adapted for Python from the example in 'A Gentle Introduction to ROS', O'Kane

$ roscore
$ rosrun turtlesim turtlesim_node
$ ./pubvel.sh

tiagovel
--------
Publishes random directions to tiago on topic '/mobile_base_controller/cmd_vel'
It uses the Gazebo Tiago simulation with the 'steel' robot (gripper)
Adapted for Python and Tiago from the example in 'A Gentle Introduction to ROS', O'Kane

$ ./steel.sh
$ ./tiagovel.sh

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

$ ./look.sh
$ ./key.sh
$ ./looksee.sh

lookcanny
---------
This is like looksee above, but uses OpenCV Canny edge-detection
see: https://docs.opencv.org/3.0-beta/doc/py_tutorials/py_imgproc/py_canny/py_canny.html#canny
It converts the ROS Image from the (simulated) camera to OpenCV2, applies greyscale and canny then displays this in a window.

$ ./look.sh
$ ./key.sh
$ ./lookcanny.sh
