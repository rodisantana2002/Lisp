(defpackage #:com.folha-pgto.model.entidades
  (:use
      :cl
      :com.folha-pgto.helpers.datahora)
  (:export
      :make-entity))

(in-package #:com.folha-pgto.model.entidades)

(defclass entity()
  (
   (id
     :accessor id
     :initform (getRandom)
     :type 'integer)
   (descricao
     :accessor descricao)))

(defmethod make-entity()
  (make-instance 'entity))


(defun getRandom()1)
