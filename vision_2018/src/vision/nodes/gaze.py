#!/usr/bin/env python

__author__ = "Steve Battle"
__email__ = "steve.battle@uwe.ac.uk"

# This code directs gaze towards objects recognised with high confidence
# moving them towards the centre of the frame. It also captures the best image
# within a start/stop visual recognition window.

import rospy
import cv2 as cv
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import String
from vision.msg import Percept
from geometry_msgs.msg import Point
import math
import os
import argparse

NODE = 'gaze'

ap = argparse.ArgumentParser()
ap.add_argument('dir', help="image save directory")
ap.add_argument('--boredom', type=float, default=0.75, help="boredom threshold")

# this is required to ignore additional args added by roslaunch
args = ap.parse_known_args()[0]

# weighted score of WEIGHT_MATCH*match + (1-WEIGHT_MATCH)*(1-distance)
WEIGHT_MATCH = 0.9
FACTOR = 0.0005
PERIODS = 10

# best match in this time window
bestScore = 0
bestID = None
bestImage = None
active = False
weight = 2/(PERIODS+1.0)

# most recent reported direction of gaze
#gaze = None
requestPub = None

# count number of files in the save directory
fileCount = -1

# exponential moving average
ema = 0
activation = 0
previous = 0

def percept_callback(msg):
    global bestScore
    global bestID
    global bestImage
    global gaze
    global args
    global last_time
    global ema
    global activation

    if not active:
        return

    img = bridge.imgmsg_to_cv2(msg.image, "bgr8")

    # image centre
    h, w = img.shape[:2]
    cx, cy = w/2, h/2

    # provide visual feedback of the image recognised
    tl = msg.topLeft
    br = msg.bottomRight

    # calculate the midpoint of the diagonal across the bounding box
    mx, my = int((tl.x + br.x)/2), int((tl.y + br.y)/2)

    img = cv.line(img,(cx,cy),(mx,my),(0,0,255),2)
    img = cv.circle(img, (cx,cy), 5, (0,0,255), -1)
    img = cv.circle(img, (mx,my), 5, (0,255,0), -1)
    img = cv.rectangle(img,(int(tl.x),int(tl.y)),(int(br.x),int(br.y)),(0,255,0),2)

    # normalize distance to be within interval [0,1] (with 1 corresponding to image diagonal d)
    d = math.sqrt(math.pow(h,2) + math.pow(w,2))
    l = math.sqrt(math.pow(mx-cx,2) + math.pow(my-cy,2))
    score = WEIGHT_MATCH*msg.score + (1-WEIGHT_MATCH)*(1-(l/d))

    # capture image
    if score>bestScore:
        bestScore = score
        bestID = msg.object_id
        bestImage = bridge.imgmsg_to_cv2(msg.image, "bgr8")
    
    activation = max(activation,score)

    # turn towards the object
    # The base_link coordinate frame is relative to the mobile robot base: x forward, y left(+ve)/right(-ve), z height
    # see: http://www.ros.org/reps/rep-0103.html and http://www.ros.org/reps/rep-0105.html

    # publish gaze direction request
    dx, dy = mx - cx, my - cy
    g = msg.gaze
    rospy.loginfo("BOREDOM: "+str(ema/score))
    p = Point()
    if (ema/score < args.boredom) and not g is None:
        p.x = g.x
        p.y = g.y - dx*FACTOR
        p.z = g.z - dy*FACTOR

    requestPub.publish(p)
    cv.imshow(NODE, img)
    cv.waitKey(1)

def control_callback(msg):
    global bestScore
    global bestID
    global bestImage
    global fileCount
    global args
    global active
    global ema
    global activation

    # save the best image at the end of the observation period (on 'stop' message)
    if msg.data == 'stop':
        if active:
            # close the window
            cv.destroyWindow(NODE)
            cv.waitKey(1)
        active = False
        if bestScore>0:
            path = args.dir+"/image"+str(fileCount+1)+"-"+bestID+"-"+str(round(bestScore,2))+".jpg"
            cv.imwrite(path, bestImage)
            bestScore = 0
            rospy.loginfo("written: "+path)

    elif msg.data == 'start':
        active = True
        ema = 0
        activation = 0
        fileCount = len(next(os.walk(args.dir))[2])
        cv.namedWindow(NODE)

def main():
    global bridge
    global requestPub
    global fileCount
    global args
    global ema
    global activation

    rospy.init_node(NODE)

    requestPub = rospy.Publisher('vision/control/request', Point, queue_size=1)
    
    # Instantiate CvBridge
    bridge = CvBridge()

    # create an control topic subscriber
    controlTopic = "/vision/control"
    rospy.Subscriber(controlTopic, String, control_callback)

    # create a percept subscriber
    perceptTopic = "/vision/perception"
    rospy.Subscriber(perceptTopic, Percept, percept_callback)

    #rospy.spin()
    # set rate to 1Hz
    rate = rospy.Rate(0.5)
    while not rospy.is_shutdown():
        # exponential moving average (ema)
        ema = weight*activation + (1-weight)*ema
        activation = 0
        rospy.loginfo("EMA: "+str(ema))
        rate.sleep()

main()