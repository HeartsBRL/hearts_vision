#!/usr/bin/env python
#
# https://docs.opencv.org/3.4/db/d5c/tutorial_py_bg_subtraction.html

import cv2 as cv
import argparse

ap = argparse.ArgumentParser()
ap.add_argument('fg', help='image with object in foreground')
# one or more backround images
ap.add_argument('--bg', nargs='+', help='background images')
# optional save image
ap.add_argument('--save', help='save image to destination')
# increase erosion to remove background noise
ap.add_argument('--erode', type=int, default=0)
# increse dilation to eliminate black holes in the foreground object
ap.add_argument('--dilate', type=int, default=0)
ap.add_argument('--threshold', type=int, default=50)

args = ap.parse_args()
fg = cv.imread(args.fg)
print args.fg, fg.shape[:2]

bg = [None]*len(args.bg)

for i in range(len(args.bg)):
    bg[i] = cv.imread(args.bg[i])
    print args.bg[i], bg[i].shape[:2]

# Background subtraction
# see: https://docs.opencv.org/3.1.0/db/d5c/tutorial_py_bg_subtraction.html
bgs = cv.createBackgroundSubtractorMOG2(varThreshold=args.threshold, detectShadows=True)
for i in range(len(bg)):
    bgs.apply(bg[i])

img = bgs.apply(fg)

# threshold to create binarized mask
ret, mask = cv.threshold(img,0,255,cv.THRESH_BINARY)
kernel = cv.getStructuringElement(cv.MORPH_ELLIPSE,(3,3))

# erode noisy pixels then dilate to fill holes
mask = cv.erode(mask,kernel,iterations=args.erode)
mask = cv.dilate(mask, kernel, iterations=args.dilate)

# Apply mask to foreground image
res = cv.bitwise_and(fg,fg,mask=mask)


if args.save:
    print 'save:', args.save
    cv.imwrite(args.save,res)

cv.imshow('image',res)
cv.waitKey(0)
cv.destroyAllWindows()

