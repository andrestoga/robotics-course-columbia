#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Date    : 2019-05-24 12:46:46
# @Author  : Andres Torres Garcia (andrestoga@gmail.com)
# @Link    : www.andrestoga.com
# @Version : $Id$

import rospy
from project_1.msg import TwoInts
from std_msgs.msg import Int64

pub = rospy.Publisher( 'sum', Int64, queue_size=10 )

def twoIntCall(data):
	C = data.A + data.B
	rospy.loginfo( "%i + %i = %i", data.A, data.B, C )
	pub.publish( C )

def listener():
	rospy.init_node( 'listener', anonymous=True )
	rospy.Subscriber( "two_ints", TwoInts, twoIntCall )

	rospy.spin()

if __name__ == '__main__':
	try:
		listener()
	except rospy.ROSInterruptException:
		pass