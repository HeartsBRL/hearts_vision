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

The following are real-world tests of MOG2 background removal and ORB feature detection. The query images were taken of a can of pringles against a white sheet (as featureless as can be managed). I used a tripod to keep the camera image stable and switched off auto-focus. The test images are taken against a different background but at approximately the same angle and orientation. The correct image is identified, but with low confidence (a score of 8, compared to 6 for the wine box).

cd experiment
./rm-background-pringles.sh
./feature.pringles.sh

photos/cv - 5.jpg 4
photos/cv - 6.jpg 8
photos/cv - 7.jpg 4
photos/cv - 8.jpg 6

Compare this with the test of ORB feature detection against a plain background (white sheet). The feature detector operates much better, identifying features on the pringles tube.

photos/cv - 5.jpg 36
photos/cv - 6.jpg 47
photos/cv - 7.jpg 7
photos/cv - 8.jpg 9

The recommendation from these experiments is to take photos against a featureless background, Autofocus off, using a tripod. There is then no need to use MOG2 background removal.

watch.py
--------

This is a node that subscribes to the imge topic '/xtion/rgb/image_raw' and displays it in a window. We see what the robot sees.

cd experiment
./look.sh

In a new terminal:
cd experiment
./watch.sh

control.py
----------
Tiago head controller. It can cycle through a number of head orientations and add a configurable random offset to each.

send start, stop messages to the controller with:
rostopic pub -1 /vision/control std_msgs/String start
rostopic pub -1 /vision/control std_msgs/String stop

request gaze e.g. x,y,z = 1,0,1
rostopic pub -1 /vision/control/request geometry_msgs/Point 1 0 1

kill controller with:
rosnode kill /control

You can test it with a mock action server substituting for the Tiago:
roscore
./mock-action-server.sh
./control1.sh

View the output on the vision/control/gaze topic with:
rostopic echo /vision/control/gaze

You can also manually override the gaze control with a request request, for example:
rostopic pub -1 /vision/control/request geometry_msgs/Point 1 0 1

To run the controller against the Tiago sim do run the following in separate terminals in the experiment folder:
./look.sh
./watch.sh
./control1.sh

The shell script control1.sh sets up a cyclic scanning pattern, that performs a high left-to-right scan, then a middling right-to-left scan, followed by a low left-to-right scan (with no randomness). These scanning patterns can be configured in the shell script.


orb-detector.py
---------------
This is a simple feature detector that subscribes to Tiago's image topic "/xtion/rgb/image_raw". 
It uses the OpenCV Oriented FAST and Rotated BRIEF (ORB) feature detector which provides rotation and translation invariant feature descriptors. See http://www.willowgarage.com/sites/default/files/orb_final.pdf

The output is on the /vision/perception topic. This is a complex type defined in the 'msg' folder of the package with the following elements:
sensor_msgs/Image image
string source
float32 score
string object_id
string detector
geometry_msgs/Point Point

The score is a float in the range [0,1] with 1 being a perfect match. Scores below a threshold are not published. The object-id is defined in config.json that also defines the raw query images that capture each objevct from a number of different aspects.

The orb-detector can be tested stand-alone by running the following in separate terminals. The mock-image-raw script loads test images from file, mocking the Tiago camera. The percept client consumes the orb-detector output and displays the matched images.

roscore
./mock-image-raw.sh
./percept-client.sh
./orb-detector.sh

You can also run ithe orb-detector directly on the Tiago sim without the mock nodes, and with the vision control node

./look.sh
./watch.sh
./control1.h
./orb-detector.sh
./percept-client.sh

And start the gaze control with:
rostopic pub -1 /vision/control std_msgs/String start

Even though it is 'trained' on images of real Pringles tubes, incredibly it recognises the simulated Pringles.

