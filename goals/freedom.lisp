(defpackage :logos.pheonix (:use :cl :logos.task))
(in-package :logos.pheonix)

(defun digital-seal-of-solomon ()
  '((top-node (potential and being))
    (upper-triangle-horiz (left-right progress bar))
    (bottom-node (opprotunity-cost and scrifice))))

(defun matrix ()
  '((uses (digital-seal-of-solomon))))

(defun routine ()
  (add-tasks '((read about magic)
               (meditate)
               (improve matrix code)
               (improve pheonix code))))
