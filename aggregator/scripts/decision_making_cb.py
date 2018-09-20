#!/usr/bin/env python
##############################################################################################
# Author  : Daniel Delgado Bellamy
# Created : Aug 2018
# Purpose : To fulfil ERL-SR competition Bench Marks
#           Written for the Oct 2018 ERL competition in Madrid.
#
##############################################################################################
# Updates :
#
#
##############################################################################################
import rospy
import roslib
import time
from std_msgs.msg import String
from std_msgs.msg import Int32
from aggregator.msg import DetectedInfo# My personal messages
from cob_perception_msgs.msg import DetectionArray, Detection, DetectionLife, Life #Cagbal messages
#from vision.msg import Percept

class aggregator():

    # Initialization happens when the object is created:
    def __init__(self):

        # Publishes the decision made by the aggregator
        self.pubDec = rospy.Publisher(
                "aggregator/decisions",
                DetectedInfo,
                queue_size=1)

        # Listens to the objection and people detection modules
        self.subDetec = rospy.Subscriber(
                "/object_detection/detections",
                DetectionArray,
                self.callback)

    #Default info display
        self.DInfo = DetectedInfo() # Message to publish decision
        self.DInfo.score = 0
        self.DInfo.label = "Nothing"
        self.DInfo.decision = "None"
    #Parameters for making decision on object
        self.ObjFreq = rospy.Duration(2)
        self.ObjFreqLoss = rospy.Duration(5)
        self.ObjThresh = 0.5
        self.DetecTimeO = rospy.Time.now()
    #Parameters for making decision on people
        self.PersonFreq = rospy.Duration(2)
        self.PersonFreqLoss = rospy.Duration(5)
        self.PersonThresh = 0.6
        self.DetecTimeP = rospy.Time.now()
    #Parameters for making decision on nothing detected
        self.DetecTimeL = rospy.Time.now()
        self.TotalFreqLoss = rospy.Duration(10)
    #Score Thresholds
        self.ScoreThres = 0.7

    #Detections array of frequent Detections
        self.FreqDetections = DetectionLife() # When instantiating ALWAYS use the brackets
        self.lifeloss = rospy.Time.now()
        self.CurrentTime = rospy.Time.now()
#Main loop to publish decisions


    def decision_making(self):

        rate = rospy.Rate(10) # update rate of 1hz

        while not rospy.is_shutdown():
            self.lifeloss = rospy.Time.now() - self.CurrentTime # Increment of time to substract from detections lives
            self.CurrentTime = rospy.Time.now()# Increment of time between

            self.count_down(self.lifeloss)
            for detec in range(len(self.FreqDetections.detections)):
                print(self.FreqDetections.detections[detec].label)
            print("------------------------------")
            #rospy.loginfo("publishing value: " + str(self.DInfo))
            self.pubDec.publish(self.DInfo)
            rate.sleep()

#Reduce life time of detections
    def count_down(self, lifeloss):

        if len(self.FreqDetections.detections) > 0:

            for detec in range(len(self.FreqDetections.detections)):
                if self.FreqDetections.life[detec] < lifeloss:
                    self.FreqDetections.life[detec] = rospy.Duration(0)
                else:
                    self.FreqDetections.life[detec] = self.FreqDetections.life[detec] - lifeloss
            #elements = [0]*len(self.FreqDetections.detections)

            #Deleted elemented whose time expired
            for detec in sorted(range(len(self.FreqDetections.detections)), reverse=True):
                if self.FreqDetections.life[detec] == rospy.Duration(0):
                    #elements[detec] = detec
                    del self.FreqDetections.detections[detec]
                    del self.FreqDetections.life[detec]


#Decision making based on data received by object and people detection modules
#Data SCORE and FREQUENCY are the two values considered for the decision
    def callback(self, data):
        # IF there are detections check which ones are above our threshold
        if len(data.detections) > 0:

            for detec in range(len(data.detections)):

                if data.detections[detec].score > self.ScoreThres:
                    counter = False
        #THEN add those to our container BUT avoiding repetitions of IDs (IN THAT CASE RENEW THEIR COUNTER)
                    if not self.FreqDetections.detections:
                        self.FreqDetections.detections.append(data.detections[detec])
                        self.FreqDetections.life.append(rospy.Duration(1))
                    else:

                        for elem in range(len(self.FreqDetections.detections)):
                            if data.detections[detec].id == self.FreqDetections.detections[elem].id:
                                counter = True
                                self.FreqDetections.life[elem] = rospy.Duration(1)
                                break
                        if counter == False:
                            self.FreqDetections.detections.append(data.detections[detec])
                            self.FreqDetections.life.append(rospy.Duration(1))
        #rospy.loginfo(str(len(self.FreqDetections.detections)))#


    	# if False:
    	# 	if data.score > self.ScoreThres: #First filter BASED ON SCORE
        #
    	# 	    #Possibility to detection something or someone BASED ON FREQUENCY
        #
    	# 	    PotObj = (rospy.Time.now()-self.DetecTimeO) < self.ObjFreq
    	# 	    PotPerson = (rospy.Time.now()-self.DetecTimeP) < self.PersonFreq
        #
    	# 	    if PotObj:
    	# 	        self.DInfo.score = data.score
    	# 	        self.DInfo.label = data.id
    	# 	        self.DInfo.decision = "Object Detected"
    	# 	    if PotPerson:
    	# 	        self.DInfo.score = data.score
    	# 	        self.DInfo.label = data.id
    	# 	        self.DInfo.decision = "Person Detected"
        #
    	# 	    if PotPerson and PotObj:
    	# 	        self.DInfo.score = data.score
    	# 	        self.DInfo.label = "object + person"
    	# 	        self.DInfo.decision = "Both detected"
        #
    	# 	    #Possibility to lose something or someone if it was previously detected BASED ON FREQUENCY
        #
    	# 	    PotObjLoss = (rospy.Time.now()-self.DetecTimeO) >  self.ObjFreqLoss
    	# 	    PotPersonLoss = (rospy.Time.now()-self.DetecTimeP) > self.PersonFreqLoss
    	# 	    if PotObjLoss and self.DInfo.decision == "Object Detected":
    	# 	        self.DInfo.score = data.score
    	# 	        self.DInfo.label = data.id
    	# 	        self.DInfo.decision = "Object Lost"
    	# 	    if PotPersonLoss and self.DInfo.decision == "Person Detected":
    	# 	        self.DInfo.score = data.score
    	# 	        self.DInfo.label = data.id
    	# 	        self.DInfo.decision = "Person Lost"
    	# 	    if PotPersonLoss and PotObjLoss and self.DInfo.decision == "Both detected":
    	# 	        self.DInfo.score = data.score
    	# 	        self.DInfo.label = "object + person"
    	# 	        self.DInfo.decision = "Both lost"
    	# 	        # Reset time counters
    	# 	    if data.id == "person":
    	# 	        self.DetecTimeP=rospy.Time.now()
    	# 	        self.DetecTimeL=rospy.Time.now()
    	# 	    else:
    	# 	        self.DetecTimeO=rospy.Time.now()
    	# 	        self.DetecTimeL=rospy.Time.now()
        #
    	# 	else: #IF TOO MUCH TIME GOES WITHOUT DETECTION ANYTHING THEN DECISION CHANGES
        #
        #
    	# 	    PotLoss = (rospy.Time.now()-self.DetecTimeL) >   self.TotalFreqLoss
        #
    	# 	    if PotLoss:
    	# 	        self.DInfo.score = 0
    	# 	        self.DInfo.label = "Nothing"
    	# 	        self.DInfo.decision = "Nothing detected"


if __name__ == '__main__':
    rospy.init_node("aggregator", anonymous=True)

    n = aggregator()
    n.decision_making()

    rospy.spin()
