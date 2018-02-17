;
;package responsabvel em armazenar funcções de caputura de teclado
;
(defpackage #:com.folha-pgto.view.views
  (:use
      :cl
      :com.folha-pgto.helpers.constantes)
  (:export
      :main)
  (:nicknames :views))

(in-package #:com.folha-pgto.view.views)

(defun prompt-read (prompt) "função generica para a captura de valores via terminal"
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun main ()
  (loop (monta-menu)
    (when (equal (monta-menu) "1")
          (princ "primeira opção selecionada"))
    (when (princ "fudeu"))))

(defun monta-menu()
  (princ (cabecalho " Menu Principal "))
  (terpri)
  (princ "  (1) Detalhar o pacote informado")
  (terpri)
  (princ "  (2) Sair do programa")
  (terpri)
  (princ *linha*)
  (terpri)
  (let ((opcao (prompt-read " Escolha a opção desejada"))) opcao))

(defun cabecalho(titulo) "monta o cabecalho para impressao"
  (let* ((cab (format nil "~a~%~a~%~a" *linha* titulo *linha*))) cab))

(defun rodape() "monta o rodape para impressao"
  (let* ((rod (format t "~a~%" *linha*))) rod))

(defun sair())
