(defun init()
  (require "asdf")
  (pushnew '#P"/Users/rodolfosmac/Documents/Projetos/Lisp/com/folha-pgto/" asdf:*central-registry* :test #'equal)
  ;; (pushnew '#P"/Users/rodolfosmac/Documents/Projetos/Lisp/com/folha-pgto/helpers/" asdf:*central-registry* :test #'equal)
  ;; (pushnew '#P"/Users/rodolfosmac/Documents/Projetos/Lisp/com/folha-pgto/control/" asdf:*central-registry* :test #'equal)
  ;; (pushnew '#P"/Users/rodolfosmac/Documents/Projetos/Lisp/com/folha-pgto/model/" asdf:*central-registry* :test #'equal)
  (asdf:operate 'asdf:load-op :folha-pgto)
  (in-package #:com.folha-pgto.model.entidades))
