(defpackage :logos.goals.6k (:use :cl))

(in-package :logos.goals.6k)

(defun runner-outstream ()
  ; returns an outstream for the cyberlogos to attach its output to
  )

(defun schedule-with-outstream (when-to-run outstream)
  (list when-to-run outstream)
  ;; this is what creates the timer instances
  )

(defmacro run-a-cyberlogos (&rest args)
  (let ((when-to-run (car args)))
    `(progn
       (format t "when-to-run: ~a~%" (quote ,when-to-run))

       ;; a stream is needed, because these closures will be ran on a schedule
       ;; std:out can not be reliably used
       (schedule-with-outstream
        (quote ,when-to-run) (runner-outstream)))))


(defun test-run-a-cyberlogos ()
  (macroexpand-1 '(run-a-cyberlogos (twice daily) (a) (b) (c))))

(defun 6k ()
  (run-a-cyberlogos (twice daily)
          (look at the goal)
          (visualize in depth vr visualization)
          (stream the processess)
          (maybe do it in a park)))
