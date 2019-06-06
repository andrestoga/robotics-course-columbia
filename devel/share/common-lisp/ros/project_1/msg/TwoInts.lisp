; Auto-generated. Do not edit!


(cl:in-package project_1-msg)


;//! \htmlinclude TwoInts.msg.html

(cl:defclass <TwoInts> (roslisp-msg-protocol:ros-message)
  ((A
    :reader A
    :initarg :A
    :type cl:integer
    :initform 0)
   (B
    :reader B
    :initarg :B
    :type cl:integer
    :initform 0))
)

(cl:defclass TwoInts (<TwoInts>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TwoInts>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TwoInts)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name project_1-msg:<TwoInts> is deprecated: use project_1-msg:TwoInts instead.")))

(cl:ensure-generic-function 'A-val :lambda-list '(m))
(cl:defmethod A-val ((m <TwoInts>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project_1-msg:A-val is deprecated.  Use project_1-msg:A instead.")
  (A m))

(cl:ensure-generic-function 'B-val :lambda-list '(m))
(cl:defmethod B-val ((m <TwoInts>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader project_1-msg:B-val is deprecated.  Use project_1-msg:B instead.")
  (B m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TwoInts>) ostream)
  "Serializes a message object of type '<TwoInts>"
  (cl:let* ((signed (cl:slot-value msg 'A)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'B)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TwoInts>) istream)
  "Deserializes a message object of type '<TwoInts>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'A) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'B) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TwoInts>)))
  "Returns string type for a message object of type '<TwoInts>"
  "project_1/TwoInts")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TwoInts)))
  "Returns string type for a message object of type 'TwoInts"
  "project_1/TwoInts")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TwoInts>)))
  "Returns md5sum for a message object of type '<TwoInts>"
  "02f05bb5bde9ff0aeeed7cca0d2e13fc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TwoInts)))
  "Returns md5sum for a message object of type 'TwoInts"
  "02f05bb5bde9ff0aeeed7cca0d2e13fc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TwoInts>)))
  "Returns full string definition for message of type '<TwoInts>"
  (cl:format cl:nil "int64 A~%int64 B~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TwoInts)))
  "Returns full string definition for message of type 'TwoInts"
  (cl:format cl:nil "int64 A~%int64 B~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TwoInts>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TwoInts>))
  "Converts a ROS message object to a list"
  (cl:list 'TwoInts
    (cl:cons ':A (A msg))
    (cl:cons ':B (B msg))
))
