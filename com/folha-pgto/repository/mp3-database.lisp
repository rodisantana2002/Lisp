;(in-package :com.folha-pgto.repository)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Load database

(defparameter *mp3-schema*
  (make-schema
   '((:file     string)
     (:genre    interned-string "Unknown")
     (:artist   interned-string "Unknown")
     (:album    interned-string "Unknown")
     (:song     string)
     (:track    number 0)
     (:year     number 0))))

(defparameter *mp3s* (make-instance 'table :schema *mp3-schema*))

(defun load-database ()
  (insert-row (file->row nil) *mp3s*))

(defun file->row (file)
  (list
    :file   "pesspa4"
    :genre  "rock"
    :artist "rodolfo Santana"
    :album  "numero 1"
    :song   "my love"
    :track  12
    :year   2017))

(defun load-db (filename)
  (with-open-file (in filename)
    (with-standard-io-syntax
      (setf *db* (read in)))))

(defun save-db (filename)
  (with-open-file (out filename
                   :direction :output
                   :if-exists :supersede)
    (with-standard-io-syntax
      (print *mp3s* out))))
