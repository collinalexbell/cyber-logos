(defmacro defkl ()
  `(defpackage :kl (:use :cl)
               (:export
                ,@(let (symbols)
                    (do-external-symbols (s (find-package :cl))
                      (push s symbols))
                    symbols))))
(defkl)


;;; Utility fns
(defun interleave (l1 l2)
  (if (not (null l1))
      (concatenate 'list
                   (list (car l1) (car l2))
                   (interleave (cdr l1) (cdr l2)))
      '()))

;;; Aliases
(setf (fdefinition 'filter) #'remove-if-not)

;; If this comment is at a line >1000, its time to turn kuberlisp into its own repo
