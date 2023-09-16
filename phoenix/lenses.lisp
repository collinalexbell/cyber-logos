(defpackage :logos.pheonix.lenses (:use :cl) (:export lenses))
(in-package :logos.pheonix.lenses)

(defparameter source "The Art of Game Design")

(defun make-lense (name questions))

(defun lenses ()
  "Small sets of questions used to drive game design"
  `(
    ,(make-lense '(The lense of Essential Experience)

                 '((What experience do I want the player to have)
                   (What is essential to that experience)
                   (How can my game capture that essence)))))
