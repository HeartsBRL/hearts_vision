// Generated by gencpp from file cob_3d_mapping_msgs/SetPointMap.msg
// DO NOT EDIT!


#ifndef COB_3D_MAPPING_MSGS_MESSAGE_SETPOINTMAP_H
#define COB_3D_MAPPING_MSGS_MESSAGE_SETPOINTMAP_H

#include <ros/service_traits.h>


#include <cob_3d_mapping_msgs/SetPointMapRequest.h>
#include <cob_3d_mapping_msgs/SetPointMapResponse.h>


namespace cob_3d_mapping_msgs
{

struct SetPointMap
{

typedef SetPointMapRequest Request;
typedef SetPointMapResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetPointMap
} // namespace cob_3d_mapping_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::cob_3d_mapping_msgs::SetPointMap > {
  static const char* value()
  {
    return "b84fbb39505086eb6a62d933c75cb7b4";
  }

  static const char* value(const ::cob_3d_mapping_msgs::SetPointMap&) { return value(); }
};

template<>
struct DataType< ::cob_3d_mapping_msgs::SetPointMap > {
  static const char* value()
  {
    return "cob_3d_mapping_msgs/SetPointMap";
  }

  static const char* value(const ::cob_3d_mapping_msgs::SetPointMap&) { return value(); }
};


// service_traits::MD5Sum< ::cob_3d_mapping_msgs::SetPointMapRequest> should match 
// service_traits::MD5Sum< ::cob_3d_mapping_msgs::SetPointMap > 
template<>
struct MD5Sum< ::cob_3d_mapping_msgs::SetPointMapRequest>
{
  static const char* value()
  {
    return MD5Sum< ::cob_3d_mapping_msgs::SetPointMap >::value();
  }
  static const char* value(const ::cob_3d_mapping_msgs::SetPointMapRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::cob_3d_mapping_msgs::SetPointMapRequest> should match 
// service_traits::DataType< ::cob_3d_mapping_msgs::SetPointMap > 
template<>
struct DataType< ::cob_3d_mapping_msgs::SetPointMapRequest>
{
  static const char* value()
  {
    return DataType< ::cob_3d_mapping_msgs::SetPointMap >::value();
  }
  static const char* value(const ::cob_3d_mapping_msgs::SetPointMapRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::cob_3d_mapping_msgs::SetPointMapResponse> should match 
// service_traits::MD5Sum< ::cob_3d_mapping_msgs::SetPointMap > 
template<>
struct MD5Sum< ::cob_3d_mapping_msgs::SetPointMapResponse>
{
  static const char* value()
  {
    return MD5Sum< ::cob_3d_mapping_msgs::SetPointMap >::value();
  }
  static const char* value(const ::cob_3d_mapping_msgs::SetPointMapResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::cob_3d_mapping_msgs::SetPointMapResponse> should match 
// service_traits::DataType< ::cob_3d_mapping_msgs::SetPointMap > 
template<>
struct DataType< ::cob_3d_mapping_msgs::SetPointMapResponse>
{
  static const char* value()
  {
    return DataType< ::cob_3d_mapping_msgs::SetPointMap >::value();
  }
  static const char* value(const ::cob_3d_mapping_msgs::SetPointMapResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // COB_3D_MAPPING_MSGS_MESSAGE_SETPOINTMAP_H