# HOG (Histograms of Oriented Gradients)
# sudo -H pip2 install imutils

# see: https://www.pyimagesearch.com/2015/11/09/pedestrian-detection-opencv/
# images from: http://pascal.inrialpes.fr/data/human/

#from __future__ import print_function
#import imutils
from imutils.object_detection import non_max_suppression
from imutils import paths
import numpy as np
import argparse
import imutils
import cv2 as cv
 
# construct the argument parse and , parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("images", nargs='+', help="image files")
args = vars(ap.parse_args())
 
# initialize the HOG descriptor/person detector
hog = cv.HOGDescriptor()
hog.setSVMDetector(cv.HOGDescriptor_getDefaultPeopleDetector())

# loop over the images
for img in args["images"]:
	# load the image and resize it to (1) reduce detection time
	# and (2) improve detection accuracy
	image = cv.imread(img)
	image = imutils.resize(image, width=min(400, image.shape[1]))
	orig = image.copy()
 
	# detect people in the image
	# The weight returned by the method for each ROI is the distance from the sample 
	# to the SVM separating hyperplane (in its corresponding kernel space). 
	# Therefore, a larger distance indicates a sample classifier with a larger confidence.
	# see: http://answers.opencv.org/question/95042/hog-detectmultiscale-weight-scale-explanation/
	rects, weights = hog.detectMultiScale(image, winStride=(4, 4), padding=(8, 8), scale=1.05)
 
	# draw the original bounding boxes
	for (x, y, w, h) in rects:
		cv.rectangle(orig, (x, y), (x + w, y + h), (0, 0, 255), 2)

	print rects, weights
	if len(rects)>0:
		best = np.argmax(weights)
		r = rects[best]
		print r
		x, y, w, h = rects[best]
		cv.circle(orig, (x+w/2, y+h/2), 5, (0, 255, 0), -1)


	# apply non-maxima suppression to the bounding boxes using a
	# fairly large overlap threshold to try to maintain overlapping
	# boxes that are still people
	#rects = np.array([[x, y, x + w, y + h] for (x, y, w, h) in rects])
	#pick = non_max_suppression(rects, probs=None, overlapThresh=0.65)
 
	# draw the final bounding boxes
	#for (xA, yA, xB, yB) in pick:
	#	cv.rectangle(image, (xA, yA), (xB, yB), (0, 255, 0), 2)

 
	# show some information on the number of bounding boxes
	filename = img[img.rfind("/") + 1:]
	#print("[INFO] {}: {} original boxes, {} after suppression".format(
	#	filename, len(rects), len(pick)))
 
	# show the output images
	cv.imshow(filename, orig)
	#cv.imshow("After NMS", image)
	cv.waitKey(0)
