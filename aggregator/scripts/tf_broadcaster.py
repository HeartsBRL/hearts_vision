#!/usr/bin/env python

import roslib #Ros libraries
import rospy #Python library
import tf #ROS Transform library
from cob_perception_msgs.msg import DetectionArray, Detection#, DetectionLife, Life #Cagbal messages
class tf_broadcaster():

    def __init__(self):
################################CLASS INITIALISATION#############################
		#Subscriber that receives data from the recorded ROSBAGs skeleton topic

        self.sub = rospy.Subscriber(
            "/object_detection/realworld/position",
            DetectionArray,
            self.positionCallback) #Name // Type of message and Callback


###################################CALLBACK METHOD###################################
    #Function to be run when some data arrives from the ROSBAG

    def positionCallback(self, data):
        if len(data.detections) > 0:
            br = tf.TransformBroadcaster() #tf object instantiation
            for ObjectReal in range(len(data.detections)): #For each bodypart send/create a tf transform

                self.tfTransform(br,ObjectReal,data) #Method to be send tfs


###################################TF METHOD TO SET FRAME REFERENCING###################################

    #Run when data arrives from the ROSBAG

    def tfTransform(self,br,Object,Array):
        #CHANGE HERE
        br.sendTransform((Array.detections[Object].pose.pose.position.x,Array.detections[Object].pose.pose.position.y,Array.detections[Object].pose.pose.position.z), # Z is depth and Y axis is inverted
            tf.transformations.quaternion_from_euler(0, 0, 0), #Rotation (Not required)
            rospy.Time.now(), #Time at which the transform it collected
            Array.detections[Object].label, #child frame (The given joint)
            "xtion_optical_frame")	#parent frame (Started being called "world" Coordinates [0 0 0])
            # "camera_link")	#parent frame (Started being called "world" Coordinates [0 0 0])
        rospy.sleep(0.1)

################################MAIN SCRIPT#############################

if __name__ == '__main__': #Main function that calls other functions

    rospy.init_node('tf_broadcaster', anonymous=False) # Node initialisation ANONYMOUS=True to allow different nodes with the same name
    n = tf_broadcaster() #Class instantiation
rospy.spin() # spin() simply keeps python from exiting until this node is stopped
