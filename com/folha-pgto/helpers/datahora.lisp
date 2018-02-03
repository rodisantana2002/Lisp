(defpackage #:com.folha-pgto.helpers.datahora
  (:use
      :cl)
  (:export
      :get-data
      :get-data-hora
      :get-hora
      :get-dia-semana
      :get-dia-mes
      :get-mes
      :get-ano
      :get-key))

(in-package #:com.folha-pgto.helpers.datahora)

(defconstant *dias-semana* '("Segunda-feira" "Terça-feira" "Quarta-feira" "Quinta-feira" "Sexta-feira" "Sábado" "Domindo"))

(defun init()
  (multiple-value-bind
           (second minute hour date month year day-of-week dst-p tz)
           (get-decoded-time)
           (vector second minute hour date month year day-of-week)))

;retorna apenas a data no formato dia mes ano
(defun get-data()
  (setf data-hora (init))
  (format t "~2,'0d/~2,'0d/~4,'0d"  (elt data-hora 3)
                                    (elt data-hora 4)
                                    (elt data-hora 5)))

;retorna data e hora no formato dia mes ano hora minuto segundo
(defun get-data-hora()
  (setf data-hora (init))
  (format t "~2,'0d/~2,'0d/~4,'0d ~2,'0d:~2,'0d:~2,'0d" (elt data-hora 3)
                                                        (elt data-hora 4)
                                                        (elt data-hora 5)
                                                        (elt data-hora 2)
                                                        (elt data-hora 1)
                                                        (elt data-hora 0)))

;retorna apenas hora no formato hora minuto segundo
(defun get-hora()
  (setf data-hora (init))
  (format t "~2,'0d:~2,'0d:~2,'0d" (elt data-hora 2)
                                   (elt data-hora 1)
                                   (elt data-hora 0)))

;retorna key no formato ano mes dia hora minuto segundo
(defun get-key()
  (setf data-hora (init))
  (format t "~4,'0d~2,'0d~2,'0d~2,'0d~2,'0d~2,'0d"  (elt data-hora 5)
                                                    (elt data-hora 4)
                                                    (elt data-hora 3)
                                                    (elt data-hora 2)
                                                    (elt data-hora 1)
                                                    (elt data-hora 0)))
;retorna o dia da semana
(defun get-dia-semana()
  (setf data-hora (init))
  (nth (elt data-hora 6) *dias-semana*))

;retorna o dia do mes
(defun get-dia-mes()
  (setf data-hora (init))
  (format t "~2,'0d"  (elt data-hora 3)))


;retorna o mes do ano corrente
(defun get-mes()
  (setf data-hora (init))
  (format t "~2,'0d"  (elt data-hora 4)))


;retorna o ano
(defun get-ano()
  (setf data-hora (init))
  (format t "~2,'0d"  (elt data-hora 5)))
