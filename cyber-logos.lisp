(in-package :logos)

(defvar *exclude-list* '("holon"))

;This will eventually be the main entry point to the executable
;For now, just show the capabilities
(defun cyber-logos ()
  (print-stats)
  '((classes (Logos Task Vitue))
    (packages (:logos :logos.task))))

(defun print-stats ()
  (let ((lisp-files (find-lisp-files)))
    (format t "cyber-logos code stats:~%")
    (format t "excluded folders: ~a~%" *exclude-list*)
    (format t "number of lisp files: ~a~%" (length lisp-files))
    (format t "number of packages: ~a~%" (count-packages lisp-files))))

(defun count-packages (files)
  (- (length (remove-if
            #'null
            (loop for file in files
                  collect
                  (package-in-file file))))

     ;; the search will find
     ;; the (search <term> text) below
     ;; in the package-in-file function
     ;; so that find shouldn't be counted
     ;; because it is a seach string
     ;; not an actual defpkg (notice I'm using shorthand)
     1))

(defun package-in-file (file)
  (let* ((text (uiop:read-file-string file))
         (search-index (search "defpackage" text)))
    (if (null search-index)
        nil
        (subseq text
                search-index
                (+ search-index 28)))))

(defun find-lisp-files ()
  (get-source-files-for-dir "./"))

(defun only-lisp-files (files)
  (remove-if-not #'(lambda (item) (equal (pathname-type item) "lisp")) files))


(defun get-source-files-for-dir (dir)
  (if (find (car (last (pathname-directory dir))) *exclude-list* :test #'equal)
      '()
      (apply #'concatenate
             'list
             (only-lisp-files (uiop:directory-files dir))
             (mapcar #'get-source-files-for-dir
                     (uiop:subdirectories dir)))))
