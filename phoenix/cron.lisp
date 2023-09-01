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
