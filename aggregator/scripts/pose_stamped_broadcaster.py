#!/usr/bin/env python
import sys
import roslib #Ros libraries
import rospy #Python library
import tf #ROS Transform library
from cob_perception_msgs.msg import DetectionArray, Detection#, DetectionLife, Life #Cagbal messages
from geometry_msgs.msg import PoseStamped
from std_msgs.msg import String


class PS_broadcaster():

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

        self.final_pos = PoseStamped()
        self.args = rospy.myargv(argv=sys.argv) # rospy adapatation of sys arguments
        self.flag = True

    def decision_making(self):

        rate = rospy.Rate(10) # update rate of 10hz

        while not rospy.is_shutdown():

            rate.sleep()
###################################CALLBACK METHOD###################################
    #Function to be run when some data arrives from the ROSBAG

    def positionCallback(self, data):
        if self.flag:
            if len(data.detections) > 0:
                for ObjectReal in range(len(data.detections)): #For each bodypart send/create a tf transform
                    if data.detections[ObjectReal].label == self.args[1]:
                        self.pubsay.publish("I see a " + data.detections[ObjectReal].label)
                        self.final_pos.header.frame_id = "xtion_rgb_optical_frame"
                        #CHANGE HERE
                        self.final_pos.pose.position.x = data.detections[ObjectReal].pose.pose.position.x
                        self.final_pos.pose.position.y = data.detections[ObjectReal].pose.pose.position.y
                        self.final_pos.pose.position.z = data.detections[ObjectReal].pose.pose.position.z
                        self.pubPos.publish(self.final_pos)
                        self.pubPos2.publish(self.final_pos)
                        self.flag=False
                        print("yeah")
                        break
        #add routine to make tiago continually look at detected object
        else:
            if len(data.detections) > 0:
                for ObjectReal in range(len(data.detections)): #For each bodypart send/create a tf transform
                    if data.detections[ObjectReal].label == self.args[1]:
                        self.final_pos.header.frame_id = "xtion_rgb_optical_frame"
                        #CHANGE HERE
                        self.final_pos.pose.position.x = data.detections[ObjectReal].pose.pose.position.x
                        self.final_pos.pose.position.y = data.detections[ObjectReal].pose.pose.position.y
                        self.final_pos.pose.position.z = data.detections[ObjectReal].pose.pose.position.z
                        self.pubPos2.publish(self.final_pos)
                        break



################################MAIN SCRIPT#############################

if __name__ == '__main__': #Main function that calls other functions

    rospy.init_node('body_data_handling', anonymous=True) # Node initialisation ANONYMOUS=True to allow different nodes with the same name
    n = PS_broadcaster() #Class instantiation
    n.decision_making()
    rospy.spin() # spin() simply keeps python from exiting until this node is stopped
