;;;; out-of-touch-bot.lisp

(in-package #:out-of-touch-bot)

(defvar *alt-text1*
  "the intro to the Lucky Star anime with the song Out Of Touch by Hall & Oates overlaid on top of it")

(defun choose (c1 c2)
  (if (> (random 1.0) .25) c1 c2))

(defun main ()
  (let ((video2 (uiop:file-exists-p "video2.mp4")))
    (unless (uiop:file-exists-p "video.mp4")
      (format t "wha- where's the video? ;w;~%")
      (uiop:quit 1))
    (handler-case
        (with-user-abort
            (run-bot ((make-instance 'mastodon-bot :config-file "config.file")
                      :with-websocket nil)
              (on (:thursday :at "11:00")
                (post "its out of touch thursdays!" :visibility :public :media 
                      (if video2 
                          (choose #P"video.mp4" #P"video2.mp4")
                          `((#P"video.mp4" ,*alt-text1*)))))))
      (user-abort ()
        (uiop:quit))
      (error (e)
        (format t "error: ~a~%" e)))))
