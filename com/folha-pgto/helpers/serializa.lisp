
(in-package #:com.folha-pgto.helpers)

(defun write-objeto (nome objeto) "função que serializa um objeto. Parametor 'nome -> nome do ojeto a ser serializado 'objeto -> objeto que será serializado"
  (cl-store:store objeto (make-path nome)))

(defun read-objeto(nome)
  (let ((objeto (cl-store:restore (make-path nome)))) objeto))

(defun make-path(nome) "função que retorna o objeto serializado para a memoria. Parametro 'nome -> nome do objeto a ser deserializado"
  (let ((path (format nil "~a~a~a~a" (nth 0 (directory "")) *caminho-bd* nome *extensao-arq-bd*))) path))
