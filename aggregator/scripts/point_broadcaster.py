#!/usr/bin/env python
import sys
import roslib #Ros libraries
import rospy #Python library
import tf #ROS Transform library
import time
from cob_perception_msgs.msg import DetectionArray, Detection#, DetectionLife, Life #Cagbal messages
from geometry_msgs.msg import PoseStamped
from std_msgs.msg import String
from hearts_follow_msgs.msg import ConPoint, Points

class PS_broadcaster():

    def __init__(self):
################################CLASS INITIALISATION#############################
		#Subscriber that receives data from the recorded ROSBAGs skeleton topic

        self.sub = rospy.Subscriber(
            "/object_detection/realworld/position",
            DetectionArray,
            self.positionCallback) #Name // Type of message and Callback

        # Publishes the decision made by the aggregator
#        self.pubPos = rospy.Publisher(
#                "/aruco_single/pose",
#                PoseStamped,
#                queue_size=1)

#        self.pubPos2 = rospy.Publisher(
#                "/look_at",
#                PoseStamped,
#                queue_size=1)

        self.pubPoints = rospy.Publisher("hearts/follow_candidates", Points, queue_size=1)

        #Publish to get what we want to say
        self.pubsay = rospy.Publisher(
            '/hearts/tts',
            String,
            queue_size=1)

        self.final_pos = PoseStamped()
        self.args = rospy.myargv(argv=sys.argv) # rospy adapatation of sys arguments
        self.flag = True
        self.points = Points()
        self.commtime = time.time()

    def decision_making(self):

        rate = rospy.Rate(10) # update rate of 10hz

        while not rospy.is_shutdown():

            rate.sleep()
###################################CALLBACK METHOD###################################
    #Function to be run when some data arrives from the ROSBAG

    def positionCallback(self, data):
        #look = False
        self.points = Points()
        self.points.header.frame_id = "xtion_rgb_optical_frame"
        if self.flag and (time.time() - self.commtime > 1):
            if len(data.detections) > 0:
                #print "looking"
                for ObjectReal in range(len(data.detections)): #For each bodypart send/create a tf transform
                    if data.detections[ObjectReal].label == "person":
                        conPoint = ConPoint()
                        #self.pubsay.publish("I see a " + data.detections[ObjectReal].label)
                        #self.final_pos.header.frame_id = "xtion_optical_frame"#"camera_link"#"xtion_rgb_optical_frame"
                        #CHANGE HERE
                        conPoint.point.x = data.detections[ObjectReal].pose.pose.position.x
                        conPoint.point.y = data.detections[ObjectReal].pose.pose.position.y
                        conPoint.point.z = data.detections[ObjectReal].pose.pose.position.z
                        self.points.points.append(conPoint)
                        #self.pubPos.publish(self.final_pos)
                        #self.pubPos2.publish(self.final_pos)
                        #self.flag=False
                        #look = False
                        print(self.points.points)

                if len(self.points.points) > 0:        #break
                    self.pubPoints.publish(self.points)
                    self.commtime = time.time()

################################MAIN SCRIPT#############################

if __name__ == '__main__': #Main function that calls other functions

    rospy.init_node('body_data_handling', anonymous=True) # Node initialisation ANONYMOUS=True to allow different nodes with the same name
    n = PS_broadcaster() #Class instantiation
    n.decision_making()
    rospy.spin() # spin() simply keeps python from exiting until this node is stopped
