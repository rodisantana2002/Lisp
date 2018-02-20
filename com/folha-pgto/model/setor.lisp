
(in-package #:com.folha-pgto.model)

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
