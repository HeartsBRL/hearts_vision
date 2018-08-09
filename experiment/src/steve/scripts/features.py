#!/usr/bin/env python
#

import cv2 as cv
import argparse

# Oriented FAST and Rotated BRIEF (ORB) feature detector
# Rotation and translation invariant feature descriptors
# see http://www.willowgarage.com/sites/default/files/orb_final.pdf

ap = argparse.ArgumentParser()
ap.add_argument('--img', nargs='+', help='sample images')
ap.add_argument('--width', type=int, default=0)

args = ap.parse_args()

def findKeypoints(img):
    orb = cv.ORB_create()
    kp, des = orb.detectAndCompute(img, None)
    return kp, des

lowe_ratio = 0.8

# Lowe ratio test
# see https://docs.opencv.org/3.3.0/dc/dc3/tutorial_py_matcher.html
# see https://www.cs.ubc.ca/~lowe/papers/ijcv04.pdf

def goodMatches(m):
    good = []
    for m,n in m:
        if m.distance < lowe_ratio*n.distance:
            good.append(m)
    return good

# The first image is the query image
#files   = ['pringlesLfg','sample1','sample2','sample3','sample4']
n = len(args.img)
img     = [None]*n
kp      = [None]*n
des     = [None]*n

# find keypoints and feature descriptors for each image
for i in range(n):
    img[i] = cv.imread(args.img[i])
    print args.img[i], img[i].shape[:2]
    # reducing image size appears to help??
    if args.width>0:
        h, w = img[i].shape[:2]
        s = args.width/float(w)
        img[i] = cv.resize(img[i], (0,0), fx=s, fy=s)
    kp[i], des[i] = findKeypoints(img[i])

print

# Brute force matching with Hamming distance
bf = cv.BFMatcher(cv.NORM_HAMMING2)

# Compare descriptors with those of the target image
for i in range(1,n):
    matches = bf.knnMatch(des[0], des[i], k=2)
    matches = goodMatches(matches)
    print args.img[i], len(matches)

cv.drawKeypoints(img[0], kp[0], img[0], color=(255,0,0), flags=2)
cv.imwrite('image.png',img[0])
cv.imshow('image',img[0])
cv.waitKey(0)
cv.destroyAllWindows()
