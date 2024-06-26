(ql:quickload :swank)
(require :swank)
(swank:create-server :port 4005 :dont-close t)

(ql:quickload :cffi)
(ql:quickload :pzmq)
;; it couldn't find the shared lib on Ubutu
(push "/usr/local/lib/" cffi:*foreign-library-directories*)
(asdf:load-asd "/home/collin/cyber-logos/logos.asd")
(asdf:load-system :logos)
(logos.db.postgres:connect-with-config)
(logos.phoenix.matrix:world-init-server)
