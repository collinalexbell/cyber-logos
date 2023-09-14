(ql:quickload :cffi)
;; it couldn't find the shared lib on Ubutu
(push "/usr/local/lib/" cffi:*foreign-library-directories*)
(ql:quickload :pzmq)
(defpackage :logos.phoenix.matrix (:use :cl))
(in-package :logos.phoenix.matrix)
