;
;package responsabvel em armazenar as clases do sistema
;
(defpackage #:com.folha-pgto.model.entidades
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
     :initarg :id
     :initform nil
     :accessor id)
   (descricao
     :initarg :descricao
     :initform ""
     :accessor descricao)))

;;
;; classe Pessoa - abstrata
;
(defclass pessoa (entity)
   ((cpf
      :initform nil
      :initarg :cpf
      :accessor cpf)
    (rg
      :initform nil
      :accessor rg)
    (primeiro-nome
      :initform nil
      :initarg :primeiro-nome
      :accessor primeiro-nome)
    (segundo-nome
      :initform ""
      :accessor segundo-nome)
    (sexo
      :initform ""
      :accessor sexo)
    (data-nascimento
      :initform ""
      :accessor data-nascimento)))

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
;
; classe Setor
;
(defclass setor(entity)
  ((centro-custo
     :initarg :centro-custo
     :initform ""
     :accessor centro-custo)))

(defmethod make-setor (&key descricao centro-custo)
  (make-instance 'setor :descricao descricao :centro-custo centro-custo))

;
; classe cargo
;
(defclass cargo(entity)
  ((sigla
     :initarg :sigla
     :initform ""
     :accessor sigla)))

(defmethod make-cargo (&key descricao sigla)
  (make-instance 'cargo :descricao descricao :sigla sigla))
