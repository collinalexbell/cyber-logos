(ql:quickload :postmodern)
(ql:quickload :cl-json)
(ql:quickload :cl-ppcre)

(defpackage :logos.db.postgres
  (:use :cl :postmodern :cl-json :uiop)
  (:export :connect-with-config))

(in-package :logos.db.postgres)

(defun config-dbname
    (config)
  (cdr (assoc :dbname (json:decode-json-from-string config))))

(defun config-dbuser
    (config)
  (cdr (assoc :dbuser (json:decode-json-from-string config))))

(defun config-dbpass
    (config)
  (cdr (assoc :dbpass (json:decode-json-from-string config))))

(defun config-dburl
    (config)
  (cdr (assoc :dburl (json:decode-json-from-string config))))

(defun connect-with-config ()
  (let* ((config (apply #'concatenate 'string (uiop:read-file-lines "db/postgres_config.json")))
         (dbname
           (config-dbname config))
         (user
           (config-dbuser config))
         (pass
           (config-dbpass config))
         (url
           (config-dburl config)))


    (connect-toplevel dbname
                      user
                      pass
                      url)))


