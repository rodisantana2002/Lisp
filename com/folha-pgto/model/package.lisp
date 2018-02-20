;arquivo de definição do pacote - model

(defpackage #:com.folha-pgto.model
  (:use
      :cl
      :com.folha-pgto.helpers)
  (:export
      :make-colaborador
      :make-setor
      :make-cargo
      :make-id)
  (:nicknames :model))
