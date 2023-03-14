(in-package :logos)

(defvar current-virtue-focus Courage)

(defun init-I ()
                                        ; create a new I if one can't be loaded
  (if (not (boundp 'I))
      (progn
        (defvar I (new-human 'Collin))
        (setf (slot-value I 'superior-logoss)
              `(USA
                NYC
                ,@(slot-value I 'superior-logoss)))
        (setf (slot-value I 'inferior-logoss)
              `(mind
                body
                ,@(slot-value I 'inferior-logoss)))

        (setf (slot-value I 'inferior-logoss) (cons logos.task:*selected-task* (inferior-logoss I)))))
  I)

(init-I)
;(defvar I (restore "i.holon"))
