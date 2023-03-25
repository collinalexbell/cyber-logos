(defpackage :logos.goals.6k (:use :cl))

(in-package :logos.goals.6k)

(defmacro run-a-cyberlogos (&rest args)
  (let ((when-to-run (car args)))
    `(progn
       (format t "when-to-run: ~a~%" (quote ,when-to-run)))))


(defun test-run-a-cyberlogos ()
  (macroexpand-1 '(run-a-cyberlogos (twice daily) (a) (b) (c))))

(defun 6k ()
  (run-a-cyberlogos (twice daily)
          (look at the goal twice daily)
          (visualize in depth vr visualization)
          (stream the processess)
          (do it in a park)))
