 (load "/Users/rodolfosmac/Documents/Projetos/Lisp/com/folha-pgto/helpers/constantes.lisp")
 (load "/Users/rodolfosmac/Documents/Projetos/Lisp/com/folha-pgto/helpers/datahora.lisp")
 (load "/Users/rodolfosmac/Documents/Projetos/Lisp/com/folha-pgto/model/entidades.lisp")
;
;teste dos pacotes entidades
;
(defpackage :com.folha-pgto.test.test-model
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
                            :situacao 0
                            :primeiro-nome "Rodolfo"
                            :cpf 02473454906)))


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
