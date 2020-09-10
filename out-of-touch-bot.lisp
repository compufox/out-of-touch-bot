;;;; out-of-touch-bot.lisp

(in-package #:out-of-touch-bot)

(defun main ()
  (unless (uiop:file-exists-p "video.mp4")
    (format t "wha- where's the out of touch thursdays video? ;w;")
    (uiop:quit 1))
  (handler-case
      (with-user-abort
          (run-bot ((make-instance 'mastodon-bot :config-file "config.file")
                    :with-websocket nil)
            (on (:thursday :at "11:00")
              (post "its out of touch thursdays!" :visibility :public :media #P"video.mp4"))))
    (user-abort ()
      (uiop:quit))
    (error (e)
      (format t "error: ~a~%" e))))
