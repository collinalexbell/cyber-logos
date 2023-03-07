(in-package :logos)

(defclass Virtue ()
  ((name :initarg :name :accessor :name)))

(defvar Courage (make-instance 'Virtue :name :Courage))
