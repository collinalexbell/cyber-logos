(in-package :logos.task)

(defun print-all-task-info (options)
  (format t "print-all-task-info ~a~%" options)
  (let ((show-task-menu (assoc :show-menu options)))
    (print-current-task *selected-task*)
    (print-task-list nil)
    (if show-task-menu (print-task-menu))))

(defgeneric print-current-task (current-task))

(defmethod print-current-task ((current-task null)))

(defmethod print-current-task ((current-task task))
  (when current-task 
    (print-task current-task)))

(defmethod print-current-task ((task-list task-list))
  (when (.selected-task task-list)
    (print-task (.selected-task task-list))))

(defun get-task-chain (task)
  (if (not (null (.parent task)))
      (cons task (get-task-chain (.parent task)))
      (list task)))

(defun print-task (selected-task)
  (loop for task in (reverse (get-task-chain selected-task))
	count task into i
	do (format t "~{~c~}~a~%"
		   (make-list (* 2 (- i 1)) :initial-element #\.)
		   (task-description task))))

(defgeneric print-task-list (task-list))

(defmethod print-task-list ((task-list task-list)))

(defmethod print-task-list ((task-list null))
  (when (inferior-logoss *selected-task*)
    (format t "~%")
    (loop for task in (filter-tasks-by-group (inferior-logoss *selected-task*) *selected-group*)
	  for i from 0 to (length (inferior-logoss *selected-task*))
	  do (format t "~a) ~dXP: ~a ~%" i
		     (task-xp task)
		     (task-description task)))))

(defun print-current-groups ()
  (format t "-----<Groups>-----~%~%")
  (let ((current-groups (current-groups)))
    (loop for group in current-groups
          for i from 0 to (length current-groups)
          do (format t "~d) ~a~%" i group)))

  (format t "~%-----</Groups>-----~%~%"))


(defun print-current-groups ()
  (format t "-----<Groups>-----~%~%")
  (let ((current-groups (current-groups)))
    (loop for group in current-groups
          for i from 0 to (length current-groups)
          do (format t "~d) ~a~%" i group)))

  (format t "~%-----</Groups>-----~%~%"))

(defun print-task-menu ()
  (format t "~%------------------------<COMMANDS>--------------------------~%")
  (format t "SELECT <#> |    COMPLETE     | DESELECT | DELETE-SELECTED ~%")
  (format t "------------------------------------------------------------~%")
  (format t "GROUPS   | SELECT-GROUP <#>  | REMIND <#> <SEC> <MIN> <HOUR>")
  (format t "~%------------------------<COMMANDS>--------------------------~%~%"))




