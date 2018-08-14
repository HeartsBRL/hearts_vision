#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2 as cv
import argparse

ap = argparse.ArgumentParser()
ap.add_argument('images', nargs='+')
args = ap.parse_args()

def main(args):
    # Instantiate CvBridge
    bridge = CvBridge()

    n = len(args.images)
    img = [None]*n
    for i in range(n):
        img[i] = cv.imread(args.images[i])
        # Convert openCV2 image to ROS Image message
        #img = bridge.imgmsg_to_cv2(msg, "bgr8")
        img[i] = bridge.cv2_to_imgmsg(img[i], "bgr8")

    rospy.init_node('mock_image_raw')
    imageTopic = "/xtion/rgb/image_raw"
    pub = rospy.Publisher(imageTopic, Image, queue_size=1)

    # cycle through the images
    i = 0
    # set rate to 0.1Hz
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        pub.publish(img[i])
        i = (i+1)%n
        rate.sleep()

main(args)