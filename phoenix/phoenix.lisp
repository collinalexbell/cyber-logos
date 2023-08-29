(defpackage :logos.pheonix (:use :cl :logos.task))
(in-package :logos.pheonix)

(defun mission ()
  '(I spend a fully pre-funded year
    (studying planning designing and implementing
     (systems
      culture
      organizations
      state))))

(defun digital-seal-of-solomon ()
  '((top-node (potential and being))
    (upper-triangle-horiz (left-right progress bar))
    (bottom-node (opprotunity-cost and scrifice))))

(defun matrix ()
  '((uses (digital-seal-of-solomon))))

(defun self-commandments ()
  '((if (i.get-distracted) ((i.delete the-task) and (move-on)))))

(defvar routine-count 0)

(defun routine ()
  (add-tasks '((read about magic)
               (meditate)
               (improve matrix code)
               (improve pheonix code)))
  (format t "Routines ran: ~a~%" (incf routine-count))
  (format t "~%~%DO NOT GO ON TWITTER~%~%"))

(defun wmctrl ()
  (let ((output (make-string-output-stream)))
    (sb-ext:run-program "/usr/bin/wmctrl"
                        '("-l") :output output)
    (get-output-stream-string output)))

(defun window-open? (in-name)
  (not (null
        (search in-name (wmctrl)))))

(defun rickroll ()
  (sb-ext:run-program "/usr/bin/mplayer"
                      '("media/rickroll.mp4"
                        "-xy" "400"
                        "-pausing" "2")))

(defun X-is-open? ()
  (window-open? "/ X "))

(defun punishment-loop ()
  (loop do (if (X-is-open?)
               (rickroll)
               (sleep 1))))

(defun start-X-moderation ()
  (let ((punishment-thread
          (sb-thread:make-thread #'punishment-loop)))
    (defun stop-X-moderation ()
      (sb-thread:terminate-thread punishment-thread))))


(defun status ()
  (tasks)
  (format t "~%~%DO NOT GO ON TWITTER~%~%"))
