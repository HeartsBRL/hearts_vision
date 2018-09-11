#!/usr/bin/env python

__author__ = "Steve Battle"
__email__ = "steve.battle@uwe.ac.uk"

# Oriented FAST and Rotated BRIEF (ORB) feature detector
# Rotation and translation invariant feature descriptors
# see http://www.willowgarage.com/sites/default/files/orb_final.pdf

DETECTOR = 'orb_detector'

import rospy
from sensor_msgs.msg import Image
from std_msgs.msg import String
from geometry_msgs.msg import Point
import cv2 as cv
from cv_bridge import CvBridge, CvBridgeError
import json
import argparse
import os
import constants
import numpy as np
import matplotlib
from matplotlib import pyplot as plt
from vision.msg import Percept
import copy

ap = argparse.ArgumentParser()
ap.add_argument('json', help="configuration file")
ap.add_argument('images', help="image directory")
ap.add_argument('--thresh', type=float, default=0.0, help="threshold")

# this is required to ignore additional args added by roslaunch
args = ap.parse_known_args()[0]

image = None
latest_image = None
image_buffer = None
gaze = None
active = False
fig = None

class Detector:
    def __init__(self, data):
        self.data = data
        # alternative constructors for different versions of openCV
        # self.orb = cv.ORB()
        self.orb = cv.ORB_create()
        # Brute force matching with Hamming distance
        self.bf = cv.BFMatcher(cv.NORM_HAMMING2)

        for objectID in self.data:
            o = self.data[objectID]
            if 'images' in o:
                images = o['images']
                n = len(images)

                # load images and feature descriptors
                img = [None]*n
                des = [None]*n
                key = [None]*n

                for i in range(n):
                    img[i] = cv.imread(images[i])
                    key[i], des[i] = self.orb.detectAndCompute(img[i], None)

                o['img'] = img
                o['keypoints'] = key
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
        global args

        # compute feature descriptors for input image
        key, des = self.orb.detectAndCompute(image, None)

        scores = {}
        maximum = 0
        index = 0
        best_match = None

        for objectID in self.data:
            o = self.data[objectID]
            descriptors = o['descriptors']

            # keep track of best for this object
            best = 0
            for i in range(len(descriptors)):
                try:
                    matches = self.bf.knnMatch(descriptors[i], des, k=2)
                    matches = self.goodMatches(matches)
                    score = len(matches)
                    best = max(best,score)
                    if score>maximum:
                        index = i
                        best_match = matches
                        maximum = score
                except:
                    rospy.logerr("KNNMATCH")

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

        h, w = image.shape[:2]
        minx = w
        miny = h
        maxx = 0
        maxy = 0

        # provide visual feedback
        if obj is not None and score>=args.thresh:
            o = self.data[objectID]
            im1 = cv.cvtColor(o['img'][index], cv.COLOR_BGR2RGB)
            im2 = cv.cvtColor(image, cv.COLOR_BGR2RGB)
            kp1 = o['keypoints'][index]

            for m in best_match:
                ti = m.trainIdx
                x,y = key[ti].pt
                minx = int(min(minx,x))
                miny = int(min(miny,y))
                maxx = int(max(maxx,x))
                maxy = int(max(maxy,y))

            #img = cv.rectangle(image,(minx,miny),(maxx,maxy),(0,255,0),5)
            img = cv.drawMatches(im1,kp1,im2,key,best_match,None,flags=2)
            plt.ion()
            plt.imshow(img)
            plt.show()
            plt.pause(0.001)

        return obj, score, (minx,miny), (maxx,maxy)

def image_callback(msg):
    global latest_image
    latest_image = msg

def gaze_callback(msg):
    global gaze
    global image_buffer
    global latest_image
    gaze = msg
    image_buffer = latest_image

def control_callback(msg):
    global active
    global fig

    if msg.data == 'stop':            
        active = False
    elif msg.data == 'start':
        active = True

def main(args):
    global bridge
    global image_buffer
    global gaze
    global active
    global fig

    with open(args.json,"r") as file:
        config = json.load(file)

    rospy.init_node(DETECTOR)

    # Instantiate CvBridge between opencv and ROS
    bridge = CvBridge()

    # subscribe to head movements (gaze)
    gazeTopic = "vision/control/gaze"
    rospy.Subscriber(gazeTopic, Point, gaze_callback)

    # create an image subscriber
    imageTopic = "/xtion/rgb/image_raw"
    rospy.Subscriber(imageTopic, Image, image_callback)

    # create an control topic subscriber
    controlTopic = "/vision/control"
    rospy.Subscriber(controlTopic, String, control_callback)

    # publish percepts
    perceptTopic = "/vision/perception"
    pub = rospy.Publisher(perceptTopic, Percept, queue_size=1)


    # change working directory prior to loading images
    os.chdir(args.images)
    d = Detector(config)

    # set rate to 1Hz
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():

        #fig.set_visible(active)
        #plt.draw()

        if not active and not(fig is None):
            matplotlib.pyplot.close(fig)
            fig = None

        if active and not image_buffer is None:
            if fig is None:
                fig=matplotlib.pyplot.figure(figsize=(10, 5))

            image_raw = copy.copy(image_buffer)
            try:
                # Convert ROS Image message to OpenCV2
                image = bridge.imgmsg_to_cv2(image_raw, "bgr8")
            except CvBridgeError, e:
                rospy.logerr(e)
                image_buffer = None
                continue

            g = gaze
            obj, score, topLeft, bottomRight = d.detect(image)
            # minimum threshold
            if score>=args.thresh:
                # publish the findings on the vision/perception topic
                p = Percept()
                p.image = image_raw
                p.source = "/xtion/rgb/image_raw"
                p.object_id = obj
                p.score = score
                p.detector = DETECTOR
                tl = Point()
                br = Point()
                tl.x, tl.y = topLeft
                br.x, br.y = bottomRight
                p.topLeft = tl
                p.bottomRight = br
                if not g is None:
                    p.gaze = g
                pub.publish(p)

        rate.sleep()

main(args)
