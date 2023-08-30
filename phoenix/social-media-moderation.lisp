(in-package :logos.pheonix)
(defun wmctrl ()
  (let ((output (make-string-output-stream)))
    (sb-ext:run-program "/usr/bin/wmctrl"
                        '("-l") :output output)
    (get-output-stream-string output)))

(defun window-open? (in-name)
  (not (null
        (search in-name (wmctrl)))))

(defun refocus ()
  (sb-ext:run-program "/usr/bin/mplayer"
                      '("media/singing_bowl.mp4"
                        "-xy" "400"
                        "-pausing" "2")))

(defun X-is-open? ()
  (window-open? "/ X "))

(defun reddit-is-open? ()
  (window-open? "Reddit"))

(defun focus-loop ()
  (loop do (if (or (X-is-open?) (reddit-is-open?))
               (refocus)
               (sleep 1))))

(defun start-social-media-moderation ()
  (let ((focus-thread
          (sb-thread:make-thread #'focus-loop)))
    (defun stop-social-media-moderation ()
      (sb-thread:terminate-thread focus-thread))))


(defun status ()
  (tasks)
  (format t "~%~%DO NOT GO ON TWITTER~%~%"))

(defun tweets-not-short-enough (tweets)
  ;; use loop
  (loop for tweet in tweets
        when (> (length tweet) 280)
          collect tweet))

