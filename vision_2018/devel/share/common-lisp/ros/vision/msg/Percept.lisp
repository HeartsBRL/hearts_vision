; Auto-generated. Do not edit!


(cl:in-package vision-msg)


;//! \htmlinclude Percept.msg.html

(cl:defclass <Percept> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (source
    :reader source
    :initarg :source
    :type cl:string
    :initform "")
   (score
    :reader score
    :initarg :score
    :type cl:float
    :initform 0.0)
   (object_id
    :reader object_id
    :initarg :object_id
    :type cl:string
    :initform "")
   (detector
    :reader detector
    :initarg :detector
    :type cl:string
    :initform "")
   (topLeft
    :reader topLeft
    :initarg :topLeft
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (bottomRight
    :reader bottomRight
    :initarg :bottomRight
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point)))
)

(cl:defclass Percept (<Percept>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Percept>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Percept)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vision-msg:<Percept> is deprecated: use vision-msg:Percept instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <Percept>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:image-val is deprecated.  Use vision-msg:image instead.")
  (image m))

(cl:ensure-generic-function 'source-val :lambda-list '(m))
(cl:defmethod source-val ((m <Percept>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:source-val is deprecated.  Use vision-msg:source instead.")
  (source m))

(cl:ensure-generic-function 'score-val :lambda-list '(m))
(cl:defmethod score-val ((m <Percept>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:score-val is deprecated.  Use vision-msg:score instead.")
  (score m))

(cl:ensure-generic-function 'object_id-val :lambda-list '(m))
(cl:defmethod object_id-val ((m <Percept>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:object_id-val is deprecated.  Use vision-msg:object_id instead.")
  (object_id m))

(cl:ensure-generic-function 'detector-val :lambda-list '(m))
(cl:defmethod detector-val ((m <Percept>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:detector-val is deprecated.  Use vision-msg:detector instead.")
  (detector m))

(cl:ensure-generic-function 'topLeft-val :lambda-list '(m))
(cl:defmethod topLeft-val ((m <Percept>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:topLeft-val is deprecated.  Use vision-msg:topLeft instead.")
  (topLeft m))

(cl:ensure-generic-function 'bottomRight-val :lambda-list '(m))
(cl:defmethod bottomRight-val ((m <Percept>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision-msg:bottomRight-val is deprecated.  Use vision-msg:bottomRight instead.")
  (bottomRight m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Percept>) ostream)
  "Serializes a message object of type '<Percept>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'source))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'source))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'score))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'object_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'object_id))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'detector))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'detector))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'topLeft) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'bottomRight) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Percept>) istream)
  "Deserializes a message object of type '<Percept>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'source) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'source) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'score) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'object_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'object_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'detector) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'detector) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'topLeft) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'bottomRight) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Percept>)))
  "Returns string type for a message object of type '<Percept>"
  "vision/Percept")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Percept)))
  "Returns string type for a message object of type 'Percept"
  "vision/Percept")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Percept>)))
  "Returns md5sum for a message object of type '<Percept>"
  "b3bbf5d9019a8486b076503c52a44b69")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Percept)))
  "Returns md5sum for a message object of type 'Percept"
  "b3bbf5d9019a8486b076503c52a44b69")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Percept>)))
  "Returns full string definition for message of type '<Percept>"
  (cl:format cl:nil "sensor_msgs/Image image~%string source~%float32 score~%string object_id~%string detector~%geometry_msgs/Point topLeft~%geometry_msgs/Point bottomRight~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Percept)))
  "Returns full string definition for message of type 'Percept"
  (cl:format cl:nil "sensor_msgs/Image image~%string source~%float32 score~%string object_id~%string detector~%geometry_msgs/Point topLeft~%geometry_msgs/Point bottomRight~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Percept>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
     4 (cl:length (cl:slot-value msg 'source))
     4
     4 (cl:length (cl:slot-value msg 'object_id))
     4 (cl:length (cl:slot-value msg 'detector))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'topLeft))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'bottomRight))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Percept>))
  "Converts a ROS message object to a list"
  (cl:list 'Percept
    (cl:cons ':image (image msg))
    (cl:cons ':source (source msg))
    (cl:cons ':score (score msg))
    (cl:cons ':object_id (object_id msg))
    (cl:cons ':detector (detector msg))
    (cl:cons ':topLeft (topLeft msg))
    (cl:cons ':bottomRight (bottomRight msg))
))
