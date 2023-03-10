(defpackage :logos.goal (:use :cl) (:export Goal id name deadline notes))
(in-package :logos.goal)
(defclass Goal ()
  ; a goal is a task with key results and a deadline that gets celebrated when completed
  ((id :initarg :id )
   (name :initarg :name)
   (deadline :initarg :deadline)
   (notes :initarg :notes)))
