(defpackage #:com.folha-pgto.folha-pgto-system
    (:use :asdf :cl :cl-store))

(in-package #:com.folha-pgto.folha-pgto-system)

(defsystem folha-pgto
  :name "folha-pgto"
  :serial t
  :author "Rodolfo Santana"
  :components (
               (:file "helpers/package")
               (:file "helpers/constantes"  :depends-on ("helpers/package"))
               (:file "helpers/datahora"    :depends-on ("helpers/package"))
               (:file "helpers/doc-pkg"     :depends-on ("helpers/package"))
               (:file "helpers/serializa"   :depends-on ("helpers/package"))
               ;;(:file "helpers/grafo"     :depends-on ("helpers/package"))

               ;;carrega arquivos das entidades
               (:file "model/package"       :depends-on ("helpers/package"))
               (:file "model/entity"        :depends-on ("model/package"))
               (:file "model/pessoa"        :depends-on ("model/package"))
               (:file "model/setor"         :depends-on ("model/package"))
               (:file "model/cargo"         :depends-on ("model/package"))
               (:file "model/colaborador"   :depends-on ("model/package"))

               ;;carrega arquivos de teste
               (:file "test/package"        :depends-on ("helpers/package" "model/package"))
               (:file "test/test-helpers"   :depends-on ("test/package"))
               (:file "test/test-model"     :depends-on ("test/package"))
               (:file "test/test-web"       :depends-on ("test/package"))

               ;;carrega arquivos de banco de dados - generics
               (:file "dao/package"         :depends-on ("helpers/package" "model/package"))
               (:file "dao/core"            :depends-on ("dao/package"))
               (:file "dao/database"        :depends-on ("dao/package"))))

               ;;carrega arquivos de manipulação de dados/objetos
