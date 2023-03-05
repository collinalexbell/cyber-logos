(in-package :logos)
(defun work-on-cyber-logos ())
(defun work-on-kuberdog ())
(defun take-a-break ())
(defmacro do-work-until-tired (&rest body) `(progn ,@body))


(defun factory-iteration ()
  (do-work-until-tired
   (work-on-cyber-logos)
   (work-on-kuberdog))
  (take-a-break))
