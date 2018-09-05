#!/usr/bin/env python

__author__ = "Steve Battle"
__email__ = "steve.battle@uwe.ac.uk"

# People detector SVM with HOG (Histograms of Oriented Gradients)
# see: https://www.pyimagesearch.com/2015/11/09/pedestrian-detection-opencv/

DETECTOR = "hog_detector"
# scale images to WIDTH to improve speed & accuracy
WIDTH = 400

import rospy
from sensor_msgs.msg import Image
from geometry_msgs.msg import Point
from std_msgs.msg import String
import cv2 as cv
from cv_bridge import CvBridge, CvBridgeError
import argparse
import numpy as np
import constants
from vision.msg import Percept
import copy

ap = argparse.ArgumentParser()
ap.add_argument('--thresh', type=float, default=0.5, help="threshold")

# this is required to ignore additional args added by roslaunch
args = ap.parse_known_args()[0]

image = None
latest_image = None
image_buffer = None
gaze = None
active = False

def gaze_callback(msg):
    global gaze
    global image_buffer
    global latest_image
    gaze = msg
    image_buffer = latest_image

def image_callback(msg):
    global latest_image
    latest_image = msg

def control_callback(msg):
    global active
    if msg.data == 'stop':
        if active:
            # close the window
            cv.destroyWindow(DETECTOR)
            cv.waitKey(1)
        active = False

    elif msg.data == 'start':
        active = True

class Detector:
    def __init__(self):        
        # initialize the HOG descriptor/person detector
        self.hog = cv.HOGDescriptor()
        self.hog.setSVMDetector(cv.HOGDescriptor_getDefaultPeopleDetector())

    def detect(self, image):
        # resize the image to reduce detection time and improve accuracy
        #img = imutils.resize(image, width=min(WIDTH, image.shape[1]))
        h, w = image.shape[:2]
        scale = WIDTH/float(w)
        img = cv.resize(image, (0,0), fx=scale, fy=scale)

        # detect people in the image
        # The weight returned by the method for each ROI is the distance from the sample 
        # to the SVM separating hyperplane (in its corresponding kernel space). 
        # Therefore, a larger distance indicates a sample classifier with a larger confidence.
        # see: http://answers.opencv.org/question/95042/hog-detectmultiscale-weight-scale-explanation/
        rects, weights = self.hog.detectMultiScale(img, winStride=(4, 4), padding=(8, 8), scale=1.05)

        score = 0
        tl = Point()
        br = Point()

        # find best match and draw bounding box, and show central point (returned)
        if len(rects)>0:
            score = np.max(weights)
            x, y, w, h = rects[np.argmax(weights)]
            img = cv.rectangle(img, (x, y), (x+w, y+h), (0, 255, 0), 2)
            #cv.circle(img, (x+w/2, y+h/2), 5, (0, 255, 0), -1)
            # upscale point to original dimensions
            tl.x = int(x/scale)
            tl.y = int(y/scale)
            br.x = int((x+w)/scale)
            br.y = int((y+h)/scale)

        # provide visual feedback
        cv.imshow(DETECTOR, img)
        cv.waitKey(1)

        return score, tl, br

def main(args):
    global bridge
    global image_buffer
    global gaze
    global active

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

    d = Detector()

    # set rate to 1Hz
    rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        if active and not image_buffer is None:
            image_raw = copy.copy(image_buffer)
            try:
                # Convert ROS Image message to OpenCV2
                image = bridge.imgmsg_to_cv2(image_raw, "bgr8")
            except CvBridgeError, e:
                rospy.logerr(e)
                image_buffer = None
                continue

            g = gaze
            score, tl, br = d.detect(image)
            # minimum threshold
            rospy.loginfo("hog score: "+str(score))
            if score>=args.thresh:
                # publish the findings on the vision/perception topic
                p = Percept()
                p.image = image_raw
                p.source = "/xtion/rgb/image_raw"
                p.object_id = constants.PERSON_ID
                p.score = score
                p.detector = DETECTOR
                p.topLeft = tl
                p.bottomRight = br
                if not g is None:
                    p.gaze = g
                pub.publish(p)

        rate.sleep()

main(args)