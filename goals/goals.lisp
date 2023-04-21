(defpackage :logos.goals (:use :kl) (:export :run-legacy-goals))
(in-package :logos.goals)

(defun run-legacy-goals ()
  (uiop:chdir "goals-py")
  (uiop:launch-program "./run")
  (uiop:chdir "../"))
