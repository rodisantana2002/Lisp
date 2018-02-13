(asdf:operate 'asdf:load-op :aserve)
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
  (publish :path "/charcount.html"
      :content-type "text/html"
      :function
      #'(lambda (req ent)
          (let* ((body (get-request-body req))
                 (text (if* body
                        then (cdr (assoc "quotation"
                                    (form-urlencoded-to-query body)
                                    :test #'equal)))))
           (with-http-response (req ent)
             (with-http-body (req ent)
               (if* text
                 then ; got the quotation, analyze it
                      (html
                       (:html
                         (:head (:title "Character Counts"))
                         (:body
                           (:table
                             (do ((i #.(char-code #\a) (1+ i)))
                                 ((> i #.(char-code #\z)))
                               (html (:tr
                                       (:td (:princ (code-char i)))
                                       (:td (:princ
                                              (count (code-char i
                                                      text)))))))))))
                 else ; ask for quotation
                      (html
                        (:html
                           (:head (:title "quote character counter"))
                           (:body
                              ((:form :action "charcount.html"
                                      :method "POST"
                                "Enter your favorite quote "
                                :br
                                ((:textarea
                                    :name "quotation"
                                    :rows 30
                                    :cols 50))
                                :br
                                ((:input :type "submit"
                                    :name "submit"
                                    :value "count it")))))))))))))

  (net.aserve:start :host "localhost"
                    :port 8080
                    :listeners 0))
