(defclass entity()
  ((id
    :initarg :id
    :initform (error "formato incorreto para o campo id.")
    :accessor id)))
