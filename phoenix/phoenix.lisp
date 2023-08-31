(defpackage :logos.pheonix (:use :cl :logos.task))
(in-package :logos.pheonix)

(load "phoenix/social-media-moderation")

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

(defun short-wave ()
  (add-tasks '((spiritual reading)
               (meditate)
               (technical reading)
               (improve matrix code)
               (improve pheonix code)))
  (format t "Routines ran: ~a~%" (incf routine-count))
  (format t "~%~%DO NOT GO ON TWITTER~%~%"))

;; figure out a system to integrate these waves
(defun medium-wave ()
  (add-tasks '((walk dog)
               (make coffee))))

(defun time-of-day-tasks (time)
  ;; run once per time of day
  (add-tasks (cond
               ((eq time :afternoon) '((run)))
               ((eq time :morning) '((clean) (make-coffee)))
               ((eq time :evening) '((shower))))))

(defun start-time-of-day-cron ()
  (let ((morning (sb-ext:make-timer (lambda () (time-of-day-tasks :morning))))
        (afternoon (sb-ext:make-timer (lambda () (time-of-day-tasks :afternoon))))
        (evening (sb-ext:make-timer (lambda () (time-of-day-tasks :evening))))
        (utc-offset 4))
    (local-time:with-decoded-timestamp (:day day :month month :year year)
                                       (local-time:today)
      (sb-ext:schedule-timer morning (local-time:timestamp-to-universal
                                      (local-time:encode-timestamp
                                       0 0 0 (+ 7 utc-offset) day month year))
                             :repeat-interval (* 24 60 60)
                             :absolute-p t)

      (sb-ext:schedule-timer afternoon (local-time:timestamp-to-universal
                                      (local-time:encode-timestamp
                                       0 0 0 (+ 12 utc-offset) day month year))
                             :repeat-interval (* 24 60 60)
                             :absolute-p t)

      (sb-ext:schedule-timer evening (local-time:timestamp-to-universal
                                        (local-time:encode-timestamp
                                         0 0 0 (+ 4 utc-offset) day month year))
                             :repeat-interval (* 24 60 60)
                             :absolute-p t))))



