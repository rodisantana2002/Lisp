
(in-package #:com.folha-pgto.model)

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
