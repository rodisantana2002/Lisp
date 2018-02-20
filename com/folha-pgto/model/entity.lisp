
(in-package #:com.folha-pgto.model)

;
;
;definição das classes abstratas - Entity
(defclass entity()
  ((id
     :initarg :id
     :initform nil
     :accessor id)
   (descricao
     :initarg :descricao
     :initform ""
     :accessor descricao)))

;
;metodo que gera um codigo unico para o campo id
;
(defun make-id()
  (let ((id (format nil "~A~A" (get-key) (format nil "~4,'0d" (random '9999))))) id))
