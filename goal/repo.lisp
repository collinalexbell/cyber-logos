(ql:quickload :postmodern)
(ql:quickload :cl-json)
(ql:quickload :cl-ppcre)

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

(defun read-goals-file ()
  (with-open-file (f "goals-py/goals.json")
    (apply #'concatenate 'string (uiop:read-file-lines f))))



(defun read-goals-from-json (json-string)
  (let ((json-objects (json:decode-json-from-string json-string)))
    (loop for json-object in json-objects collect
      (make-instance 'goal
                    :id (cdr (assoc :id json-object))
                    :name (cdr (assoc :name json-object))
                    :deadline (cdr (assoc :deadline json-object))
                    :notes (cdr (assoc :notes json-object))))))

(defun write-goal-to-postgres (goal)
  (let ((id (slot-value goal 'logos.goal:id))
        (name (slot-value goal 'logos.goal:name))
        (deadline (slot-value goal 'logos.goal:deadline))
        (notes (slot-value goal 'logos.goal:notes)))
    (postmodern:query (:insert-into 'goal :set 'id id 'name name 'deadline deadline 'notes notes))))

(defun load-backup-goals-into-postgres ()
  (loop for goal in (read-goals-from-json (read-goals-file)) do (write-goal-to-postgres goal)))


(defun interleave (l1 l2)
  (if (not (null l1))
   (concatenate 'list
                (list (car l1) (car l2))
                (interleave (cdr l1) (cdr l2)))
   '()))

(defun all-from-postgres ()
  (defvar goals
   (loop for goal-list
           in (postmodern:query
               "select * from goal")
         collect
         (interleave
          '(:id :name :deadline :notes)
          goal-list))))

(defun find-goal (field text)
  (if (not (null goals))
      (find-if
       #'(lambda (goal)
           (search
            text
            (slot-value goal field)))
       goals)
      '()))
