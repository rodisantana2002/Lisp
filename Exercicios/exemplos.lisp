(defclass box ()
  ((nome :accessor box-nome :initarg :nome :initform (error "Must supply a customer name."))))



(defun quadrado(x)
  (* x x))


(defun maior(x y)
  (if (> x y) x y))


(defun maior3(x y z)
  (if (> x y)
    (if (> x z) x z)
    (if (> y z) y z)))


(defun maiorCond(x y)
  (cond ((> x y) x)
       (y)))



(defun maiorCond3(x y z)
  (cond
        ((and (>= x y) (>= x z)) x)
        ((and (>= y x) (>= y z)) y)
        ((and (>= z x) (>= z y)) z)))


(defun maiorCond3(x y z)
  (let ((valor (cond
                 ((and (>= x y) (>= x z)) x)
                 ((and (>= y x) (>= y z)) y)
                 ((and (>= z x) (>= z y)) z)))) (+ valor 5)))


(defun fatorial (x)
  (if (= x 0) 1
              (* x (fatorial(- x 1)))))


(defun somaRecursao(x limite)
  (if (= x limite) x
                  (+ (somaRecursao 1 x) x)))



(defun instrucao (s)
  (progn
        (print s)
        (print (+ s 5))
        (print (* s 5))))


(defun bloco()
  (progn
    (print "informe um valor: ")
    (let* ((valor (read)))
      (print "valor é ")
      (print (* valor 5)))))


(defun lacoTimes(s)
  (dotimes (var s)
    (print (+ var 1))))

(defun lacoList(lista)
  (dolist (elemento lista)
    (progn
      (print elemento)
      (if (equal elemento 'Rodolfo)
          (setf list (cons elemento list)) (print "não dicionei o elemento")))))



(defstruct pessoa
    (nome)
    (idade))


(defun simpleLambda(y)
  ((lambda (x) (* x x x)) y))


(defun listaLambda(lista)
  (mapcar #'(lambda (x) (* x x x)) lista))





  
