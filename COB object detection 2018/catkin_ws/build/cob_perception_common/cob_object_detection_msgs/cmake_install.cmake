# Install script for directory: /home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_object_detection_msgs/action" TYPE FILE FILES
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/action/AcquireObjectImage.action"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/action/DetectObjects.action"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/action/TrainObject.action"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_object_detection_msgs/msg" TYPE FILE FILES
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/AcquireObjectImageAction.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/AcquireObjectImageActionGoal.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/AcquireObjectImageActionResult.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/AcquireObjectImageActionFeedback.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/AcquireObjectImageGoal.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/AcquireObjectImageResult.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/AcquireObjectImageFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_object_detection_msgs/msg" TYPE FILE FILES
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/DetectObjectsAction.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/DetectObjectsActionGoal.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/DetectObjectsActionResult.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/DetectObjectsActionFeedback.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/DetectObjectsGoal.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/DetectObjectsResult.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/DetectObjectsFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_object_detection_msgs/msg" TYPE FILE FILES
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/TrainObjectAction.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/TrainObjectActionGoal.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/TrainObjectActionResult.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/TrainObjectActionFeedback.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/TrainObjectGoal.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/TrainObjectResult.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg/TrainObjectFeedback.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_object_detection_msgs/msg" TYPE FILE FILES
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/msg/DetectionArray.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/msg/Detection.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/msg/MaskArray.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/msg/Mask.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/msg/PoseRT.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/msg/RectArray.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/msg/Rect.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_object_detection_msgs/srv" TYPE FILE FILES
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/srv/AcquireObjectImage.srv"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/srv/BagTrainObject.srv"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/srv/BaTestEnvironment.srv"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/srv/DetectObjects.srv"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/srv/SaveRecordedObject.srv"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/srv/StartObjectRecording.srv"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/srv/StopObjectRecording.srv"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/srv/TrainObject.srv"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_object_detection_msgs/cmake" TYPE FILE FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/build/cob_perception_common/cob_object_detection_msgs/catkin_generated/installspace/cob_object_detection_msgs-msg-paths.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/include/cob_object_detection_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/common-lisp/ros/cob_object_detection_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/lib/python2.7/dist-packages/cob_object_detection_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/lib/python2.7/dist-packages/cob_object_detection_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/build/cob_perception_common/cob_object_detection_msgs/catkin_generated/installspace/cob_object_detection_msgs.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_object_detection_msgs/cmake" TYPE FILE FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/build/cob_perception_common/cob_object_detection_msgs/catkin_generated/installspace/cob_object_detection_msgs-msg-extras.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_object_detection_msgs/cmake" TYPE FILE FILES
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/build/cob_perception_common/cob_object_detection_msgs/catkin_generated/installspace/cob_object_detection_msgsConfig.cmake"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/build/cob_perception_common/cob_object_detection_msgs/catkin_generated/installspace/cob_object_detection_msgsConfig-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_object_detection_msgs" TYPE FILE FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/package.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cob_object_detection_msgs" TYPE PROGRAM FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/test/detection_component_testing.py")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

