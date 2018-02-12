;(:ld "/usr/local/Cellar/quicklisp/dists/quicklisp/software/portableaserve-20150923-git/aserve/load.cl")
(asdf:operate 'asdf:load-op :aserve)
(load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/helpers/constantes.lisp")
(load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/helpers/datahora.lisp")
(load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/model/entidades.lisp")


(defpackage  #:com.folha-pgto.test.test-web
  (:use
      :cl
      :net.aserve
      :com.folha-pgto.helpers.constantes
      :com.folha-pgto.helpers.datahora
      :com.folha-pgto.model.entidades)
  (:export
      :main)
  (:nicknames :test-web))

(in-package #:com.folha-pgto.test.test-web)


(defun init()
  (publish-file :path "/hello.html" :file "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/view/html/hello.html")
  (net.aserve:start :port 2002  :listeners 0))
