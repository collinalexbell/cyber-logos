(asdf:load-asd "/home/collin/cyber-logos/logos.asd")
(asdf:load-system :logos)
(logos.db.postgres:connect-with-config)
