;
;package responsabvel em armazenar as clases do sistema
;
; (defpackage #:com.folha-pgto.model.entidades
;   (:use
;       :cl
;       :com.folha-pgto.helpers.datahora)
;   (:export
;       :make-colaborador
;       :make-setor
;       :make-id)
;   (:nicknames :entidades))

(in-package #:com.folha-pgto.model)

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
