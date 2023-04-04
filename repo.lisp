(defpackage :logos.repo (:use :cl))
(in-package :logos.repo)

(defclass repo (logos)
  ((remotes :initform '() :initarg :remotes)
   (tasks :initform '() :initarg :tasks)))

()
