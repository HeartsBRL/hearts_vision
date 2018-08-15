#!/usr/bin/env python

__author__ = "Steve Battle"
__email__ = "steve.battle@uwe.ac.uk"

# Oriented FAST and Rotated BRIEF (ORB) feature detector
# Rotation and translation invariant feature descriptors
# see http://www.willowgarage.com/sites/default/files/orb_final.pdf

import rospy
from sensor_msgs.msg import Image
import cv2 as cv
from cv_bridge import CvBridge, CvBridgeError
import json
import argparse
import os
import constants
from vision.msg import Percept

ap = argparse.ArgumentParser()
ap.add_argument('json', help="configuration file")
ap.add_argument('images', help="image directory")
ap.add_argument('--thresh', type=float, default=0.6, help="image directory")

# this is required to ignore additional args added by roslaunch
args = ap.parse_known_args()[0]

image = None
raw_image = None

def image_callback(msg):
    global bridge
    global image
    global raw_image
    try:
        # Convert ROS Image message to OpenCV2
        raw_image = msg
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
        scores = {}
        for objectID in self.data:
            o = self.data[objectID]
            descriptors = o['descriptors']
            best = 0
            for i in range(len(descriptors)):
                matches = self.bf.knnMatch(descriptors[i], des, k=2)
                matches = self.goodMatches(matches)
                score = len(matches)
                best = max(best,score)

            # best score for this object
            scores[objectID] = best

        # find the best and worst object matches
        best = 0
        worst = float("inf")
        obj = None        
        for objectID in self.data:       
            obj = objectID if scores[objectID]>best else obj
            best = max(best,scores[objectID])
            worst = min(worst,scores[objectID])

        dataRange = float(best-worst)
        score = round(dataRange/best,2)
        rospy.loginfo("{0} score:{1}".format(obj,score))
        return obj, score

def main(args):
    global bridge
    global raw_image

    print os.getcwd()

    with open(args.json,"r") as file:
        config = json.load(file)

    rospy.init_node('orb_detector')

    # Instantiate CvBridge
    bridge = CvBridge()

    # create an image subscriber
    imageTopic = "/xtion/rgb/image_raw"
    rospy.Subscriber(imageTopic, Image, image_callback)

    # publish percepts
    perceptTopic = "/vision/perception"
    pub = rospy.Publisher(perceptTopic, Percept, queue_size=1)

    # change working directory prior to loading images
    os.chdir(args.images)
    d = Detector(config)

    # set rate to 1Hz
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        if not image is None:
            img = image
            raw = raw_image
            obj, score = d.detect(image)
            # minimum threshold
            if score>=args.thresh:
                # publish the findings on the vision/perception topic
                p = Percept()
                p.image = raw
                p.source = "/xtion/rgb/image_raw"
                p.object_id = obj
                p.score = score
                p.detector = "orb_detector"
                pub.publish(p)

        rate.sleep()

main(args)