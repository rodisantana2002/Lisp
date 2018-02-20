(in-package #:com.folha-pgto.model)

;;
;;Classe colaborador
;;
(defclass colaborador(pessoa)
 ((matricula
      :initarg :matricula
      :initform ""
      :accessor matricula)
  (situacao
      :initarg :situacao
      :initform ""
      :accessor situacao)))

(defmethod make-colaborador (&key cpf primeiro-nome matricula situacao)
  (make-instance 'colaborador :cpf cpf
                              :primeiro-nome primeiro-nome
                              :matricula matricula
                              :situacao situacao))
