;definição de pacotes do repositorio
(defpackage #:com.folha-pgto.dao
  (:use
      :cl
      :cl-store
      :com.folha-pgto.helpers
      :com.folha-pgto.model)
  (:export
      ;funcoes que realizam a persistencia das tabelas nos arquivos - serializacao
      :write-table
      :read-table)
  (:nicknames :dao))
