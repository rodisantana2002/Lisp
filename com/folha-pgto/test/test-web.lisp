(asdf:operate 'asdf:load-op :aserve)
;(asdf:operate 'asdf:load-op :webactions)

(load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/helpers/constantes.lisp")
(load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/helpers/datahora.lisp")
(load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/model/entidades.lisp")


(defpackage  #:com.folha-pgto.test.test-web
  (:use
      :cl
      :acl-compat.excl
      :net.aserve
      :net.html.generator
      :com.folha-pgto.helpers.constantes
      :com.folha-pgto.helpers.datahora
      :com.folha-pgto.model.entidades)
  (:export
      :main)
  (:nicknames :test-web))

(in-package #:com.folha-pgto.test.test-web)

(defun init()
  (publish :path "/index.html"
      :content-type "text/html"
      :function
      #'(lambda (req ent)
           (with-http-response (req ent)
              (with-http-body (req ent)
                 (html
                    (:html (:head (:title "Hello World Test"))
                           (:body
                             ((:font :color (nth (random 5) '("red" "blue" "green" "purple" "black"))) "Hello ")
                             ((:font :color "blue") "World!"))))))))

  ; (publish :path "/queryform"
  ;     :content-type "text/html"
  ;     :function
  ;     #'(lambda (req ent)
  ;         (let ((name (cdr (assoc "name" (request-query req)
  ;                                 :test #'equal))))
  ;           (with-http-response (req ent)
  ;             (with-http-body (req ent)
  ;               (if* name
  ;                 then ; form was filled out, just say name
  ;                      (html (:html
  ;                              (:head (:title "Hi to " (:princ-safe name)))
  ;                              (:body "Your name is "  (:b (:princ  -safe name)))))
  ;                 else ; put up the form
  ;                      (html (:html
  ;                              (:head (:title "Tell me your name"))
  ;                              (:body
  ;                                ((:form :action "queryform") "Your name is " ((:input :type "date" :name "name" :maxlength "20"))
  ;                                                                             ((:input :type "submit" :name "enviar" :value "Enviar"))))))))))))
  ; (write "name")

;  (webaction-project "simple" :destination "site/" :index "home" :map '(("home" "view/html/pageone.clp") ("second" "view/html/pagetwo.clp")))

  (net.aserve:start :host "localhost"
                    :port 8090
                    :listeners 0))
