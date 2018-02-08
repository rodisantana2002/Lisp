;
;package responsabvel em armazenar as clases do sistema
;
(defpackage :com.folha-pgto.model.entidades
  (:use
      :cl
      :com.folha-pgto.helpers.datahora)
  (:nicknames "entity")
  (:export
      :make-colaborador
      :make-setor
      :make-id)
  (:nicknames :entidades))

(in-package #:com.folha-pgto.model.entidades)

;
;metodo que gera um codigo unico para o campo id
;
(defun make-id()
  (let ((id (format nil "~A~A" (get-key) (format nil "~4,'0d" (random '9999))))) id))

;
;
;definição das classes abstratas
(defclass entity()
  ((id
     :accessor id)
   (descricao
     :initarg :descricao
     :accessor descricao)))

;;
;; classe Pessoa - abstrata
;
(defclass pessoa (entity)
   ((cpf
      :initarg :cpf
      :accessor cpf)
    (rg
      :accessor rg)
    (primeiro-nome
      :initarg :primeiro-nome
      :accessor primeiro-nome)
    (segundo-nome
      :accessor segundo-nome)
    (sexo
      :accessor sexo)
    (data-nascimento
      :accessor data-nascimento)))

;;
;;Classe colaborador
;;
(defclass colaborador(pessoa)
 ((matricula
      :initarg :matricula
      :accessor matricula)
  (situacao
      :initarg :situacao
      :accessor situacao)))

(defmethod make-colaborador (&key cpf primeiro-nome matricula situacao)
  (make-instance 'colaborador :cpf cpf
                              :primeiro-nome primeiro-nome
                              :matricula matricula
                              :situacao situacao))

;
; classe Setor
;
(defclass setor(entity)
    ((sigla
      :initarg :sigla
      :accessor sigla)))

(defmethod make-setor (&key descricao sigla)
  (make-instance 'setor :descricao descricao :sigla sigla))
