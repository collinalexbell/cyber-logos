(ql:quickload :postmodern)
(ql:quickload :cl-json)
(ql:quickload :cl-ppcre)

(load "./goal.lisp")

(defpackage :logos.goal.repo
  (:use :cl :postmodern :logos.goal :cl-json :uiop))

(in-package :logos.goal.repo)

(defun init-db ()
  (postmodern:execute "CREATE TABLE goal (id varchar(255), name text, deadline text, notes text)")
  )

(defun config-dbname
    (config)
  (cdr (assoc :dbname (json:decode-json-from-string config))))

(defun config-dbuser
    (config)
  (cdr (assoc :dbuser (json:decode-json-from-string config))))

(defun config-dbpass
    (config)
  (cdr (assoc :dbpass (json:decode-json-from-string config))))

(defun config-dburl
    (config)
  (cdr (assoc :dburl (json:decode-json-from-string config))))

(defun connect-with-config ()
  (let* ((config (apply #'concatenate 'string (uiop:read-file-lines "./goal/config.json")))
         (dbname
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
                      url)))

(defun read-goal-from-json (json-string)
  (let ((json-object (json:decode-json-from-string json-string)))

    (make-instance 'goal
                   :id (cdr (assoc :id json-object))
                   :name (cdr (assoc :name json-object))
                   :deadline (cdr (assoc :deadline json-object))
                   :notes (cdr (assoc :notes json-object)))))

(defun write-goal-to-postgres (goal)
  (let ((id (slot-value goal 'logos.goal:id))
        (name (slot-value goal 'logos.goal:name))
        (deadline (slot-value goal 'logos.goal:deadline)))
    (postmodern:query (:insert-into 'goal :set 'id id 'name name 'deadline deadline))))
