# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "cob_perception_msgs: 15 messages, 0 services")

set(MSG_I_FLAGS "-Icob_perception_msgs:/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(cob_perception_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg" "cob_perception_msgs/Mask:geometry_msgs/Point:geometry_msgs/Quaternion:cob_perception_msgs/Rect:std_msgs/Header:sensor_msgs/Image:geometry_msgs/PoseStamped:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PointCloud2Array.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PointCloud2Array.msg" "sensor_msgs/PointField:sensor_msgs/PointCloud2:std_msgs/Header"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg" "geometry_msgs/Quaternion:cob_perception_msgs/Skeleton:geometry_msgs/Point:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/People.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/People.msg" "cob_perception_msgs/Person:geometry_msgs/Point:geometry_msgs/Quaternion:cob_perception_msgs/Skeleton:geometry_msgs/Pose:std_msgs/Header"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PersonStamped.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PersonStamped.msg" "cob_perception_msgs/Person:geometry_msgs/Point:geometry_msgs/Quaternion:cob_perception_msgs/Skeleton:geometry_msgs/Pose:std_msgs/Header"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg" "geometry_msgs/Vector3:std_msgs/Header:geometry_msgs/Point"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImageArray.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImageArray.msg" "cob_perception_msgs/Rect:sensor_msgs/Image:std_msgs/Header:cob_perception_msgs/ColorDepthImage"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg" "cob_perception_msgs/Rect:std_msgs/Header:sensor_msgs/Image"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg" ""
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ActionRecognitionmsg.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ActionRecognitionmsg.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Float64ArrayStamped.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Float64ArrayStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/DetectionArray.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/DetectionArray.msg" "cob_perception_msgs/Mask:geometry_msgs/Point:geometry_msgs/Quaternion:cob_perception_msgs/Detection:cob_perception_msgs/Rect:std_msgs/Header:sensor_msgs/Image:geometry_msgs/PoseStamped:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg" "cob_perception_msgs/Rect:std_msgs/Header:sensor_msgs/Image"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg" "geometry_msgs/Quaternion:geometry_msgs/Point:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurementArray.msg" NAME_WE)
add_custom_target(_cob_perception_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "cob_perception_msgs" "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurementArray.msg" "geometry_msgs/Point:geometry_msgs/Vector3:std_msgs/Header:cob_perception_msgs/PositionMeasurement"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PointCloud2Array.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/People.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PersonStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ActionRecognitionmsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImageArray.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/DetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Float64ArrayStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_cpp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurementArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(cob_perception_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(cob_perception_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(cob_perception_msgs_generate_messages cob_perception_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PointCloud2Array.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/People.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PersonStamped.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImageArray.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ActionRecognitionmsg.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Float64ArrayStamped.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/DetectionArray.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurementArray.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_cpp _cob_perception_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cob_perception_msgs_gencpp)
add_dependencies(cob_perception_msgs_gencpp cob_perception_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cob_perception_msgs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PointCloud2Array.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/People.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PersonStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ActionRecognitionmsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImageArray.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/DetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Float64ArrayStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_lisp(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurementArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(cob_perception_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(cob_perception_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(cob_perception_msgs_generate_messages cob_perception_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PointCloud2Array.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/People.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PersonStamped.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImageArray.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ActionRecognitionmsg.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Float64ArrayStamped.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/DetectionArray.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurementArray.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_lisp _cob_perception_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cob_perception_msgs_genlisp)
add_dependencies(cob_perception_msgs_genlisp cob_perception_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cob_perception_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PointCloud2Array.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/People.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PersonStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ActionRecognitionmsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImageArray.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/DetectionArray.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Float64ArrayStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg"
  "${MSG_I_FLAGS}"
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)
_generate_msg_py(cob_perception_msgs
  "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurementArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(cob_perception_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(cob_perception_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(cob_perception_msgs_generate_messages cob_perception_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Detection.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PointCloud2Array.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Person.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/People.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PersonStamped.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurement.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImageArray.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ColorDepthImage.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Rect.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/ActionRecognitionmsg.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Float64ArrayStamped.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/DetectionArray.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Mask.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/Skeleton.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_perception_msgs/msg/PositionMeasurementArray.msg" NAME_WE)
add_dependencies(cob_perception_msgs_generate_messages_py _cob_perception_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(cob_perception_msgs_genpy)
add_dependencies(cob_perception_msgs_genpy cob_perception_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS cob_perception_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/cob_perception_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(cob_perception_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(cob_perception_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(cob_perception_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/cob_perception_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(cob_perception_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(cob_perception_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(cob_perception_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/cob_perception_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(cob_perception_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(cob_perception_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(cob_perception_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
