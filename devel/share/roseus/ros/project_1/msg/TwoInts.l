;; Auto-generated. Do not edit!


(when (boundp 'project_1::TwoInts)
  (if (not (find-package "PROJECT_1"))
    (make-package "PROJECT_1"))
  (shadow 'TwoInts (find-package "PROJECT_1")))
(unless (find-package "PROJECT_1::TWOINTS")
  (make-package "PROJECT_1::TWOINTS"))

(in-package "ROS")
;;//! \htmlinclude TwoInts.msg.html


(defclass project_1::TwoInts
  :super ros::object
  :slots (_A _B ))

(defmethod project_1::TwoInts
  (:init
   (&key
    ((:A __A) 0)
    ((:B __B) 0)
    )
   (send-super :init)
   (setq _A (round __A))
   (setq _B (round __B))
   self)
  (:A
   (&optional __A)
   (if __A (setq _A __A)) _A)
  (:B
   (&optional __B)
   (if __B (setq _B __B)) _B)
  (:serialization-length
   ()
   (+
    ;; int64 _A
    8
    ;; int64 _B
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _A
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _A (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _A) (= (length (_A . bv)) 2)) ;; bignum
              (write-long (ash (elt (_A . bv) 0) 0) s)
              (write-long (ash (elt (_A . bv) 1) -1) s))
             ((and (class _A) (= (length (_A . bv)) 1)) ;; big1
              (write-long (elt (_A . bv) 0) s)
              (write-long (if (>= _A 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _A s)(write-long (if (>= _A 0) 0 #xffffffff) s)))
     ;; int64 _B
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _B (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _B) (= (length (_B . bv)) 2)) ;; bignum
              (write-long (ash (elt (_B . bv) 0) 0) s)
              (write-long (ash (elt (_B . bv) 1) -1) s))
             ((and (class _B) (= (length (_B . bv)) 1)) ;; big1
              (write-long (elt (_B . bv) 0) s)
              (write-long (if (>= _B 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _B s)(write-long (if (>= _B 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _A
#+(or :alpha :irix6 :x86_64)
      (setf _A (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _A (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _B
#+(or :alpha :irix6 :x86_64)
      (setf _B (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _B (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get project_1::TwoInts :md5sum-) "02f05bb5bde9ff0aeeed7cca0d2e13fc")
(setf (get project_1::TwoInts :datatype-) "project_1/TwoInts")
(setf (get project_1::TwoInts :definition-)
      "int64 A
int64 B
")



(provide :project_1/TwoInts "02f05bb5bde9ff0aeeed7cca0d2e13fc")


