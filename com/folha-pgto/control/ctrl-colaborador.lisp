(defvar *colaborador* nil)

(defun main()
  (load "/Users/rodolfosmac/Documents/Projetos/Lisp/com/folha-pgto/model/colaborador.lisp")
  (setf *colaborador* (init-colaborador 4545))
  (write "oi"))

(defun save-db (filename)
   (with-open-file (out filename
                     :direction :output
                     :if-exists :supersede)
      (with-standard-io-syntax
        (print (describe *colaborador*) out))))

(defun load-db (filename)
   (with-open-file (in filename)
      (with-standard-io-syntax
        (setf *colaborador* (read in)))))
