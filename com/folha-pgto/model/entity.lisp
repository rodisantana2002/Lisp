
(defclass entity()
  (
   (id
     :accessor id
     :type 'integer)
   (descricao
     :accessor descricao)))

(defmethod entity()
  (make-instance 'entity)
)
