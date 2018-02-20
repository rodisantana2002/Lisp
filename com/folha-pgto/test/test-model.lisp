
(in-package #:com.folha-pgto.test)

(defvar x nil)

(defun main-model()
  (setf x (make-colaborador :matricula 0241545
                            :situacao (nth 0 *situacao-colaborador*)
                            ;:primeiro-nome nil
                            :cpf 02473454906))
  (setf (model::id x) 444) ;(make-id)
  (setf (model::sexo x) (nth 0 *sexo*))
  (setf (model::segundo-nome x) "Santana"))

  ; (setf setor (make-setor :descricao "Contabilidade"
  ;                         :centro-custo "Operacaoes")))

(defun fatorial (n)
  (if (= n 0) 1 (* n (fatorial (- n 1)))))

(defun listar (lista)
  (dolist (x lista)
    (if (evenp x) (print x) (print "impar"))))
