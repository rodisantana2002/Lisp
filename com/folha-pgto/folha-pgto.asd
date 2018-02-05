(defpackage #:com.folha-pgto.folha-pgto-system (:use :asdf :cl))
(in-package #:com.folha-pgto.folha-pgto-system)

(defsystem folha-pgto
  :name "folha-pgto"
  :author "Rodolfo Santana"
  :components (
    (:module "helpers"
      components((:file "datahora")))

    (:file "entidades" :depends-on ("helpers"))
  ))
