
(in-package #:com.folha-pgto.helpers)

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
