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
import math
import tf #ROS Transform library
import sys
from std_msgs.msg import String
from std_msgs.msg import Int32
from aggregator.msg import DetectedInfo, Tracking_info# My personal messages
from cob_perception_msgs.msg import DetectionArray, Detection#Cagbal messages
from geometry_msgs.msg import PoseStamped
#from vision.msg import Percept

class person_tracking():

    # Initialization happens when the object is created:
    def __init__(self):

        # # Publishes the decision made by the aggregator
        # self.pubDec = rospy.Publisher(
        #         "aggregator/decisions",
        #         DetectedInfo,
        #         queue_size=1)

        # Publishes the decision made by the aggregator
        self.pubDec = rospy.Publisher(
                "/tracking_visitor/vision",
                Tracking_info,
                queue_size=1)
        # Listens to tbm2_controller
        self.subConFlag = rospy.Subscriber(
                "/tracking_visitor/controller",
                Tracking_info,
                self.controller_callback)

#       DELETE AFTER TESTING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        # # Listens to the objection and people detection modules
        # self.subDetec = rospy.Subscriber(
        #         "/object_detection/detections",
        #         DetectionArray,
        #         self.callback)


        # Gaze control subscriber and publishers
        self.gaze = rospy.Publisher(
                "/look_at",
                PoseStamped,
                queue_size=1)
#       DELETE AFTER TESTING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

        self.coor = rospy.Subscriber(
            "/object_detection/realworld/position",
            DetectionArray,
            self.callback) #Name // Type of message and Callback
            #self.coordinates_callback) #Name // Type of message and Callback

    #Default info display
        self.DInfo = DetectedInfo() # Message to publish decision
        self.DInfo.score = 0
        self.DInfo.label = "Nothing"
        self.DInfo.id = "Unknown"
        self.DInfo.decision = "None"
        #Variable to publish only if the state changes
        self.Flag = True
    #Parameters for making decision on people
        self.PersonFreq = rospy.Duration(1) #Accepted frequency of person in front of the camera
        self.PersonFreqLoss = rospy.Duration(2) #We considered the person lost if this time goes between detections
        self.DetecTimeP = rospy.Time.now()
    #Parameters for making decision on nothing detected
        #self.DetecTimeL = rospy.Time.now()
        #self.TotalFreqLoss = rospy.Duration(2)

    #Score Thresholds
        self.ScoreThres = 0.5

    #List of detected humans
    #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
        self.Tracking_started = True #CHANGE!!!!

        self.DetecTime2Stop = rospy.Time.now()
        self.Scanning_Time = rospy.Duration(5) #Scanning variable to decide when to stop
        self.Stop = False # Initial flag
    #List of detected humans
        self.KnownPeople = []

        # self.obj_launch()
#Main loop to publish decisions


    def decision_making(self):

        rate = rospy.Rate(10) # update rate of 1hz
        while not rospy.is_shutdown():
            #Reset time variables until
            if not self.Tracking_started:
                self.DetecTimeP=rospy.Time.now()
                #self.DetecTimeL=rospy.Time.now()
                self.DetecTime2Stop = rospy.Time.now()

            if not self.Stop:
                self.Stop = (rospy.Time.now()-self.DetecTime2Stop) >   self.Scanning_Time
            if self.Stop:
                if self.DInfo.decision == "Person Lost":
                    print("No one was seen")
                    #PUBLISH VERDICT IF THE VISITOR WENT OUT OF THE RANGE OF VISION
                    verdict_msg = Tracking_info()
                    verdict_msg.decision = "Person Lost"
                    self.pubDec.publish(verdict_msg)
                    self.DInfo.decision = "Done"
                    self.Stop = False
                    self.Tracking_started = False
                elif self.DInfo.decision == "Person Tracked":

                    #PUBLISH VERDICT IF THE PERSON WAS ALWAYS WITHIN THE RANGE OF VISION
                    verdict_msg = Tracking_info()
                    verdict_msg.decision = "Person Tracked"
                    self.pubDec.publish(verdict_msg)
                    self.DInfo.decision = "Done"
                    self.Stop = False
                    self.Tracking_started = False
                else:
                    #PUBLISH VERDICT IF SOMETHING WENT WRONG
                    verdict_msg = Tracking_info()
                    verdict_msg.decision = "Something went wrong"
                    self.pubDec.publish(verdict_msg)
                    self.DInfo.decision = "Done"
                    self.Stop = False
                    self.Tracking_started = False
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
    def coordinates_callback(self, RealWorld):
        if self.DInfo.decision == "Person Tracked":
            yeah=2
            #self.gaze.publish(RealWorld.detections[ObjectReal].pose)

    def controller_callback(self,msg):
        # # Listens to the objection and people detection modules
        # self.subDetec = rospy.Subscriber(
        #         "/object_detection/detections",
        #         DetectionArray,
        #         self.callback)

        self.coor = rospy.Subscriber(
            "/object_detection/realworld/position",
            DetectionArray,
            self.callback) #Name // Type of message and Callback

        #self.Tracking_started = True   #Reset later THIS SHOULD COME FROM THE TBM2 CONTROLLER.PY

#Decision making based on data received by object and people detection modules
#Data SCORE and FREQUENCY are the two values considered for the decision
    def callback(self, data):
        #self.Tracking_started = True #Reset later THIS SHOULD COME FROM THE TBM2 CONTROLLER.PY

        if len(data.detections) > 0:
            #By default de person is LOST and other IF statement will update this
            self.DInfo.decision = "Person Lost"
            distances = []
            detectedPeople = []
            if not self.KnownPeople:
                for ObjectReal in range(len(data.detections)): #For each bodypart send/create a tf transform
                    if (data.detections[ObjectReal].score > self.ScoreThres) and (data.detections[ObjectReal].label == "person"): #First filter BASED ON SCORE
                        distances.append(str(math.sqrt(data.detections[ObjectReal].pose.pose.position.x**2 + data.detections[ObjectReal].pose.pose.position.y**2 + data.detections[ObjectReal].pose.pose.position.z**2)))
                        detectedPeople.extend(str(data.detections[ObjectReal].id))

                if distances:
                    print(distances)
                    print(detectedPeople)
                    [float(i) for i in distances]
                    #closest_person = min(distances)
                    closest_distances,idx = min((distances[i],i) for i in xrange(len(distances)) )
                    #CONSIDER THE BIGGER BOUNDING BOX IF DISTANCE DOES NOT WORK
                    self.KnownPeople.extend(str(detectedPeople[idx]))




            if self.KnownPeople:
                print(self.KnownPeople)
                print(" tracking")
                for ObjectReal in range(len(data.detections)): #For each bodypart send/create a tf transform
                    if (data.detections[ObjectReal].score > self.ScoreThres) and (data.detections[ObjectReal].label == "person"): #First filter BASED ON SCORE
                        if str(data.detections[ObjectReal].id) in self.KnownPeople:
                            PotPerson = (rospy.Time.now()-self.DetecTimeP) < self.PersonFreq
                            if PotPerson:
                                self.DInfo.decision = "Tracking: " + str(data.detections[ObjectReal].id)
                                self.Flag = True
                                self.gaze.publish(data.detections[ObjectReal].pose)
                                self.DetecTimeP=rospy.Time.now()
                            else:
                                self.KnownPeople=[]

        #Possibility to lose something or someone if it was previously detected BASED ON FREQUENCY

        PotPersonLoss = (rospy.Time.now()-self.DetecTimeP) > self.PersonFreqLoss
        if PotPersonLoss and self.DInfo.decision == "Person Lost":
            self.DInfo.id = "Unknown"
            self.DInfo.decision = "Person Lost"
            self.Flag = True
            self.Stop = True


        # #IF TOO MUCH TIME GOES WITHOUT DETECTION ANYTHING THEN DECISION CHANGES
        # PotLoss = (rospy.Time.now()-self.DetecTimeL) >   self.TotalFreqLoss
        #
        # if PotLoss:
        #     self.DInfo.score = 0
        #     self.DInfo.label = "Nothing"
        #     self.DInfo.decision = "No people"
        #     self.Flag = True
        #     self.Stop = True




if __name__ == '__main__':
    rospy.init_node("person_tracking", anonymous=True)

    n = person_tracking()
    n.decision_making()

    rospy.spin()
