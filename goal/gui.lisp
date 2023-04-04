; originally yanked from https://github.com/bohonghuang/cl-gtk4/examples/gtk4.lisp

; may need to do this (ql-dist:install-dist "http://dist.ultralisp.org/" :prompt nil)
(ql:quickload :cl-gtk4)
(defpackage gtk4.example
  (:use #:cl #:gtk4)
  (:export #:simple #:fibonacci #:menu-test))

(in-package #:gtk4.example)

(define-application (:name simple
                     :id "org.bohonghuang.gtk4-example.counter")
  (define-main-window (window (make-application-window :application *application*))
    (setf (window-title window) "Simple Counter")
    (let ((box (make-box :orientation +orientation-vertical+
                         :spacing 4)))
      (let ((label (make-label :str "0")))
        (setf (widget-hexpand-p label) t
              (widget-vexpand-p label) t)
        (box-append box label)
        (let ((button (make-button :label "Add"))
              (count 0))
          (connect button "clicked" (lambda (button)
                                      (declare (ignore button))
                                      (setf (label-text label) (format nil "~A" (incf count)))))
          (box-append box button))
        (let ((button (make-button :label "Exit")))
          (connect button "clicked" (lambda (button)
                                      (declare (ignore button))
                                      (window-destroy window)))
          (box-append box button)))
      (setf (window-child window) box))
    (unless (widget-visible-p window)
      (window-present window))))


(defun run ()
  (trivial-main-thread:call-in-main-thread
   (lambda ()
     (sb-int:set-floating-point-modes :traps nil)
     (simple))))
