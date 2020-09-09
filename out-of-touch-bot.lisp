;;;; out-of-touch-bot.lisp

(in-package #:out-of-touch-bot)

(defun main ()
  (unless (uiop:file-exists-p "video.mp4")
    (format t "wha- where's the out of touch thursdays video? ;w;")
    (uiop:quit 1))
  (run-bot ((make-instance 'mastodon-bot :config-file "config.file")
            :with-websocket nil)
    (on (:thursday :at "11:00")
      (post "" :visibility :public :media "video.mp4"))))
