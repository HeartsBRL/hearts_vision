// Generated by gencpp from file cob_object_detection_msgs/BaTestEnvironmentResponse.msg
// DO NOT EDIT!


#ifndef COB_OBJECT_DETECTION_MSGS_MESSAGE_BATESTENVIRONMENTRESPONSE_H
#define COB_OBJECT_DETECTION_MSGS_MESSAGE_BATESTENVIRONMENTRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/String.h>

namespace cob_object_detection_msgs
{
template <class ContainerAllocator>
struct BaTestEnvironmentResponse_
{
  typedef BaTestEnvironmentResponse_<ContainerAllocator> Type;

  BaTestEnvironmentResponse_()
    : mean_error(0.0)
    , std_dev(0.0)
    , min_error(0.0)
    , max_error(0.0)
    , runs_count(0.0)
    , runs_sum(0.0)
    , runs_sum2(0.0)
    , time_duration(0.0)
    , observations(0)
    , false_matchings(0)
    , result()  {
    }
  BaTestEnvironmentResponse_(const ContainerAllocator& _alloc)
    : mean_error(0.0)
    , std_dev(0.0)
    , min_error(0.0)
    , max_error(0.0)
    , runs_count(0.0)
    , runs_sum(0.0)
    , runs_sum2(0.0)
    , time_duration(0.0)
    , observations(0)
    , false_matchings(0)
    , result(_alloc)  {
  (void)_alloc;
    }



   typedef float _mean_error_type;
  _mean_error_type mean_error;

   typedef float _std_dev_type;
  _std_dev_type std_dev;

   typedef float _min_error_type;
  _min_error_type min_error;

   typedef float _max_error_type;
  _max_error_type max_error;

   typedef float _runs_count_type;
  _runs_count_type runs_count;

   typedef float _runs_sum_type;
  _runs_sum_type runs_sum;

   typedef float _runs_sum2_type;
  _runs_sum2_type runs_sum2;

   typedef float _time_duration_type;
  _time_duration_type time_duration;

   typedef int32_t _observations_type;
  _observations_type observations;

   typedef int32_t _false_matchings_type;
  _false_matchings_type false_matchings;

   typedef  ::std_msgs::String_<ContainerAllocator>  _result_type;
  _result_type result;




  typedef boost::shared_ptr< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> const> ConstPtr;

}; // struct BaTestEnvironmentResponse_

typedef ::cob_object_detection_msgs::BaTestEnvironmentResponse_<std::allocator<void> > BaTestEnvironmentResponse;

typedef boost::shared_ptr< ::cob_object_detection_msgs::BaTestEnvironmentResponse > BaTestEnvironmentResponsePtr;
typedef boost::shared_ptr< ::cob_object_detection_msgs::BaTestEnvironmentResponse const> BaTestEnvironmentResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace cob_object_detection_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/indigo/share/std_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/indigo/share/sensor_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/indigo/share/actionlib_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/indigo/share/geometry_msgs/cmake/../msg'], 'cob_object_detection_msgs': ['/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/devel/share/cob_object_detection_msgs/msg', '/home/prankit/Documents/hearts_vision/COB object detection 2018/catkin_ws/src/cob_perception_common/cob_object_detection_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "73db4f13e99b7e554aa13b596abbef41";
  }

  static const char* value(const ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x73db4f13e99b7e55ULL;
  static const uint64_t static_value2 = 0x4aa13b596abbef41ULL;
};

template<class ContainerAllocator>
struct DataType< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cob_object_detection_msgs/BaTestEnvironmentResponse";
  }

  static const char* value(const ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 mean_error\n\
float32 std_dev\n\
float32 min_error\n\
float32 max_error\n\
float32 runs_count\n\
float32 runs_sum\n\
float32 runs_sum2\n\
\n\
float32 time_duration\n\
int32 observations\n\
int32 false_matchings\n\
\n\
std_msgs/String result\n\
\n\
\n\
================================================================================\n\
MSG: std_msgs/String\n\
string data\n\
";
  }

  static const char* value(const ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.mean_error);
      stream.next(m.std_dev);
      stream.next(m.min_error);
      stream.next(m.max_error);
      stream.next(m.runs_count);
      stream.next(m.runs_sum);
      stream.next(m.runs_sum2);
      stream.next(m.time_duration);
      stream.next(m.observations);
      stream.next(m.false_matchings);
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct BaTestEnvironmentResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::cob_object_detection_msgs::BaTestEnvironmentResponse_<ContainerAllocator>& v)
  {
    s << indent << "mean_error: ";
    Printer<float>::stream(s, indent + "  ", v.mean_error);
    s << indent << "std_dev: ";
    Printer<float>::stream(s, indent + "  ", v.std_dev);
    s << indent << "min_error: ";
    Printer<float>::stream(s, indent + "  ", v.min_error);
    s << indent << "max_error: ";
    Printer<float>::stream(s, indent + "  ", v.max_error);
    s << indent << "runs_count: ";
    Printer<float>::stream(s, indent + "  ", v.runs_count);
    s << indent << "runs_sum: ";
    Printer<float>::stream(s, indent + "  ", v.runs_sum);
    s << indent << "runs_sum2: ";
    Printer<float>::stream(s, indent + "  ", v.runs_sum2);
    s << indent << "time_duration: ";
    Printer<float>::stream(s, indent + "  ", v.time_duration);
    s << indent << "observations: ";
    Printer<int32_t>::stream(s, indent + "  ", v.observations);
    s << indent << "false_matchings: ";
    Printer<int32_t>::stream(s, indent + "  ", v.false_matchings);
    s << indent << "result: ";
    s << std::endl;
    Printer< ::std_msgs::String_<ContainerAllocator> >::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COB_OBJECT_DETECTION_MSGS_MESSAGE_BATESTENVIRONMENTRESPONSE_H