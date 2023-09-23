(ql:quickload :cffi)
;; it couldn't find the shared lib on Ubutu
(push "/usr/local/lib/" cffi:*foreign-library-directories*)
(ql:quickload :pzmq)
(defpackage :logos.phoenix.matrix (:use :cl) (:export :add-cube :add-a-logos))
(in-package :logos.phoenix.matrix)

(defun cube-to-str (x y z shader)
  (format nil "c ~a ~a ~a ~a" x y z shader))

(defun add-a-logos (a-logos x y z)
  (add-cube x y z)
  (let ((inferiors (logos:inferior-logoss a-logos)))
   (loop for logos in inferiors
         for inferior-x from (* -3 (floor (length inferiors) 2)) to (* 3 (ceiling (length inferiors) 2)) :by 3
         do
            (progn
              (prin1 `(add-cube ,inferior-x ,(- y 3) ,z))
              (add-cube inferior-x (- y 3) z)))))

(defparameter cubelist '())

(defun add-cube (x y z shader)
  (pzmq:with-socket socket :req
    (pzmq:connect socket "tcp://localhost:5555")
    (pzmq:send socket (cube-to-str x y z shader))))

(defmacro add-cube* (socket x y z shader)
    `(pzmq:send ,socket (cube-to-str ,x ,y ,z ,shader)))




(defparameter apps
  '(
    ("emacs" . "emacs@phoenix")
    ))

(defun api-create-app (app x y z)
  (format t "a ~a ~a ~a '~a' '~a'" x y z (car app) (cdr app)))

(defun create-app (name x y z)
  (let ((app (assoc name apps)))
    (pzmq:with-socket socket :req
      (pzmq:connect socket "tcp://localhost:5555")
      (pzmq:send socket (api-create-app app x y z))
      (pzmq:recv-string socket :dontwait t))))


(defun tron-hell ()
    (loop for z from -10 to 15 by 0.1
          do (progn
               (loop for i from -0.6 to 0.6 by 0.1 do
                 (add-cube i -0.5 z 1))
               (loop for i from -0.5 to 0.4 by 0.1 do
                 (progn (add-cube 0.6 i z 0)
                        (add-cube -0.6 i z 0)))
               (loop for i from -0.6 to 0.6 by 0.1 do
                 (add-cube i 0.4 z 0)))))
