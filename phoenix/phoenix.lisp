(defpackage :logos.pheonix (:use :cl :logos.task))
(in-package :logos.pheonix)

(load "phoenix/social-media-moderation")

(defun mission ()
  '(I spend a fully pre-funded year
    (studying planning designing and implementing
     (systems
      culture
      organizations
      state))))

(defun digital-seal-of-solomon ()
  '((top-node (potential and being))
    (upper-triangle-horiz (left-right progress bar))
    (bottom-node (opprotunity-cost and scrifice))))

(defun matrix ()
  '((uses (digital-seal-of-solomon))))

(defun self-commandments ()
  '((if (i.get-distracted) ((i.delete the-task) and (move-on)))))

(defvar routine-count 0)

(defun short-wave ()
  (add-tasks '((spiritual reading)
               (meditate)
               (technical reading)
               (improve matrix code)
               (improve pheonix code)))
  (format t "Routines ran: ~a~%" (incf routine-count))
  (format t "~%~%DO NOT GO ON TWITTER~%~%"))

;; figure out a system to integrate these waves
(defun medium-wave ()
  (add-tasks '((walk dog)
               (make coffee))))

(defun long-wave ()
  (add-tasks '((clean)
               (shower))))


