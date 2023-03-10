(ql:quickload :postmodern)
(ql:quickload :cl-json)
(ql:quickload :cl-ppcre)

(load "./goal.lisp")

(defpackage :logos.goal.repo
  (:use :cl :postmodern :logos.goal))

(in-package :logos.goal.repo)

(defun config-dbname (config))
(defun config-dbuser (config))
(defun config-dbpass (config))
(defun config-dburl (config))

(defun connect-with-config ()
    (with-open-file (

                  config
                  "config"
                  :direction :input

                  )

   (let ((dbname
           (config-dbname config))
         (user
           (config-dbuser config))
         (pass
           (config-dbpass config))
         (url
           (config-dburl config)))


     (connect-toplevel dbname
                       user
                       pass
                       url))))


(defun read-goal-from-json (json-string)
  (let ((json-object (json:decode-json-from-string json-string)))
    
    (make-instance 'goal
                   :id (cdr (assoc 'id json-object))
                   :name (cdr (assoc 'name json-object))
                   :deadline (cdr (assoc 'deadline json-object))
                   :notes (cdr (assoc 'notes json-object)))))
