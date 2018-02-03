;
;package responsabvel em armazenar as clases do sistema
;
(defpackage #:com.folha-pgto.model.entidades
  (:use
      :cl
      :com.folha-pgto.helpers.datahora)
  (:export
      :make-colaborador
      :make-id))

(in-package #:com.folha-pgto.model.entidades)

;
;definição das classes abstratas
(defclass entity()
  (
   (id
     :accessor id)
   (descricao
    :accessor descricao)))

;;
;; classe Pessoa - abstrata
;
(defclass pessoa (entity)
  (
    (cpf
      :accessor cpf)
    (primeiro-nome
      :accessor primeiro-nome)
    (segundo-nome
      :accessor segundo-nome)
    (data-nascimento
      :accessor data-nascimento)))

;;
;;Classe colaborador
;;
(defclass colaborador(pessoa)
 (
  (matricula
    :initarg :matricula
    :accessor matricula)
  (situacao
    :initarg :situacao
    :accessor situacao)))

(defmethod make-colaborador (&key matricula situacao)
  (make-instance 'colaborador :matricula matricula :situacao situacao))

(defun make-id()
  (let ((id (format nil "~A~A" (get-key)(format nil "~4,'0d" (random '9999))))) id))
