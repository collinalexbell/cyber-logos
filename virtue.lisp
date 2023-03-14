(in-package :logos)

(defclass Virtue ()
  ((name :initarg :name :accessor :name)))

(defvar Courage (make-instance 'Virtue :name :Courage))
(defvar Consistency (make-instance 'Virtue :name :Consistency))
