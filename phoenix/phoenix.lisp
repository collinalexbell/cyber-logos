(defpackage :logos.pheonix (:use :cl :logos.task :postmodern))
(in-package :logos.pheonix)

(load "phoenix/social-media-moderation")

(defun mission ()
  '(I spend a fully pre-funded (150k) year
    (studying planning designing and implementing
     (systems
      culture
      organizations
      state))))

(defun plan ()
  '(build market and sell a video game by Oct 1))

(defun digital-seal-of-solomon ()
  '((top-node (potential and being))
    (upper-triangle-horiz (left-right progress bar))
    (bottom-node (opprotunity-cost and scrifice))))

(defun matrix ()
  '((uses (digital-seal-of-solomon))))

(defun self-commandments ()
  '((if (i.get-distracted) ((i.delete the-task) and (move-on)))))

(defvar short-wave-count 0)

(defun long-wave ()
  ;; might be useful to use the long-wave
  ;; to monitor the short-wave's progress
  '(dotimes (per-day 10)
    (short-wave)))

(defun short-wave ()
  (add-tasks '((get coffee)
               (spiritual content)
               (meditate)
               (technical reading)
               (improve matrix code)
               (improve pheonix code)
               (bow to the short-wave)))
  (format t "Short waves ran: ~a~%" (incf short-wave-count)))

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

(load "phoenix/cron")

