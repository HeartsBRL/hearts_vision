#!/usr/bin/env python
#
# https://docs.opencv.org/3.4/db/d5c/tutorial_py_bg_subtraction.html

import cv2 as cv

bg = cv.imread('../../../images/background.png')
fg = cv.imread('../../../images/pringles.png')

# Background subtraction
bgs = cv.createBackgroundSubtractorMOG2()
bgs.apply(bg)
img = bgs.apply(fg)

# threshold to create binarized mask
ret, mask = cv.threshold(img,0,255,cv.THRESH_BINARY)

# Apply mask to foreground image
res = cv.bitwise_and(fg,fg,mask=mask)

cv.imwrite('../../../images/image.png',res)

cv.imshow('image',res)
cv.waitKey(0)
cv.destroyAllWindows()

