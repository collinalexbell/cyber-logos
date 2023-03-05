(in-package :logos)
(defun work-on-cyber-logos ()
  (format t "Work on cyber-logos~%"))

(defun work-on-kuberdog ()
  (format t "Work on kuberdog~%"))
(defun take-a-break ()
  (format t "Take a break~%"))
(defmacro do-work-until-tired (&rest body) `(progn ,@body))


(defun factory-iteration (n)
  (format t "iteration number: ~a~%" n)
  (do-work-until-tired
   (work-on-cyber-logos)
   (work-on-kuberdog))
  (take-a-break))
