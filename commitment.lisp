;; Author: kuberlog
;; Originally Created: 2018-10-08
;; Move holon -> logos: 2023-04-04


(defpackage :logos.commitment
  (:use :cl))

(in-package :logos.commitment)

(defparameter *commitment-file* "commitments.logos")
(defun my-commitments ()
  (with-open-file (f *commitment-file* :direction :input)
    (read f)))

(defun save-commitments (commitments)
  (with-open-file (f *commitment-file*
		                 :direction :output
		                 :if-exists :overwrite
		                 :if-does-not-exist :create)
    (write commitments :stream f)))

(defun nshuffle (sequence)
  (loop for i from (length sequence) downto 2
        do (rotatef (elt sequence (random i))
                    (elt sequence (1- i))))
  sequence)

(defun review-commitments (commitments)
  (dolist (commitment (nshuffle commitments))
    (format t "Meditate about: ~a~%" commitment)
    (sleep (* 10 1))
                                        ;(sb-ext:run-program "/bin/play" '("sounds/beep.mp3"))
    ))

(defun review-commitments* ()
  (review-commitments (my-commitments)))

