(defclass pessoa (entity)
  (
    (cpf
      :accessor cpf)
    (primeiro-nome
      :accessor primeiro-nome)
    (segundo-nome
      :accessor segundo-nome)
    (data-nascimento
      :accessor data-nascimento)))
