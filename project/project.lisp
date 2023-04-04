(defpackage :logos.project (:use :cl))
(in-package :logos.project)

(defclass project (logos)
  ((name :initform (error "name is required") :initarg :name)

   ;; states to aim for
   (goals :initform '() :initarg :goals)

   ;; actions to take
   (tasks :initform '() :initarg :tasks)

   ;; the substance of the project
   (artifacts :initform '())))
