#!/usr/bin/env python  
import rospy
import math

# Because of transformations
from tf_conversions import transformations as tf

import tf2_ros
import geometry_msgs.msg
import turtlesim.msg

import numpy as np

def angleBetween(v1, v2):
    # return math.acos( numpy.dot( v1, v2 ) / ( numpy.linalg.norm( v1 ) * numpy.linalg.norm( v2 ) ) )
    v1_u = tf.unit_vector(v1)
    v2_u = tf.unit_vector(v2)
    return np.arccos(np.clip(np.dot(v1_u, v2_u), -1.0, 1.0))

def pubTransforms():
    br = tf2_ros.TransformBroadcaster()

    m_bot = tf.concatenate_matrices( tf.rotation_matrix( 1.5, [ 0, 0, 1 ] ), tf.translation_matrix( [ 0.0, -1.0, 0.0 ] ) )
    trans_bot = tf.translation_from_matrix(m_bot)
    q_bot = tf.quaternion_from_matrix(m_bot)

    t_robot = geometry_msgs.msg.TransformStamped()
    t_robot.header.stamp = rospy.Time.now()
    t_robot.header.frame_id = "base"
    t_robot.child_frame_id = "robot"
    t_robot.transform.translation.x = trans_bot[0]
    t_robot.transform.translation.y = trans_bot[1]
    t_robot.transform.translation.z = trans_bot[2]
    t_robot.transform.rotation.x = q_bot[0]
    t_robot.transform.rotation.y = q_bot[1]
    t_robot.transform.rotation.z = q_bot[2]
    t_robot.transform.rotation.w = q_bot[3]

    m_obj = tf.concatenate_matrices( tf.euler_matrix( 0.79, 0.0, 0.79 ), tf.translation_matrix( [ 0.0, 1.0, 1.0 ] ) )
    trans_obj = tf.translation_from_matrix(m_obj)
    q_object = tf.quaternion_from_matrix(m_obj)

    t_object = geometry_msgs.msg.TransformStamped()
    t_object.header.stamp = rospy.Time.now()
    t_object.header.frame_id = "base"
    t_object.child_frame_id = "object"
    t_object.transform.translation.x = trans_obj[0]
    t_object.transform.translation.y = trans_obj[1]
    t_object.transform.translation.z = trans_obj[2]
    t_object.transform.rotation.x = q_object[0]
    t_object.transform.rotation.y = q_object[1]
    t_object.transform.rotation.z = q_object[2]
    t_object.transform.rotation.w = q_object[3]
    # Calculate the vector from the camera's frame to the object's frame.
    m_cam = tf.concatenate_matrices( m_bot, tf.translation_matrix( [ 0.0, 0.1, 0.1 ] ) )
    trans_cam = tf.translation_from_matrix( m_cam )
    cam_obj_vec = []
    cam_obj_vec.append( trans_obj[0] - trans_cam[0] )
    cam_obj_vec.append( trans_obj[1] - trans_cam[1] )
    cam_obj_vec.append( trans_obj[2] - trans_cam[2] )
    # Convert the vector to unit vector
    cam_obj_vec = tf.unit_vector( cam_obj_vec )
    # Calculate angle between the two vectors
    cam_x_comp_vec = [ trans_cam[0], 0.0, 0.0 ]
    theta = angleBetween( cam_x_comp_vec, cam_obj_vec )
    # Cross product between the previous vector and the x component of the camera's frame.
    res_vec = np.cross( cam_x_comp_vec, cam_obj_vec )
    # Rotate the camera's frame around the resulting vector of the cross product.
    q = tf.quaternion_about_axis( theta, res_vec );

    t_camera = geometry_msgs.msg.TransformStamped()
    t_camera.header.stamp = rospy.Time.now()
    t_camera.header.frame_id = "base"
    t_camera.child_frame_id = "camera"
    t_camera.transform.translation.x = trans_cam[0]
    t_camera.transform.translation.y = trans_cam[1]
    t_camera.transform.translation.z = trans_cam[2]
    t_camera.transform.rotation.x = q[0]
    t_camera.transform.rotation.y = q[1]
    t_camera.transform.rotation.z = q[2]
    t_camera.transform.rotation.w = q[3]

    br.sendTransform(t_robot)
    br.sendTransform(t_camera)
    br.sendTransform(t_object)

if __name__ == '__main__':
    rospy.init_node('solution')

    while not rospy.is_shutdown():
    	pubTransforms()