#!/usr/bin/env python

__author__ = "Steve Battle"
__email__ = "steve.battle@uwe.ac.uk"

# rostopic echo /vision/perception

import rospy
import cv2 as cv
from cv_bridge import CvBridge, CvBridgeError
from vision.msg import Percept
from geometry_msgs.msg import Point

def percept_callback(msg):
    print msg.source
    print msg.object_id
    print msg.score
    print msg.detector
    print
    img = bridge.imgmsg_to_cv2(msg.image, "bgr8")

    tl = msg.topLeft
    br = msg.bottomRight
    img = cv.rectangle(img,(int(tl.x),int(tl.y)),(int(br.x),int(br.y)),(0,255,0),2)
    cv.imshow('percept_client', img)
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