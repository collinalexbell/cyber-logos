(in-package :logos.task)
(defclass task (logos)
  ; A task is something you do
  ((description :accessor task-description
		:initarg :description)
   (priority :accessor task-priority
	     :initarg :priority)
   (xp :accessor task-xp :initarg :xp :initform 1)
   (groups :accessor task-groups
	   :initarg :groups
	   :initform 0)
   (selected-duration :accessor task-selected-duration
		      :initarg :selected-duration
		      :initform 0)
   (last-selected-time :accessor last-selected-time)
   (parent :accessor .parent
	   :initarg :parent
	   :initform nil
     :accessor task-parent)))

(defun new-task (item priority task-groups parent &optional (xp 1000))
  (make-instance 'task
		 :description item
		 :priority priority
		 :groups task-groups
     :xp xp
		 :parent parent))

(defun subtasks (task)
  (inferior-logoss task))

(defun accumulate-work-time (the-task)
  (let ((time-diff (- (get-universal-time) (last-selected-time the-task))))
    (incf (task-selected-duration the-task) time-diff)
    (values (task-selected-duration the-task) time-diff)))

(parachute:define-test t-accumulate-work-time
  (let ((task (make-instance 'task)))
    (setf (last-selected-time task) (get-universal-time))
    (setf (task-selected-duration task) 500)
    (sleep 1)
    (accumulate-work-time task)
    (true (> (slot-value task 'selected-duration) 500))
    (true (< (slot-value task 'selected-duration) 504))))


(defun symbol-exists-p (sym)
  (fboundp sym))

(defun say-selected-task ()
  (let ((words (format nil "~a" (task-description *selected-task*))))
    (progn words nil)))
