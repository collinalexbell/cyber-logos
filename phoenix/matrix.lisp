(defpackage :logos.phoenix.matrix (:use :cl) (:export :add-cube :add-a-logos))
(in-package :logos.phoenix.matrix)

(defun cube-to-str (x y z shader)
  (format nil "c ~a ~a ~a ~a" x y z shader))

(defparameter cubelist '())

(defun add-cube (x y z shader)
  (pzmq:with-socket socket :req
    (pzmq:connect socket "tcp://localhost:5555")
    (pzmq:send socket (cube-to-str x y z shader))))

(defun add-cube* (x y z shader)
  (cube-to-str x y z shader))

(defun add-a-logos (a-logos x y z shader)
  (add-cube x y z shader)
  (let ((inferiors (logos:inferior-logoss a-logos)))
    (loop for logos in inferiors
          for inferior-x from (* -3 (floor (length inferiors) 2)) to (* 3 (ceiling (length inferiors) 2)) :by 3
          do
             (progn
               (prin1 `(add-cube ,inferior-x ,(- y 3) ,z))
               (add-cube inferior-x (- y 3) z shader)))))

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

(defun tron-home (&optional (offset-x 0) (offset-y 0) (offset-z 0) (material 0))
  (labels ((add-cube+* (x y z mat) (add-cube* (+ x offset-x) (+ y offset-y) (+ z offset-z) mat)))
   (pzmq:with-socket socket :req
     (pzmq:connect socket "tcp://localhost:5555")
     (loop for z from -10 to 10
           do (progn
                (pzmq:send
                 socket
                 (format nil "~{~A~^~%~}"
                         (alexandria:flatten
                          (list
                           (loop for i from -6 to 6 collect
                                                               (add-cube+* i -5 z 1))
                           (loop for i from -5 to 4 collect
                                                               (list (add-cube+* 6 i z material)
                                                                     (add-cube+* -6 i z material)))
                           (loop for i from -6 to 6 collect
                                                               (add-cube+* i 4 z material))))))
                (pzmq:recv-string socket)))
     (loop for z from -10 to 10
           do (progn
                (pzmq:send
                 socket
                 (format nil "~{~A~^~%~}"
                         (alexandria:flatten
                          (list
                           (loop for i from -40 to -6 collect (add-cube+* i -5 z 3))
                           (loop for i from 6 to 40 collect (add-cube+* i -5 z 3))))))
                (pzmq:recv-string socket)))
     (loop for i from -40 to 40
           do (progn
                (pzmq:send
                 socket
                 (format nil "~{~A~^~%~}"
                         (alexandria:flatten
                          (list
                           (loop for z from -40 to -10 collect (add-cube+* i -5 z 3))
                           (loop for z from 10 to 40 collect (add-cube+* i -5 z 3))))))
                (pzmq:recv-string socket))))))



(defun strip-null-bytes (str)
  (remove #\null str))

(defun init-server-fn ()
  (pzmq:with-socket rep-socket :rep
    (pzmq:bind rep-socket "tcp://*:5556")
    (loop do
      (let ((data (strip-null-bytes (pzmq:recv-string rep-socket))))
        (pzmq:send rep-socket "gotit")
        (if (equal data "init")
            (progn
              (tron-home 40 10 40)))))))

(defun world-init-server ()
  (let ((world-init-server-thread (sb-thread:make-thread #'init-server-fn)))
    (defun stop-world-init-server ()
      (sb-thread:terminate-thread world-init-server-thread))))
