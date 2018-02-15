;
; para usar (doc-pkg-fns (find-package :COM.FOLHA-PGTO.TEST.TEST-WEB))
;

(defun doc-pkg-fns (pkg)
  (loop with home-package = (find-package pkg)
     for sym being each symbol of home-package
       when (handler-case (symbol-function sym) (undefined-function () nil))
       when (eq (symbol-package sym) home-package)
       do (format t "~a~%~a~%" sym
                (or (documentation sym 'function) ""))))
