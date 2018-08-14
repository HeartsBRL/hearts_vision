#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image
import cv2 as cv
from cv_bridge import CvBridge, CvBridgeError
import json
import argparse
import os
import constants

ap = argparse.ArgumentParser()
ap.add_argument('json', help="configuration file")
ap.add_argument('images', help="image directory")
args = ap.parse_args()

image = None

def image_callback(msg):
    global bridge
    global image
    try:
        # Convert ROS Image message to OpenCV2
        image = bridge.imgmsg_to_cv2(msg, "bgr8")
    except CvBridgeError, e:
        print(e)
    else:
        cv.imshow('image', image)
        #cv.waitKey(1)

class Detector:
    def __init__(self, data):
        self.data = data
        self.orb = cv.ORB_create()
        # Brute force matching with Hamming distance
        self.bf = cv.BFMatcher(cv.NORM_HAMMING2)

        for objectID in self.data:
            o = self.data[objectID]
            images = o['images']
            n = len(images)

            # load images and feature descriptors
            img = [None]*n
            des = [None]*n

            for i in range(n):
                img[i] = cv.imread(images[i])
                des[i] = self.orb.detectAndCompute(img[i], None)[1]

            o['descriptors'] = des
        
    # Lowe ratio test
    # see https://docs.opencv.org/3.3.0/dc/dc3/tutorial_py_matcher.html
    # see https://www.cs.ubc.ca/~lowe/papers/ijcv04.pdf

    def goodMatches(self,m):
        good = []
        for m,n in m:
            if m.distance < constants.LOWE_RATIO*n.distance:
                good.append(m)
        return good

    def detect(self, image):
        # compute feature descriptors for input image
        des = self.orb.detectAndCompute(image, None)[1]
        # record best/worst match and object
        best = 0
        worst = float("inf")
        obj = None

        for objectID in self.data:
            o = self.data[objectID]
            descriptors = o['descriptors']
            for i in range(len(descriptors)):
                matches = self.bf.knnMatch(descriptors[i], des, k=2)
                matches = self.goodMatches(matches)
                score = len(matches)
                best = max(best,score)
                worst = min(worst,score)
                obj = objectID if score>best else obj
                dispersion = best/float(worst)
                rospy.loginfo("{0} score:{1} dispersion:{2}".format(objectID,best,worst))

def main(args):
    global bridge
    global image

    with open(args.json,"r") as file:
        config = json.load(file)

    rospy.init_node('orb_detector')

    # Instantiate CvBridge
    bridge = CvBridge()

    # create an image subscriber
    imageTopic = "/xtion/rgb/image_raw"
    rospy.Subscriber(imageTopic, Image, image_callback)

    # change working directory prior to loading images
    os.chdir(args.images)
    d = Detector(config)

    # set rate to 1Hz
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        if not image is None:
            d.detect(image)
        rate.sleep()

main(args)