(defpackage :logos.goal (:use :cl) (:export Goal id name deadline notes))
(in-package :logos.goal)
(defclass Goal ()
  ; a goal is a task with key results and a deadline that gets celebrated when completed
  ((id :initarg :id )
   (name :initarg :name)
   (deadline :initarg :deadline)
   (notes :initarg :notes)))


;;; Be Obsesed or Be Average: Ch4: 3:24:33 on audible
;;;; Every order should come with a ... report
(defun report (goal)
  "Creates a report for the goal")

(defun next-report-time (goal)
  "Returns the time the next report should be generated")
