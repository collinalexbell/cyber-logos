(ql:quickload :trivial-open-browser)

(in-package :logos.task)

(defparameter hooks '())
(defun add-hook (task-description action hook)
  ;; should probably do a replace instead of shadowing
  (setf hooks (acons task-description (acons action hook (get-hooks task-description)) hooks)))

(defun delete-hook (task action))

(defun get-hooks (task-description)
  (cdr (assoc task-description hooks :test #'equal)))
(defun get-hook (task-description action)
  (cdr (assoc action (get-hooks task-description) :test #'equal)))

(defun hook-select-smile (the-task)
  (format t "Please smile~%")
  (sleep 1)
  (loop for x from 0 to 3
        do (progn (format t "~a~%" x) (sleep 1)))
  (format t "Snap!!!!!~%"))

(defun www (url)
  (sb-thread:make-thread (lambda () (trivial-open-browser:open-browser url))))


(defun hook-select-WRITE_DOWN_GOALS (the-task)
  (www  "https://www.deviantart.com/renny08/art/Avengers-About-Tony-Stark-303404558?offset=0"))


(defun hook-complete-WRITE_DOWN_GOALS (the-task)
  (www  "https://www.deviantart.com/anna-kokoro/art/Cyborgs-78509781"))


(defun hook-select-WRITE_SOME_CODE (the-task)
  (www "http://www.lispworks.com/documentation/HyperSpec/Front/"))

(defun hook-select-DO_25_PUSHUPS (the-task)
  (www "https://www.youtube.com/watch?v=2ajpEcD3qkE"))
