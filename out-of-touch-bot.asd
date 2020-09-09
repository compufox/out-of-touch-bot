;;;; out-of-touch-bot.asd

(asdf:defsystem #:out-of-touch-bot
  :description "youre out of touch,, im out of time (time)"
  :author "ava fox"
  :license  "NPLv1+"
  :version "0.0.1"
  :serial t
  :depends-on (#:glacier)
  :components ((:file "package")
               (:file "out-of-touch-bot"))
  :entry-point "out-of-touch-bot:main"
  :build-operation "program-op"
  :build-pathname "bin/oott-bot")
