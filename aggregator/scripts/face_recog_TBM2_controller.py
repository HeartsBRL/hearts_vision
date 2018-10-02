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
import roslaunch
from std_msgs.msg import String
from std_msgs.msg import Int32
from aggregator.msg import DetectedInfo, Face_recog_verdict# My personal messages
from cob_perception_msgs.msg import DetectionArray, Detection#Cagbal messages
from geometry_msgs.msg import PoseStamped
#from vision.msg import Percept

class face_recognizer():

    # Initialization happens when the object is created:
    def __init__(self):

        # Publishes the decision made by the aggregator
        self.pubDec = rospy.Publisher(
                "aggregator/decisions",
                DetectedInfo,
                queue_size=1)

        # Publishes the most probable recognition to the controller
        self.pubRecog = rospy.Publisher(
                "/recognising_visitor/vision",
                Face_recog_verdict,
                queue_size=1)



        # #       DELETE AFTER TESTING!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        # self.subDetec = rospy.Subscriber(
        #         "/face_recognizer/faces",
        #         DetectionArray,
        #         self.callback)




        # Listens to tbm2_controller
        self.subConFlag = rospy.Subscriber(
                "/recognising_visitor/controller",
                Face_recog_verdict,
                self.controller_callback)
        # Gaze control subscriber and publishers
        self.gaze = rospy.Publisher(
                "/look_at",
                PoseStamped,
                queue_size=1)

        # self.coor = rospy.Subscriber(
        #     "/object_detection/realworld/position",
        #     DetectionArray,
        #     self.coordinates) #Name // Type of message and Callback

    #Default info display
        self.DInfo = DetectedInfo() # Message to publish decision
        self.DInfo.score = 0
        self.DInfo.label = "Nothing"
        self.DInfo.id = "Unknown"
        self.DInfo.decision = "None"
        #Variable to publish only if the state changes
        self.Flag = False
        self.On = False
    #Parameters for making decision on people

        self.DetecTimeP = rospy.Time.now() # Scanning variable to STOP FACE RECOG
        #self.Scanning_Time = rospy.Duration(10)
    #Parameters for making decision on nothing detected
        self.DetecTimeL = rospy.Time.now() # Scanning time to give up looking for people
        self.TotalFreqLoss = rospy.Duration(5)

    #List of detected humans
        self.KnownPeople = ["doctor","postman","Unknown"]
        self.PeopleConfidence = [0,0,0]
        self.Total_detections = 0

        # self.face_launch() ##UNCOMMENT TO TEST ON ROBOT
        self.uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
        roslaunch.configure_logging(self.uuid)
#Main loop to publish decisions


    def decision_making(self):

        rate = rospy.Rate(10) # update rate of 1hz

        while not rospy.is_shutdown():
            if not self.On:
                self.DetecTimeP = rospy.Time.now()
            if self.Flag:
                if not self.On:
                    rospy.loginfo("Launching face recognition")
                    self.face_launch()
                    self.On = True

                self.Stop = (rospy.Time.now()-self.DetecTimeP) >   self.Scanning_Time
                if self.Stop:
                    #Verdict when no faces were detected
                    if self.DInfo.decision == "No people":
                        # print("No one was seen")
                        #PUBLISH VERDICT
                        verdict_msg = Face_recog_verdict()
                        verdict_msg.best_pick = "No people"
                        rospy.loginfo("Publishing that no faces were detected")
                        self.pubRecog.publish(verdict_msg)
                        self.DInfo.decision ="Done"
                        self.face_kill_launch()
                        self.On = False
                        self.Flag = False
                        self.face_recog_sub.unregister()
                    #Verdict if it was still detecting faces
                    elif self.DInfo.decision == "Calculating":
                        print(self.Total_detections)
                        self.PeopleConfidencePercent = [x*100 / self.Total_detections for x in self.PeopleConfidence]
                        print(self.KnownPeople[self.PeopleConfidencePercent.index(max(self.PeopleConfidencePercent))])
                        print(self.PeopleConfidencePercent)
                        self.DInfo.decision = self.KnownPeople[self.PeopleConfidencePercent.index(max(self.PeopleConfidencePercent))]
                        #PUBLISH VERDICT
                        verdict_msg = Face_recog_verdict()
                        verdict_msg.best_pick = self.KnownPeople[self.PeopleConfidencePercent.index(max(self.PeopleConfidencePercent))]
                        rospy.loginfo("Publishing detected faces")
                        self.pubRecog.publish(verdict_msg)
                        rospy.loginfo("Killing face cagbal...")
                        self.face_kill_launch()
                        self.On = False
                        self.Flag = False
                        self.face_recog_sub.unregister()




            rate.sleep()

# ###################################OBJECT LAUNCH#################
#     def obj_launch(self):
#         self.obj_launch = roslaunch.parent.ROSLaunchParent(self.uuid, ["/home/hearts/workspaces/hearts_erl/src/hearts_vision/aggregator/launch/object_detector.launch"])
#         self.obj_launch.start()
# ###################################FACE LAUNCH#################
    def face_launch(self):
        self.face_launch = roslaunch.parent.ROSLaunchParent(self.uuid, ["/home/hearts/workspaces/hearts_erl/src/hearts_vision/aggregator/launch/face_detector.launch"])
        # self.face_launch = roslaunch.parent.ROSLaunchParent(self.uuid, ["/home/hearts/workspaces/hearts_erl/src/hearts_vision/ros_people_object_detection_tensorflow/launch/alltogether.launch"])

        self.face_launch.start()
# ###################################TURNING OFF OBJECT LAUNCH#################
#     def obj_kill_launch(self):
#         self.obj_launch.shutdown()
#
# ###################################TURNING OFF FACE LAUNCH#################
    def face_kill_launch(self):
        temp = self.face_launch.shutdown()
        rospy.sleep(1)


######WE INITIALLY DO NOT NEED TRACKING THE FACE

# ###Gaze tracking
#     def coordinates(self, RealWorld):
#         if self.DInfo.decision == "Person Tracked":
#             yeah2=1
#             # self.gaze.publish(RealWorld.detections[ObjectReal].pose)


    def controller_callback(self, msg):
        # Listens to the objection and people detection modules
        self.Scanning_Time = msg.scan_time
        rospy.loginfo("Message received from main controller")
        self.face_recog_sub = self.subDetec = rospy.Subscriber(
                "/face_recognizer/faces",
                DetectionArray,
                self.callback)
        rospy.loginfo("Listening to Cagbal")
        self.Flag = True #To start the count down for detection



#Decision making based on data received by object and people detection modules
#Data SCORE and FREQUENCY are the two values considered for the decision
    def callback(self, data):
        #self.Flag = True #To start the count down for detection
        rospy.loginfo("Starting Countdown")
        if not self.Stop:
            if len(data.detections) > 0:

                for ObjectReal in range(len(data.detections)): #For each bodypart send/create a tf transform
                    for People in range(len(self.KnownPeople)):
                        if data.detections[ObjectReal].label == self.KnownPeople[People]: #First filter BASED ON SCORE
                            self.PeopleConfidence[People] = self.PeopleConfidence[People] + 1
                            self.Total_detections = self.Total_detections + 1
                self.DetecTimeL=rospy.Time.now()
                self.DInfo.score = 0
                self.DInfo.label = "Face detected"
                rospy.loginfo("Face detected")
                self.DInfo.decision = "Calculating"
                self.Flag = True

            #IF TOO MUCH TIME GOES WITHOUT DETECTION ANYTHING THEN DECISION CHANGES
            PotLoss = (rospy.Time.now()-self.DetecTimeL) >   self.TotalFreqLoss
            if PotLoss:
                self.DInfo.score = 0
                self.DInfo.label = "Nothing"
                self.DInfo.decision = "No people"
                rospy.loginfo("No faces were detected")
                self.Flag = True





if __name__ == '__main__':
    rospy.init_node("face_recognizer", anonymous=True)
    rospy.loginfo("face recog node initiated")
    n = face_recognizer()
    n.decision_making()

    rospy.spin()
