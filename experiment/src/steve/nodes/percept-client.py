#!/usr/bin/env python

# rostopic echo /vision/perception

import rospy
import cv2 as cv
from cv_bridge import CvBridge, CvBridgeError
from steve.msg import Percept

def percept_callback(msg):
    print msg.source
    print msg.object_id
    print msg.score
    print msg.detector
    print
    img = bridge.imgmsg_to_cv2(msg.image, "bgr8")
    cv.imshow('image', img)
    cv.waitKey(1)

def main():
    global bridge

    rospy.init_node('percept_client')

    # Instantiate CvBridge
    bridge = CvBridge()

    # create a percept subscriber
    perceptTopic = "/vision/perception"
    rospy.Subscriber(perceptTopic, Percept, percept_callback)
    rospy.spin()

main()