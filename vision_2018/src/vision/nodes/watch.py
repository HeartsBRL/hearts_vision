#!/usr/bin/env python

__author__ = "Steve Battle"
__email__ = "steve.battle@uwe.ac.uk"

# # launch Triago in Gazebo
# roslaunch tiago_gazebo tiago_gazebo.launch robot:=steel public_sim:=true world:=look_to_point
# see tiago_public_ws/src/tiago_tutorials/look_to_point/src/look_to_point.cpp.
# see also: https://codegists.com/snippet/python/examplespy_awesomebytes_python
# see also: https://gist.githubusercontent.com/rethink-imcmahon/77a1a4d5506258f3dc1f/raw/610716f688976c85c0158455aefc7ecb7dcf4821/ros_image_saver.py
# see also: http://wiki.ros.org/pr2_controllers/Tutorials/Moving%20the%20Head
import rospy
from sensor_msgs.msg import Image
import cv2
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import String

rospy.init_node('watch')

# Instantiate CvBridge
bridge = CvBridge()

def image_callback(msg):
    try:
        # Convert ROS Image message to OpenCV2
        img = bridge.imgmsg_to_cv2(msg, "bgr8")
    except CvBridgeError, e:
        print(e)
    else:
        cv2.imshow('watch', img)
        cv2.waitKey(1)

def main():
    # create an image subscriber
    imageTopic = "/xtion/rgb/image_raw"
    rospy.Subscriber(imageTopic, Image, image_callback)
    rospy.spin()

main()
