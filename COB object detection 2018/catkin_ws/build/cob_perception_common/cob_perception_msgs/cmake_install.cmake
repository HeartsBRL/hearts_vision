# Install script for directory: /home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs

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
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_perception_msgs/msg" TYPE FILE FILES
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PointCloud2Array.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImageArray.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/DetectionArray.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Float64ArrayStamped.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurementArray.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PersonStamped.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/People.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ActionRecognitionmsg.msg"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_perception_msgs/cmake" TYPE FILE FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/build/cob_perception_common/cob_perception_msgs/catkin_generated/installspace/cob_perception_msgs-msg-paths.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/include/cob_perception_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/common-lisp/ros/cob_perception_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/lib/python2.7/dist-packages/cob_perception_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/lib/python2.7/dist-packages/cob_perception_msgs")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/build/cob_perception_common/cob_perception_msgs/catkin_generated/installspace/cob_perception_msgs.pc")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_perception_msgs/cmake" TYPE FILE FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/build/cob_perception_common/cob_perception_msgs/catkin_generated/installspace/cob_perception_msgs-msg-extras.cmake")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_perception_msgs/cmake" TYPE FILE FILES
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/build/cob_perception_common/cob_perception_msgs/catkin_generated/installspace/cob_perception_msgsConfig.cmake"
    "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/build/cob_perception_common/cob_perception_msgs/catkin_generated/installspace/cob_perception_msgsConfig-version.cmake"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/cob_perception_msgs" TYPE FILE FILES "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/package.xml")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

