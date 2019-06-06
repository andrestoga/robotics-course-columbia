#!/usr/bin/env python

import rospy
from project_1.msg import TwoInts

def twoIntsTalker():
	rospy.init_node( 'two_ints_talker', anonymous=True )
	pub = rospy.Publisher( 'two_ints', TwoInts, queue_size=10 )
	rate = rospy.Rate(10)

	msg = TwoInts()
	msg.A = 23
	msg.B = 17

	while not rospy.is_shutdown():
		pub.publish( msg )
		rate.sleep()

if __name__ == '__main__':
	try:
		twoIntsTalker()
	except rospy.ROSInterruptException:
		pass