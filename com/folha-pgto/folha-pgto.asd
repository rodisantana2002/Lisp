(defpackage #:com.folha-pgto.folha-pgto-system (:use :asdf :cl))
(in-package #:com.folha-pgto.folha-pgto-system)

(defsystem folha-pgto
  :name "folha-pgto"
  :serial t
  :author "Rodolfo Santana"
  :components (
    (:file "helpers/datahora")
    (:file "model/entidades" :depends-on ("helpers/datahora"))
  ))
