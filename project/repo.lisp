(defpackage :logos.project.repo
  (:use :cl :postmodern))
(in-package :logos.project.repo)

(defun init-db ()
  (handler-case
   (postmodern:execute "CREATE TABLE project (
id SERIAL PRIMARY KEY,
name text)")
    (cl-postgres-error:duplicate-table ()
      (format t "duplicate table"))))

(defun all-from-postgres ()
  (defvar goals
    (loop for goal-list
            in (postmodern:query
                "select * from goal")
          collect
          (interleave
           '(:id :name :deadline :notes)
           goal-list))))

