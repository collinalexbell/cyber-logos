(defpackage :logos.phoenix (:use :cl :logos.task :postmodern) (:export :short-wave-hook :tweet-complete-hook :tweet-select-hook :what-did-you-think-about-reading))
(in-package :logos.phoenix)

(load "phoenix/social-media-moderation")
(defun mission ()
  '(I spend a fully pre-funded (150k) year
    (studying planning designing and implementing
     (systems
      culture
      organizations
      state))))

(defun matrix ()
  '((Im building a game engine and game)
    (to be renamed)))

(defun plan ()
  '(build market and sell (matrix) by Oct 1))

(defun digital-seal-of-solomon ()
  '((top-node (potential and being))
    (upper-triangle-horiz (left-right progress bar))
    (bottom-node (opprotunity-cost and scrifice))))

(defparameter commitments
  '((every time the distraction bell rings - do 5 pushups)))

(defvar short-wave-count 0)

(defparameter short-waves-per-day 10)

(defun long-wave ()
  ;; might be useful to use the long-wave
  ;; to monitor the short-wave's progress
  (loop repeat short-waves-per-day collect '(short-wave)))

(defun short-wave-hook (task)
  (if (= 0 (mod short-wave-count 2))
      (medium-wave)))

(defun tweet-select-hook (task)
  (stop-social-media-moderation))
(defun tweet-complete-hook (task)
  (start-social-media-moderation))
(defun what-did-you-think-about-reading (task)
  (sb-ext:run-program "/usr/bin/terminator"
                      '("-f"
                        "-x"
                        "vim ~/notes/spiritual-reading-thoughts")))

(in-package :logos.task)
(setf (fdefinition 'hook-complete-BOW_TO_THE_SHORT-WAVE) #'logos.phoenix:short-wave-hook)
(setf (fdefinition 'hook-complete-TWEET) #'logos.phoenix:tweet-complete-hook)
(setf (fdefinition 'hook-select-TWEET) #'logos.phoenix:tweet-select-hook)
(setf (fdefinition 'hook-complete-SPIRITUAL_READING)
      #'logos.phoenix:what-did-you-think-about-reading)
(in-package :logos.phoenix)

;; &rest time
(defun short-wave (&key ((:interval interval)) ((:for for)))
  (let ((tasks '((get coffee or tea)
                 (spiritual reading)
                 (technical reading)
                 (improve matrix infode)
                 (improve phoenix infode)
                 (tweet)
                 (meditate)
                 ;; do medium wave oncomplete hook
                 (bow to the short-wave)))

        (interval-insert (if interval `((for ,interval minutes)) nil)))
        (loop for task in (reverse tasks) do
          (let ((task-with-metadata `(,@task
                                      ,@(if (or (eq for :all)
                                                (find task for :test #'equal))
                                            interval-insert))))
            (add-task task-with-metadata))))

  (format t "Short waves ran: ~a~%" (incf short-wave-count)))

(defparameter medium-wave-wavelength 2)
(defun medium-wave ()
  ;; run every 2 short waves
  (add-tasks '((make coffee)
               (take dog outside))))

(defun time-of-day-tasks (time)
  ;; run once per time of day
  (add-tasks (cond
               ((eq time :afternoon) '((run)))
               ((eq time :wake-up) '((clean) (make-coffee)))
               ((eq time :evening) '((shower))))))

(load "phoenix/cron")

