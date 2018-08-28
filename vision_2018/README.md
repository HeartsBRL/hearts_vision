Tiago ROS Vision 2018
=====================

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

This can be used from shell scipt files ./start.sh and ./stop.sh

kill controller with:
rosnode kill /control

View the output on the vision/control/gaze topic with:
rostopic echo /vision/control/gaze

You can also manually override the gaze control with a request request, for example:
rostopic pub -1 /vision/control/request geometry_msgs/Point 1 0 1

To run the controller against the Tiago sim do run the following in separate terminals in the experiment folder:
./tiago.sh
./watch.sh

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
geometry_msgs/Point topLeft
geometry_msgs/Point bottomRight

The score is a float in the range [0,1] with 1 being a perfect match. Scores below a threshold are not published. The object-id is defined in config.json that also defines the raw query images that capture each object from a number of different aspects. The output window shows the feature mapping from the stored query images to the input image.

You can run ithe orb-detector directly on the Tiago sim using a launch file (orb.launch)

./tiago.sh
./orb.sh

And start/stop the gaze control with:
./start.sh
./stop.sh

Even though it is 'trained' on images of real Pringles tubes, incredibly it recognises the simulated Pringles.

hog_detector.py
---------------

The hog_detector is an OpenCV People detector SVM with HOG (Histograms of Oriented Gradients)
see: https://www.pyimagesearch.com/2015/11/09/pedestrian-detection-opencv/

It reads images from the "/xtion/rgb/image_raw" image Topic, and outputs perception events on the "/vision/perception" percept topic. This is of type vision.msg/Percept. The output window shows a bounding box around a humanly recognisable feature, or set of features with the best score.

It can be run in the Tiago sim which includes a human profile which achieves some recognition, but it appears to perform better on real images.

./tiago.sh
./hog.sh

Turn the Tiago to face the human with:
./rotate.sh

Start/stop an up-down head scanning (using control.py) with
./start
./stop

percept_client.py
-----------------

The output from both the orb and hog detectors can be viewed with the percept_client.py run from both launchers described above. It produces a window containing an image and a bounding box around the object detected.

gaze.py
-------

This code directs gaze towards objects recognised with high confidence, steering Tiago's head to
move them towards the centre of the frame. It also captures and saves the best image
within a start/stop period marked out by the start/stop events.

Like the percept-client it produces a window containing an image and a bounding box around the object detected, with a line drawn to the centre of the image which acts as the control vector for gaze control.

It subscribes and responds to to perception events on topic "/vision/perception"
It consumes gaze output from the controller, Points in the base_link coordinate frame, on topic "vision/control/gaze"
It controls Tiago's gaze by publishing requests, Points in the base_link coordinate frame, on topic "/vision/control/request"
The window of observation is marked out by start/stop events on "/vision/control"
The launch file invokes gaze.py with an argument that specifies the image save directory.

The following runs gaze control with the orb object detector

./tiago.sh
./orb-gaze.sh

Start with ./start.sh
Stop with ./stop.sh (then check the photo save directory)

The best way to kill everything is to:
./stop.sh
./kill.sh
Then ctl-c the launch window
