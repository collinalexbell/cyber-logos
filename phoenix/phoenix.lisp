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

(defparameter short-waves-per-day 10)

(defun long-wave ()
  ;; might be useful to use the long-wave
  ;; to monitor the short-wave's progress
  (loop repeat short-waves-per-day collect '(short-wave)))

;; &rest time
(defun short-wave (&key ((:interval interval)) ((:for for)))
  (let ((interval-insert (if interval `((for ,interval minutes)) nil)))
   (add-tasks `((get coffee or tea)
                (spiritual content ,@(if (or (eq for :all) (find '(spiritual content) for :test #'equal))
                               interval-insert))
                (meditate ,@(if (or (eq for :all) (find '(meditate) for :test #'equal))
                      interval-insert))
                (technical reading
                           ,@(if (or (eq for :all) (find '(technical reading) for :test #'equal))
                                        interval-insert))
                (improve matrix code
                         ,@(if (or (eq for :all) (find '(improve matrix code) for :test #'equal))
                                          interval-insert))
                (improve pheonix code ,@(if (or (eq for :all) (find '(improve phoenix code) for :test #'equal))
                                           interval-insert))
                (bow to the short-wave))))
  (format t "Short waves ran: ~a~%" (incf short-wave-count)))

(defun time-of-day-tasks (time)
  ;; run once per time of day
  (add-tasks (cond
               ((eq time :afternoon) '((run)))
               ((eq time :morning) '((clean) (make-coffee)))
               ((eq time :evening) '((shower))))))

(load "phoenix/cron")

