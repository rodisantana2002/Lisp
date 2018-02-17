;
; para usar (doc-pkg-fns (find-package :COM.FOLHA-PGTO.TEST.TEST-WEB))
;

(defpackage #:com.folha-pgto.helpers.packages
  (:use
      :com.folha-pgto.helpers.constantes
      :cl)
  (:export
    :doc-pkg)
  (:nicknames :packages))

(in-package #:com.folha-pgto.helpers.packages)

(defvar *pkgs* ())

(defun doc-pkg (pkg) "Imprime todas as funções do pacote informado"
  (setf *pkgs* ())
  (princ (cabecalho pkg))
  (loop with home-package = (find-package pkg)
     for sym being each symbol of home-package
       when (handler-case (symbol-function sym) (undefined-function () nil))
       when (eq (symbol-package sym) home-package)
       do (pushnew (format nil " --> ~a ~a ~%" sym (or (documentation sym 'function) "")) *pkgs* :test #'equal))
  (dolist (x *pkgs*)
    (princ x))
  (princ (rodape)))

(defun cabecalho(pkg) "monta o cabecalho para impressao"
  (let* ((cab (format nil "~a~%~a~a~%~a" *linha* " Funções do pacote: " pkg *linha*))) cab))

(defun rodape() "monta o rodape para impressao"
  (let* ((rod (format t "~a~%" *linha*))) rod))
