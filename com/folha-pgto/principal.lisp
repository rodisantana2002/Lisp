(defun init()
  (pushnew (format nil "~afolha-pgto/" (nth 0 (directory ""))) asdf:*central-registry* :test #'equal)
  (asdf:oos     'asdf:load-op :cl-store)
  (asdf:operate 'asdf:load-op :folha-pgto)
  (in-package #:com.folha-pgto.test))

                  
