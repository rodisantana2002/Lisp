(defclass colaborador(entity)
 (
  (matricula
    :initarg :matricula
    :accessor matricula)
  (pessoa
    :initarg :pessoa
    :accessor pessoa)))

(defmethod init-colaborador (matricula)
  (setf pessoa (make-instance 'pessoa))
  (make-instance 'colaborador :matricula matricula :pessoa pessoa))
