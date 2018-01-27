(defclass box ()
  ((nome :accessor box-nome :initarg :nome :initform (error "Must supply a customer name."))))
