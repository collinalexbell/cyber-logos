(ql:quickload :cffi)
;; it couldn't find the shared lib on Ubutu
(push "/usr/local/lib/" cffi:*foreign-library-directories*)
(ql:quickload :pzmq)
(defpackage :logos.phoenix.matrix (:use :cl))
(in-package :logos.phoenix.matrix)

(defun cube-to-str (x y z)
  (format nil "c ~a ~a ~a" x y z))

(defun add-cube (x y z)
    (pzmq:with-socket socket :req
      (pzmq:connect socket "tcp://localhost:5555")
      (pzmq:send socket (cube-to-str x y z))))
