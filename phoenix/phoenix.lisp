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

(defparameter commitments
  '(
    (every time the distraction bell rings - do 5 pushups)))

(defvar short-wave-count 0)

(defparameter short-waves-per-day 10)

(defun long-wave ()
  ;; might be useful to use the long-wave
  ;; to monitor the short-wave's progress
  (loop repeat short-waves-per-day collect '(short-wave)))

;; &rest time
(defun short-wave (&key ((:interval interval)) ((:for for)))
  (let ((tasks '((get coffee or tea)
                 (spiritual reading)
                 (meditate)
                 (technical reading)
                 (improve matrix infode)
                 (improve pheonix infode)
                 (bow to the short-wave)))

        (interval-insert (if interval `((for ,interval minutes)) nil)))
        (loop for task in (reverse tasks) do
          (let ((task-with-metadata `(,@task
                                      ,@(if (or (eq for :all)
                                                (find task for :test #'equal))
                                            interval-insert))))
            (add-task task-with-metadata))))


  (format t "Short waves ran: ~a~%" (incf short-wave-count)))

(defun medium-wave ()
  ;; run every 2 short waves
  (add-tasks '((make coffee)
               (take dog outside))))

(defun time-of-day-tasks (time)
  ;; run once per time of day
  (add-tasks (cond
               ((eq time :afternoon) '((run)))
               ((eq time :morning) '((clean) (make-coffee)))
               ((eq time :evening) '((shower))))))

(load "phoenix/cron")

