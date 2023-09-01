(defpackage :logos.pheonix (:use :cl :logos.task))
(in-package :logos.pheonix)

(load "phoenix/social-media-moderation")

(defun mission ()
  '(I spend a fully pre-funded (150k) year
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
  (let ((timer-params `((:morning 7) (:afternoon 12) (:evening ,(+ 12 4))))
        (utc-offset 4))
    (loop for timer-param in timer-params do
      (local-time:with-decoded-timestamp (:hour hour :day day :month month :year year)
                                         (local-time:today)
        (sb-ext:schedule-timer (sb-ext:make-timer
                                (lambda () (let ((*selected-task* *root-task*))
                                             (time-of-day-tasks (car timer-param)))))
                               (local-time:timestamp-to-universal
                                (local-time:encode-timestamp
                                 0 0 0 (+ (cadr timer-param) utc-offset)
                                 (if (> hour (+ (cadr timer-param) utc-offset)) (+ 1 day) day)
                                 month year))
                               :repeat-interval (* 24 60 60)
                               :absolute-p t)))))

;; write code to turn off these timers if I want to
(defun stop-time-of-day-cron ()
  (loop for timer in (sb-ext:list-all-timers) do (sb-ext:unschedule-timer timer)))



