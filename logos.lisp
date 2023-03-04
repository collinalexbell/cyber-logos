(defpackage :logos
  (:use :cl)
  (:export :logos :inferior-logss :link))

(in-package :logos)

(defclass logos ()
  ;; A quanta of being/becomming/pattern.
  ((name :initarg :name)
   (inferior-logoss :initform '()
		    :initarg :inferior-logoss
		    :accessor inferior-logoss)
   (superior-logoss :initform '()
                    :initarg :superior-logoss
                    :accessor superior-logoss)
   (parellel-logoss :initform '()
                    :initarg :parellel-logoss
                    :accessor parallel-logoss)
   (state :initform 'intact)))

(defun logos ()
  (make-instance 'logos))

(defun cascade (logos fn)
  ;; WARNING: this will blow the stack w/ cyclic graphs
  (funcall fn logos)
  (loop for logos in (slot-value logos 'inferior-holons)
	do (cascade logos fn)))

(defun shake (logos)
  (cascade logos #'renew))

(defgeneric renew (logos))

(defgeneric disolve (logos))

(defmethod link ((a logos) (b logos ))
  (loop for i in (list a b) do
       (let ((links (parallel-logoss i)))
         (setf links (cons b links))))
  (let ((rv (logos)))
    (setf (inferior-logoss rv) (list a b))
    rv))

(defmethod renew ((logos logos))
  (format t "No method found"))

(defmethod disolve ((logos logos))
  (setf (slot-value logos 'state) 'disolved))
