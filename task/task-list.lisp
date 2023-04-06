(in-package :logos.task)

(defclass task-list ()
  ((tasks :initform '()
	  :initarg :tasks
	  :accessor .tasks)
   (selected-task :initform nil
		  :accessor .selected-task)
   (selected-group :initform 'ALL
		   :accessor .selected-group)))

(defun yes-no (prompt)
  (format t prompt)
  (format t "~%Enter y/n to respond:")
  (eq 'y (read)))

(defun remove-nth (n list)
  (declare
   (type (integer 0) n)
   (type list list))
  (if (or (zerop n) (null list))
      (cdr list)
      (cons (car list) (remove-nth (1- n) (cdr list)))))

(defun save-tasks (&optional (file-name *global-save-file*))
  (cl-store:store (inferior-logoss *selected-task*) file-name))

(defun reload-tasks ()
  (setf (inferior-logoss *root-task*) (cl-store:restore *global-save-file*)))

(defun redisplay ()
  (save-tasks)
  (tasks))

(defun delete-tasks (&rest indicies)
  (loop for i in indicies do (setf (inferior-logoss *selected-task*) (remove-nth i (inferior-logoss *selected-task*)))))

(defun push-task-and-re-sort (task-instance)
  (push task-instance (inferior-logoss (task-parent task-instance)))
  (setf (inferior-logoss *selected-task*)
	(sort-by-priority (inferior-logoss *selected-task*))))

(defun group-constants ()
  (let ((task-groups '(all)))
    (unless (eq *selected-group* 'all)
      (push *selected-group* task-groups))
    task-groups))

(progn
 (defun add-task (item &key
                         (priority 1)
                         (xp 1)
			                   (task-groups '())
			                   (parent *selected-task*))

   (setf task-groups (append task-groups (group-constants)))
   (push-task-and-re-sort
    (new-task item priority task-groups parent xp))
   (redisplay)
   (backup *root-task*))
  (setf (fdefinition 'add) #'add-task)
  (setf (fdefinition 'a) #'add-task))


(defun add-tasks (&optional (tasks '()))
  ;;tasks is a list of tasks
  (loop for task in tasks
        do (add-task task)))

(parachute:define-test add-task-test
  (let (((inferior-logoss *selected-task*) '())
	(*selected-group* 'foo))
    (add-task '(all i do is test) :task-groups '(test))
    (true (find 'test (groups-in-task-list)))
    (true (= 1 (length (inferior-logoss *selected-task*))))
    (true (find 'foo (task-groups (first (inferior-logoss *selected-task*)))))))

(defun load-day-tasks (day)
  (add-templated-tasks
   (concatenate 'string
		"resources/"
		(string-downcase (symbol-name day))
		".tasks")))

(defun sort-by-priority (l)
  (sort l
        (lambda (a b) (> (task-priority a)
                         (task-priority b)))))

;(defvar *save-completed-task* #'save-completed-task)
(defvar *save-completed-task* (lambda () nil))
(defun complete-task (item)
  (accumulate-work-time *selected-task*)
  (cond
    ((eql *saved-task-backend* 'twitter)
     (apply #'twitter-save-completed-task `(,*selected-task*)))
    ((eql *saved-task-backend* 'txt)
     (txt-save-completed-task *selected-task*)))
  (gen-hook *selected-task* 'complete)
  (delete-task item))

(parachute:define-test t-complete-task
  (let* (((inferior-logoss *selected-task*) '())
	 (*selected-task* nil)
	 (*derp* nil)
	 (*save-completed-task* #'(lambda (task) (setf *derp* task))))
    (declare (special *derp*))
    (add-task '(all i do is win))
    (select 0)
    (complete-task (first (inferior-logoss *selected-task*)))
    (true (null *selected-task*))
    (true (= 0 (length (inferior-logoss *selected-task*))))
    (true (equal (type-of *derp*) 'task))))

(defun delete-task (&optional (item *selected-task*))
  (let
      ((item-is-selected-task-p (eq item *selected-task*)))
    (setf *selected-task* (.parent *selected-task*))
    (setf (inferior-logoss *selected-task*)
          (delete item (inferior-logoss *selected-task*) :test #'equal))
    (if item-is-selected-task-p (tasks))))

(parachute:define-test t-delete-task
  (let (((inferior-logoss *selected-task*) '())
        (*selected-task* nil))
    (add-task '(all i do is win))
    (select 0)
    (delete-task (first (inferior-logoss *selected-task*)))
    (true (null *selected-task*))
    (true (= 0 (length (inferior-logoss *selected-task*))))))


(defun filter-tasks-by-group (l g)
  (remove-if-not (lambda (t-d)
                   (find g (task-groups t-d)))
                 l))

(defun groups-in-task-list ()
  (let ((current-groups '()))
    (loop for task in (inferior-logoss *selected-task*)
          do (loop for group in (task-groups task)
                   do (setf current-groups
                            (adjoin group current-groups))))
    current-groups))

(defun select-task (item)
  (if (find item (inferior-logoss *selected-task*) :test #'equal)
      (progn (setf *selected-task* item)
             (gen-hook *selected-task* 'select))
      (format t "Item does not exist in task list")))

(parachute:define-test t-select-task
  (let (((inferior-logoss *selected-task*) '())
        (*selected-task* nil))
    (add-task '(become a millionaire))
    (select-task (first (inferior-logoss *selected-task*)))
    (true (equal '(become a millionaire) (task-description
                                          *selected-task*)))))

(defun find-task (description)
  (find description (inferior-logoss *selected-task*)
        :test #'(lambda (item task)
                  (if (equal item (task-description task)) t nil))))

(parachute:define-test t-find-task
  (let* (((inferior-logoss *selected-task*) '()))
    (add-task '(all i do is test))
    (true (equal
           '(all i do is test)
           (task-description (find-task '(all i do is test)))))
    (true (equal nil (find-task '(this is not a task))))))


