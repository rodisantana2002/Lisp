 (load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/helpers/constantes.lisp")
 (load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/helpers/datahora.lisp")
 (load "/Users/rodolfosantana/Documents/Projetos/Lisp/com/folha-pgto/model/entidades.lisp")
;
;teste dos pacotes entidades
;
(defpackage #:com.folha-pgto.test.test-model
  (:use
      :cl
      :com.folha-pgto.helpers.constantes
      :com.folha-pgto.helpers.datahora
      :com.folha-pgto.model.entidades)
  (:export
      :main)
  (:nicknames :test-model))

(in-package #:com.folha-pgto.test.test-model)


(defun main()

  (setf x (make-colaborador :matricula 0241545
                            :situacao (nth 0 *situacao-colaborador*)
                            ;:primeiro-nome nil
                            :cpf 02473454906))
  (setf (entidades::id x) 444) ;(make-id)
  (setf (entidades::sexo x) (nth 0 *sexo*))
  (setf (entidades::segundo-nome x) "Santana")

  (setf setor (make-setor :descricao "Contabilidade"
                          :centro-custo "Operacaoes")))



; metodos que permitem que seja gerado um nickname apartir de seu requisitante
; (add-nickname "COM.FOLHA-PGTO.MODEL.ENTIDADES" "ENTITY")
; (defun add-nickname (package nickname)
;   (when (stringp package)
;     (setf package (find-package package)))
;   (check-type package package)
;   (check-type nickname string)
;   (rename-package package (package-name package)
;                   (adjoin nickname (package-nicknames package)
;                           :test #'string=)))


; (defun inspect (( object standard-object))
;   (inspect-rec (class-slots (class-of object)) object))
;
;
; (defun inspect-rec (slots o)
;   (if (atom slots) ()
;    (let ((sn (slot-definition-name (car slots)))) (cons (list sn '=> ( slot-value o sn) )  ( inspect-rec (cdr slots) o)))))


(defun fatorial (n)
  (if (= n 0) 1 (* n (fatorial (- n 1)))))

(defun listar (lista)
  (dolist (x lista)
    (if (evenp x) (print x) (print "impar"))))
