(ql:quickload :drakma)
(ql:quickload :local-time)
(defpackage :logos.phoenix (:use :cl :postmodern :logos.task) (:export :short-wave-hook :tweet-complete-hook :tweet-select-hook :what-did-you-think-about-reading))
(in-package :logos.phoenix)

(load "phoenix/social-media-moderation")
(start-social-media-moderation)
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
  '(overview ((launch kickstarter by Oct 15)
              (ask YC for cash again))))

(defun strategies ()
  '(((when I feel defeated about the complexity of things) . ((meditate to rise above them)
                                                              (have faith in the universe)
                                                              (keep going to the best of my ability)))))
(defun print-strategies (task)
  (format t "~a~%~%" (strategies)))

(defparameter commitments
  '((every time the distraction bell rings - do 5 pushups)))

(defvar short-wave-count 0)

(defparameter short-waves-per-day 5)

(defun long-wave ()
  ;; might be useful to use the long-wave
  ;; to monitor the short-wave's progress
  (loop repeat short-waves-per-day collect '(short-wave)))

(defun short-wave-hook (task)
  (if (= 0 (mod short-wave-count medium-wave-wavelength))
      (medium-wave))
  (runnable-time-of-day-tasks)
  (stop-social-media-moderation))

(defun tweet-select-hook (task)
  (format t "called")
  (stop-social-media-moderation))
(defun tweet-complete-hook (task)
  (start-social-media-moderation))


(defun elisp (form)
  (drakma:http-request "http://localhost:9005"
                       :method :post
                       :content-type "text/plain"

                       :additional-headers
                       `(("password" . ,(car (uiop:read-file-lines "phoenix/emacs-password"))))

                       :content (format nil "~S" form)))

(defun open-in-buffer (filename)
  (let ((form `(switch-to-buffer (find-file-noselect ,filename nil nil nil))))
    (elisp form)))


(defun what-did-you-think-about-reading (task)
  (open-in-buffer "~/notes/spiritual-reading-thoughts"))

(defun impulse ()
  '((get time of day tasks running as a function of shortwave)))

(defun wake () (runnable-time-of-day-tasks))

(defun flow-wave ()
  (add-tasks
   '((coffee)
     (game-design)
     (meditate)
     (work)
     (non-sleep deep rest (15 mins)))))


(defun short-wave-tasks ()
  (reverse
   '((get coffee or tea)
     ((drink coffee) and (look at New York))
     (run through what I love about the game)
     ((visualization) (meditate))
     (gamedesign reading)
     (with-subtasks (improve game design)
       (git-commit))
     (with-subtasks (improve matrix infode)
       (git-commit))
     ;; do medium wave oncomplete hook
     (bow to the short-wave)
     )))

(defun add-medatadata (task interval-insert for)
  `(,@task
    ,@(if (or (eq for :all)
              (find task for :test #'equal))
          interval-insert)))

(defun short-wave (&key ((:interval interval)) ((:for for)))
  (let ((interval-insert (if interval `((for ,interval minutes)) nil)))

        (loop for task in (short-wave-tasks) do
          (let* ((subtasks (if (eq (car task) 'with-subtasks) (remove-if-not #'listp (cddr task))))
                (task (if (null subtasks) task (cadr task)))
                (task-with-metadata (add-medatadata task interval-insert for)))

            (add-task task-with-metadata)

            (if (and (not (null subtasks))
                     (not (null (find-task task-with-metadata))))
                  (loop for subtask in subtasks do
                    (add-task subtask :parent (find-task task-with-metadata)))))))

  (start-social-media-moderation)
  (format t "Short waves ran: ~a~%" (incf short-wave-count)))

(defparameter medium-wave-wavelength 2)
(defun medium-wave ()
  ;; run every 2 short waves
  (add-tasks '((make coffee)
               (take dog outside))))

;; implement this
(defparameter day-of-completion-list (local-time:timestamp-day (local-time:today)))
(defparameter time-of-day-tasks-complete '())
(defun runnable-time-of-day-tasks ()
  (if (not (= (local-time:timestamp-day (local-time:today)) day-of-completion-list))
      ;; its a new day
      (progn (setf day-of-completion-list (local-time:timestamp-day (local-time:today)))
             (setf time-of-day-tasks-complete '())))
  (let ((time-symbol-to-time '((:bedtime 10) (:afternoon 17) (:wake-up 14) (:evening 21)))
        (hour (local-time:timestamp-hour (local-time:now))))
    (loop for time in time-symbol-to-time
          do (if (and (not (find (car time) time-of-day-tasks-complete))
                      (>= hour (cadr time)))
                 (time-of-day-tasks (car time))))))

(defun time-of-day-tasks (time)
  ;; run once per time of day
  (add-tasks (cond
               ((eq time :afternoon) '((run)))
               ((eq time :wake-up) '((make-coffee)
                                     (clean)
                                     (if weekday (apply for job))
                                     (tweet)))
               ((eq time :evening) '((shower)))
               ((eq time :bedtime)'((sleep) ((brush) (floss))))))
  (setf time-of-day-tasks-complete (cons time time-of-day-tasks-complete)))


(load "phoenix/hooks")
