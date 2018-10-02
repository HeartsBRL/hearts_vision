#!/usr/bin/env python
import sys
import roslib #Ros libraries
import rospy #Python library
import tf #ROS Transform library
import roslaunch
from actionlib import SimpleActionClient
from cob_perception_msgs.msg import DetectionArray, Detection#, DetectionLife, Life #Cagbal messages
from geometry_msgs.msg import PointStamped, PoseStamped
from control_msgs.msg import PointHeadAction, PointHeadGoal
from std_msgs.msg import String


class vision_sense():

    def __init__(self):
################################CLASS INITIALISATION#############################
		#Subscriber that receives data from the recorded ROSBAGs skeleton topic

        self.sub = rospy.Subscriber(
            "/object_detection/realworld/position",
            DetectionArray,
            self.positionCallback) #Name // Type of message and Callback

        # Publishes the decision made by the aggregator
        self.pubPos = rospy.Publisher(
                "/aruco_single/pose",
                PoseStamped,
                queue_size=1)

        self.pubPos2 = rospy.Publisher(
                "/look_at",
                PoseStamped,
                queue_size=1)


        #Publish to get what we want to say
        self.pubsay = rospy.Publisher(
            '/hearts/tts',
            String,
            queue_size=1)
        #Publis point for the robot to follow
        self.headP = rospy.Publisher(
            '/head_controller/point_head_action/goal',
            PointHeadGoal,
            queue_size=1)
        self.headMove = SimpleActionClient('/head_controller/point_head_action', PointHeadAction)
        #self.headMove.wait_for_server()

        self.final_pos = PoseStamped()
        self.args = rospy.myargv(argv=sys.argv) # rospy adapatation of sys arguments
        self.flag = True
        #TBM3 lists EXAMPLE
        self.CagbalList_containers = ["bottle", "mug","cup"];

        ######Main variables for launching different vision group of files in Cagbal#####
        self.uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
        roslaunch.configure_logging(self.uuid)
        self.goal = PointHeadGoal()
        self.point = PointStamped()
        self.face_launch()

############GAZE CONTROL METHOD######################
    def look_at(self,poseReal):
        print("looking at object")
        #goal = PointHeadGoal()
        #point = PointStamped()
        self.point.point.x = poseReal.pose.position.x
        self.point.point.y = poseReal.pose.position.y
        self.point.point.z = poseReal.pose.position.z
        self.point.header.frame_id = "/xtion_rgb_optical_frame"

        self.goal.pointing_frame = "/xtion_rgb_optical_frame"
        self.goal.pointing_axis.x = 0.0;
        self.goal.pointing_axis.y = 0.0;
        self.goal.pointing_axis.z = 1.0;
        self.goal.min_duration = rospy.Duration(1)
        self.goal.max_velocity = 0.25
        self.goal.target = self.point
        print("publishing")
        self.headP.publish(self.goal)
        self.headMove.send_goal_and_wait(self.goal)
###################################METHOD FOR PUBLISHING DECISIONS#################
    def decision_making(self):

        rate = rospy.Rate(10) # update rate of 10hz

        while not rospy.is_shutdown():

            rate.sleep()

###################################OBJECT LAUNCH#################
    def obj_launch(self):
        self.obj_launch = roslaunch.parent.ROSLaunchParent(self.uuid, ["/home/hearts/workspaces/hearts_erl/src/hearts_vision/aggregator/launch/object_detector.launch"])
        self.obj_launch.start()
###################################FACE LAUNCH#################
    def face_launch(self):
        self.face_launch = roslaunch.parent.ROSLaunchParent(self.uuid, ["/home/hearts/workspaces/hearts_erl/src/hearts_vision/aggregator/launch/face_detector.launch"])
        self.face_launch.start()
###################################TURNING OFF OBJECT LAUNCH#################
    def obj_kill_launch(self):
        self.obj_launch.shutdown()

###################################TURNING OFF FACE LAUNCH#################
    def face_kill_launch(self):
        self.face_launch.shutdown()

###################################CALLBACK METHOD###################################
    #Function to be run when some data arrives from the ROSBAG

    def positionCallback(self, data):
        print("callback running")
        if self.flag:
            if len(data.detections) > 0:
                for ObjectReal in range(len(data.detections)): #For each bodypart send/create a tf transform
                    if data.detections[ObjectReal].label in self.CagbalList_containers:
                        self.pubsay.publish("I see a " + data.detections[ObjectReal].label)
                        self.final_pos.header.frame_id = "xtion_rgb_optical_frame"
                        #CHANGE HERE
                        self.final_pos.pose.position.x = data.detections[ObjectReal].pose.pose.position.x
                        self.final_pos.pose.position.y = data.detections[ObjectReal].pose.pose.position.y
                        self.final_pos.pose.position.z = data.detections[ObjectReal].pose.pose.position.z
                        self.pubPos.publish(self.final_pos)
                        self.look_at(self.final_pos)
                        self.flag=False
                        print("yeah")
                        break
        #add routine to make tiago continually look at detected object
        else:
            if False: #len(data.detections) > 0:
                for ObjectReal in range(len(data.detections)): #For each bodypart send/create a tf transform
                    if data.detections[ObjectReal].label in self.CagbalList_containers:
                        self.final_pos.header.frame_id = "xtion_rgb_optical_frame"
                        #CHANGE HERE
                        self.final_pos.pose.position.x = data.detections[ObjectReal].pose.pose.position.x
                        self.final_pos.pose.position.y = data.detections[ObjectReal].pose.pose.position.y
                        self.final_pos.pose.position.z = data.detections[ObjectReal].pose.pose.position.z
                        #self.look_at(self.final_pos)
                        print("Sending")
                        break



################################MAIN SCRIPT#############################

if __name__ == '__main__': #Main function that calls other functions

    rospy.init_node('vision_aggregator', anonymous=True) # Node initialisation ANONYMOUS=True to allow different nodes with the same name
    n = vision_sense() #Class instantiation
    n.decision_making()
    rospy.spin() # spin() simply keeps python from exiting until this node is stopped
