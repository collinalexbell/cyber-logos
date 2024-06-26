(ql:quickload :inferior-shell)
(ql:quickload :cl-store)
(ql:quickload :parachute)
(ql:quickload :postmodern)

(defpackage :logos.task
  (:use :cl :postmodern :logos)
  (:export
   :task :select :complete :deselect :next
   :select-task :find-task
   :delete-selected
   :add-task :tasks :*selected-task* :*root-task*
   :add-tasks
   :add-hook
   :get-hook
   :delete-hook))

(require :parachute)
(in-package :logos.task)

(defun run-all-package-tests ()
  (dolist (test-name
	   '(t-delete-task t-select-task t-find-task
	     t-complete-task))
    (parachute:test test-name)))

(defun init ()
  (load "task/task.lisp")
  (load "task/globals.lisp")
  (load "task/storage.lisp")
  (load "task/task-list.lisp")
  (load "task/printing.lisp")
  (load "task/api.lisp")
  (load "task/hooks.lisp")
  (load "task/loader.lisp")
  (load "task/backup.lisp"))

(init)
(run-all-package-tests)

;; a way to integrate task with the rest of alexandria is to provide a macro with-tasks that dynamically lets *task-list* to the task 
