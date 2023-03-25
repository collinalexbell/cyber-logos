(require 'asdf)
(defsystem "logos"
  :description "a user kernel"
  :version "2.0"
  :author "kuberlog"
  :license "kuberlog"
  :depends-on ("parachute"
               "postmodern"
               "cl-store"
               "inferior-shell")
  :components ((:file "logos")
               (:file "alias")
               (:file "task/init")
               (:file "virtue")
               (:file "human")
               (:file "I")
               (:file "cyber-logos")))
