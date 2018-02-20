
(in-package #:com.folha-pgto.test)

; (asdf:operate 'asdf:load-op :aserve)
; (asdf:operate 'asdf:load-op :webactions)
;
; (load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/helpers/constantes.lisp")
; (load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/helpers/packages.lisp")
; (load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/helpers/datahora.lisp")
; (load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/model/entidades.lisp")
;
;
; (defpackage  #:com.folha-pgto.test.test-web
;   (:use
;       :cl
;       :acl-compat.excl
;       :net.aserve
;       :webactions-system
;       :net.html.generator
;       :com.folha-pgto.helpers.packages
;       :com.folha-pgto.helpers.constantes
;       :com.folha-pgto.helpers.datahora
;       :com.folha-pgto.model.entidades)
;   (:export
;       :init)
;   (:nicknames :test-web))
;

;
; (defun init()
;
;   (webaction-project "simpleproject"
;        :destination "/"
;        :index "home"
;        :map
;        '(("home"   "pageone.clp")
;          ("second" "pagetwo.clp")))
;
;
;   (net.aserve:start :host "localhost" :port 8000 :listeners 0))
;

  ; (publish :path "/index.html"
  ;     :content-type "text/html ; charset=utf-8"
  ;     :function
  ;     #'(lambda (req ent)
  ;          (with-http-response (req ent)
  ;             (with-http-body (req ent)
  ;                (html
  ;                   (:html (:head (:title "Hello World Test"))
  ;                          (:body
  ;                            ((:font :color (nth (random 5) '("red" "blue" "green" "purple" "black"))) "Hello ")
  ;                            ((:font :color "blue") "World!")
  ;                            (:table
  ;                              (do ((i #.(char-code #\a) (1+ i)))
  ;                                  ((> i #.(char-code #\z)))
  ;                                 (html (:tr
  ;                                         (:td (:princ (code-char i)))
  ;                                         (:td (:princ
  ;                                                (count (code-char i) "rodolfo"))))))))))))))

  ; (publish :path "/queryform"
  ;     :content-type "text/html ;charset=utf-08"
  ;     :function
  ;     #'(lambda (req ent)
  ;         (let ((name (cdr (assoc "name" (request-query req) :test #'equal))))
  ;           (with-http-response (req ent)
  ;             (with-http-body (req ent)
  ;               (if* name
  ;                 then ; form was filled out, just say name
  ;                      (html (:html
  ;                              (:head (:title "Packages" (:princ-safe name)))
  ;                              (:body "Pacote: "
  ;                                     (:b (:princ-safe name))
  ;                                     (:table
  ;                                       (do ((i #.(char-code #\a) (1+ i)))
  ;                                           ((> i #.(char-code #\z)))
  ;                                           (html (:tr
  ;                                                  (:td (:princ (code-char i)))
  ;                                                  (:td (:princ
  ;                                                         (count (code-char i) name))))))))))
  ;                 else ; put up the form
  ;                      (html (:html
  ;                              (:head (:title "Informe o nome do pacote a ser pesquisado "))
  ;                              (:body
  ;                                ((:form :action "queryform") "Pacote: " ((:input :type "text" :name "name" :maxlength "20"))
  ;                                                                        ((:input :type "submit" :name "enviar" :value "Enviar"))))))))))))
