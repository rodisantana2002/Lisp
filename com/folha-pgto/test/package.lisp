;definição de pacotes de teste
(defpackage #:com.folha-pgto.test
  (:use
      :cl
      :com.folha-pgto.helpers
      :com.folha-pgto.model)
  (:export
      :main-helpers
      :main-model
      :main-web)
  (:nicknames :test))
