(defpackage :logos.ecosystem.shot-sentry.factory (:use :cl) (:import-from :logos.ecosystem :shotsentry))
(in-package :logos.ecosystem.shot-sentry.factory)

(defclass factory ()
  ((resources-needed :accessor :resources-needed
                     :initarg :resources-needed
                     :initform nil)))

(defvar factory-singleton nil)
(defun factory ()
  (if (null factory-singleton)
      (setf factory-singleton (make-instance 'factory))
      factory-singleton))

(defun edit-file ())

(defun init-dev-env ()
  `((edit-file "./ecosystem/shot-sentry.lisp")))

(defun research (thing)
  (format t "reasearch ~a~%" thing))

(defun what-resources-needed () '())

(defun research-the-resources-needed (factory)
  (setf (slot-value factory 'resources-needed)
        (dolist (resource (what-resources-needed)) (research resource))))

(defmacro spin-async-loop (&rest body)
  ;`(progn ,@body))
  `(quote ,body))

(defun build-first-prototype (factory)
  (research-the-resources-needed factory)
  (spin-async-loop
   (design-hardware)
   (print)
   (assemble)
   (test))
  (spin-async-loop
   (design-software)
   (test-integration))
  (spin-async-loop))
