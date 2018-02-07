(load "/Users/rodolfosmac/Documents/Projetos/Lisp/com/folha-pgto/helpers/constantes.lisp")
(load "/Users/rodolfosmac/Documents/Projetos/Lisp/com/folha-pgto/helpers/datahora.lisp")
;
;teste dos pacotes helpers
;
(defpackage :com.folha-pgto.test.test-helpers
  (:use
      :cl
      :com.folha-pgto.helpers.constantes
      :com.folha-pgto.helpers.datahora)
  (:export
      :main))

(in-package :com.folha-pgto.test.test-helpers)


(defun main()
  (progn
    (format nil "Data e hora atual do sistema: ~a" (get-data-hora))
    (format nil "dia da semana: ~a" (get-dia-semana))))
