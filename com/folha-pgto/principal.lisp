(defun init()
  (pushnew '#P"/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/" asdf:*central-registry* :test #'equal)
  (asdf:operate 'asdf:load-op :folha-pgto)
  (in-package #:com.folha-pgto.test))
