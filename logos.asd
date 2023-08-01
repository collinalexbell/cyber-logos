(require 'asdf)
(defsystem "logos"
  :description "a user kernel"
  :version "2.0"
  :author "kuberlog"
  :license "kuberlog"
  :depends-on ("parachute"
               "postmodern"
               "cl-store"
               "inferior-shell"
               "cl-json")
  :components ((:file "kuberlisp")
               (:file "logos")
               (:file "task/init")
               (:file "virtue")
               (:file "human")
               (:file "I")
               (:file "cyber-logos")
               (:file "db/postgres")
               (:file "daemons/package")))
