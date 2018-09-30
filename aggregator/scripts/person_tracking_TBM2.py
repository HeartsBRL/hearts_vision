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
import tf #ROS Transform library
import sys
from std_msgs.msg import String
from std_msgs.msg import Int32
from aggregator.msg import DetectedInfo# My personal messages
from cob_perception_msgs.msg import DetectionArray, Detection#Cagbal messages
from geometry_msgs.msg import PoseStamped
#from vision.msg import Percept

class person_tracking():

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
        # Gaze control subscriber and publishers
        self.gaze = rospy.Publisher(
                "/look_at",
                PoseStamped,
                queue_size=1)

        self.coor = rospy.Subscriber(
            "/object_detection/realworld/position",
            DetectionArray,
            self.coordinates) #Name // Type of message and Callback

    #Default info display
        self.DInfo = DetectedInfo() # Message to publish decision
        self.DInfo.score = 0
        self.DInfo.label = "Nothing"
        self.DInfo.id = "Unknown"
        self.DInfo.decision = "None"
        #Variable to publish only if the state changes
        self.Flag = True
    #Parameters for making decision on people
        self.PersonFreq = rospy.Duration(1)
        self.PersonFreqLoss = rospy.Duration(3)
        self.PersonThresh = 0.6
        self.DetecTimeP = rospy.Time.now()
    #Parameters for making decision on nothing detected
        self.DetecTimeL = rospy.Time.now()
        self.TotalFreqLoss = rospy.Duration(5)
    #Score Thresholds
        self.ScoreThres = 0.5

    #List of detected humans
        self.KnownPeople = []
        # self.obj_launch()
#Main loop to publish decisions


    def decision_making(self):

        rate = rospy.Rate(10) # update rate of 1hz

        while not rospy.is_shutdown():
            if self.Flag:
                print("------------------------------")
                rospy.loginfo("publishing value: " + str(self.DInfo))
                self.pubDec.publish(self.DInfo)
                self.Flag = False
            rate.sleep()

# ###################################OBJECT LAUNCH#################
#     def obj_launch(self):
#         self.obj_launch = roslaunch.parent.ROSLaunchParent(self.uuid, ["/home/hearts/workspaces/hearts_erl/src/hearts_vision/aggregator/launch/object_detector.launch"])
#         self.obj_launch.start()
# ###################################FACE LAUNCH#################
#     def face_launch(self):
#         self.face_launch = roslaunch.parent.ROSLaunchParent(self.uuid, ["/home/hearts/workspaces/hearts_erl/src/hearts_vision/aggregator/launch/face_detector.launch"])
#         self.face_launch.start()
# ###################################TURNING OFF OBJECT LAUNCH#################
#     def obj_kill_launch(self):
#         self.obj_launch.shutdown()
#
# ###################################TURNING OFF FACE LAUNCH#################
#     def face_kill_launch(self):
#         self.face_launch.shutdown()

###Gaze tracking
    def coordinates(self, RealWorld):
        if self.DInfo.decision = "Person Tracked":
            self.gaze.publish(RealWorld.detections[ObjectReal].pose)

#Decision making based on data received by object and people detection modules
#Data SCORE and FREQUENCY are the two values considered for the decision
    def callback(self, data):

        if len(data.detections) > 0:
            #By default de person is LOST and other IF statement will update this
            self.DInfo.decision = "Person Lost"

            for ObjectReal in range(len(data.detections)): #For each bodypart send/create a tf transform
                if (data.detections[ObjectReal].score > self.ScoreThres) and (data.detections[ObjectReal].label == "person"): #First filter BASED ON SCORE

                    #Possibility to detection something or someone BASED ON FREQUENCY
                    PotPerson = (rospy.Time.now()-self.DetecTimeP) < self.PersonFreq
                    #If new person store data plus ID
                    if self.DInfo.id == "Unknown":
                        self.DInfo.score = data.detections[ObjectReal].score
                        self.DInfo.label = data.detections[ObjectReal].label
                        self.DInfo.id = str(data.detections[ObjectReal].id)
                        self.DInfo.decision = "Person Detected"
                        self.Flag = True
                        #Add human to the list
                        if str(data.detections[ObjectReal].id) in self.KnownPeople:
                            self.DInfo.decision = "Known Person Redetected"
                            self.Flag = True
                        else:
                            self.KnownPeople.extend(str(data.detections[ObjectReal].id))


                        # Reset time counters
                        self.DetecTimeP=rospy.Time.now()
                        self.DetecTimeL=rospy.Time.now()
                    #If already a person stored check if the ID matches
                    elif PotPerson and self.DInfo.id != "Unknown":
                        if str(data.detections[ObjectReal].id) == self.DInfo.id:
                            self.DInfo.decision = "Person Tracked"
                            self.Flag = True
                        # Reset time counters
                        self.DetecTimeP=rospy.Time.now()
                        self.DetecTimeL=rospy.Time.now()



        #Possibility to lose something or someone if it was previously detected BASED ON FREQUENCY

        PotPersonLoss = (rospy.Time.now()-self.DetecTimeP) > self.PersonFreqLoss
        if PotPersonLoss and self.DInfo.decision == "Person Lost":
            self.DInfo.id = "Unknown"
            self.DInfo.decision = "Resetting ID"
            self.Flag = True

        #IF TOO MUCH TIME GOES WITHOUT DETECTION ANYTHING THEN DECISION CHANGES
        PotLoss = (rospy.Time.now()-self.DetecTimeL) >   self.TotalFreqLoss

        if PotLoss:
            self.DInfo.score = 0
            self.DInfo.label = "Nothing"
            self.DInfo.decision = "No people"
            self.Flag = True




if __name__ == '__main__':
    rospy.init_node("person_tracking", anonymous=True)

    n = person_tracking()
    n.decision_making()

    rospy.spin()
