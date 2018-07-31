#!/usr/bin/env python
#

import cv2 as cv

# Oriented FAST and Rotated BRIEF (ORB) feature detector
# Rotation and translation invariant feature descriptors

def findKeypoints(img):
    orb = cv.ORB_create()
    orb.setScoreType(cv.FAST_FEATURE_DETECTOR_TYPE_9_16)
    kp = orb.detect(img,None)
    kp, des = orb.compute(img, kp)
    return kp, des

lowe_ratio = 0.75

# Lowe ratio test
# see https://docs.opencv.org/3.3.0/dc/dc3/tutorial_py_matcher.html
# see https://www.cs.ubc.ca/~lowe/papers/ijcv04.pdf

def goodMatches(m):
    good = []
    for i in range(len(m)):
        for j in range(len(m)):
            if m[i].distance < lowe_ratio*m[j].distance:
                good.append(m[i])
    return good

# The first image is the target
files   = ['pringles-fg',
           'pringles',
           'pringles rotated',
           'pringles scaled',
           'biscuits',
           'can',
           'cube',
           'background']

img     = [None]*len(files)
kp      = [None]*len(files)
des     = [None]*len(files)

# find keypoints and feature descriptors for each image
for i in range(len(files)):
    img[i] = cv.imread('../../../images/'+files[i]+'.png')
    kp[i], des[i] = findKeypoints(img[i])

# Brute force matching with Hamming distance
bf = cv.BFMatcher(cv.NORM_HAMMING2, crossCheck=True)

# Compare descriptors with those of the target image
for i in range(1,len(files)):
    matches = bf.match(des[0], des[i])
    # Sort matches by distance.
    # matches = sorted(matches, key = lambda x:x.distance)
    matches = goodMatches(matches)
    print files[i], len(matches)


cv.drawKeypoints(img[0], kp[0], img[0], color=(255,0,0), flags=2)
cv.imshow('image',img[0])
cv.waitKey(0)
cv.destroyAllWindows()
