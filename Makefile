SYSTEM_NAME = out-of-touch-bot
define LISP_CMDS
"(handler-case                    \
    (progn (ql:quickload :SYSTEM) \
           (asdf:make :SYSTEM))   \
  (error (e)                      \
    (format t \"~A~%\" e)         \
    (uiop:quit 1)))"
endef

CMDS = --eval $(subst SYSTEM,$(SYSTEM_NAME),$(LISP_CMDS))

.PHONY: clean all

all:
	ros $(CMDS)

clean: 
	rm -ri bin/
