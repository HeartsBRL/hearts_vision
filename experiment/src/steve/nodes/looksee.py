#!/usr/bin/env python
# 
# # launch Triago in Gazebo
# roslaunch tiago_gazebo tiago_gazebo.launch robot:=steel public_sim:=true world:=look_to_point
# see tiago_public_ws/src/tiago_tutorials/look_to_point/src/look_to_point.cpp.
# see also: https://codegists.com/snippet/python/examplespy_awesomebytes_python
# see also: https://gist.githubusercontent.com/rethink-imcmahon/77a1a4d5506258f3dc1f/raw/610716f688976c85c0158455aefc7ecb7dcf4821/ros_image_saver.py
# see also: http://wiki.ros.org/pr2_controllers/Tutorials/Moving%20the%20Head
import rospy
from control_msgs.msg import PointHeadAction, PointHeadGoal
from actionlib import SimpleActionClient
from sensor_msgs.msg import Image
import cv2
from cv_bridge import CvBridge, CvBridgeError
from std_msgs.msg import String

# keyboard input
import curses

rospy.init_node('look_see')

pub = rospy.Publisher('/head_controller/point_head_action', PointHeadAction, queue_size=1)

# Instantiate CvBridge
bridge = CvBridge()

# The base_link coordinate frame is rigidly attached to the mobile robot base. 
# In relation to a body the standard is: x forward, y left, z up
# see: http://www.ros.org/reps/rep-0103.html and http://www.ros.org/reps/rep-0105.html

x = 0.0
y = 0.0
z = 1.0

# To send goals to Point head action server
class Looker(object):
    def __init__(self):
        rospy.loginfo("Initializing Looker...")
        self.ac = SimpleActionClient(
            '/head_controller/point_head_action', PointHeadAction)
        rospy.loginfo("Connecting to /head_controller/point_head_action...")
        # If more than 5s pass by, we crash
        self.ac.wait_for_server(rospy.Duration(5.0))
        rospy.loginfo("Connected!")
 
    def look_at(self, x, y, z, block=True):
        # x is forward, y is left-right (positive is left), z is height
        g = PointHeadGoal()
        g.pointing_frame = 'xtion_optical_frame'
        g.pointing_axis.z = 1.0
        g.max_velocity = 1.0
        g.min_duration = rospy.Duration(0.5)
        g.target.header.frame_id = 'base_link'
        g.target.point.x = x
        g.target.point.y = y
        g.target.point.z = z
        if block:
            self.ac.send_goal_and_wait(g)
        else:
            self.ac.send_goal(g)


def image_callback(msg):
    try:
        # Convert ROS Image message to OpenCV2
        img = bridge.imgmsg_to_cv2(msg, "bgr8")
    except CvBridgeError, e:
        print(e)
    else:
        cv2.imshow('image', img)
        cv2.waitKey(1)

def key_callback(msg):
    global x,y,z
    if len(msg.data)==0:
        return
    elif msg.data=='y':
        y = y + 0.01
    elif msg.data=='Y':
        y = y - 0.01
    elif msg.data=='x':
        x = x + 0.01
    elif msg.data=='X':
        x = x - 0.01
    elif msg.data=='z':
        z = z + 0.01
    elif msg.data=='Z':
        z = z - 0.01
    else:
        print(msg.data)
    print(x,y,z)

# Create a looker object
looker = Looker()

# create an image subscriber
imageTopic = "/xtion/rgb/image_raw"
rospy.Subscriber(imageTopic, Image, image_callback)
rospy.Subscriber('keys', String, key_callback)

# set rate to 3Hz for continuous motion (Tiago stops for safety reasons after 1 second)
rate = rospy.Rate(1)

while not rospy.is_shutdown():
    # Use it to look at a position, e.g. x=1 meter forward, y = right 0.5m, z = 1m tall
    looker.look_at(x, y, z, block=False)
    rate.sleep()