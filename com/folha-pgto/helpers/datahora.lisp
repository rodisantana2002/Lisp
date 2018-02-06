;
;helper para o manuseio de data e hora
;
(defpackage #:com.folha-pgto.helpers.datahora
  (:use
      :com.folha-pgto.helpers.constantes
      :cl)
  (:export
      :get-data
      :get-data-hora
      :get-hora
      :get-dia-semana
      :get-dia-mes
      :get-mes
      :get-ano
      :get-key
      :ishora
      :isdate))

(in-package #:com.folha-pgto.helpers.datahora)

(defun init()
  (multiple-value-bind
           (second minute hour date month year day-of-week dst-p tz)
           (get-decoded-time)
           (vector second minute hour date month year day-of-week)))

;retorna apenas a data no formato dia mes ano
(defun get-data()
  (setf data-hora (init))
  (let ((dt (format nil "~2,'0d/~2,'0d/~4,'0d"  (elt data-hora 3)
                                    (elt data-hora 4)
                                    (elt data-hora 5)))) dt))

;retorna data e hora no formato dia mes ano hora minuto segundo
(defun get-data-hora()
  (setf data-hora (init))
  (let ((dthora (format nil "~2,'0d/~2,'0d/~4,'0d ~2,'0d:~2,'0d:~2,'0d" (elt data-hora 3)
                                                        (elt data-hora 4)
                                                        (elt data-hora 5)
                                                        (elt data-hora 2)
                                                        (elt data-hora 1)
                                                        (elt data-hora 0)))) dthora))

;retorna apenas hora no formato hora minuto segundo
(defun get-hora()
  (setf data-hora (init))
  (let ((hr (format nil "~2,'0d:~2,'0d:~2,'0d" (elt data-hora 2)
                                   (elt data-hora 1)
                                   (elt data-hora 0)))) hr))

;retorna key no formato ano mes dia hora minuto segundo
(defun get-key()
  (setf data-hora (init))
  (let ((key (format nil "~4,'0d~2,'0d~2,'0d~2,'0d~2,'0d~2,'0d"  (elt data-hora 5)
                                                    (elt data-hora 4)
                                                    (elt data-hora 3)
                                                    (elt data-hora 2)
                                                    (elt data-hora 1)
                                                    (elt data-hora 0)))) key))
;retorna o dia da semana
(defun get-dia-semana()
  (setf data-hora (init))
  (nth (elt data-hora 6) *dias-semana*))

;retorna o dia do mes
(defun get-dia-mes()
  (setf data-hora (init))
  (let ((dia (format nil "~2,'0d"  (elt data-hora 3)))) dia))

;retorna o mes do ano corrente
(defun get-mes()
  (setf data-hora (init))
  (let ((mes (format nil "~2,'0d"  (elt data-hora 4)))) mes))

;retorna o ano
(defun get-ano()
  (setf data-hora (init))
  (let ((ano (format nil "~2,'0d"  (elt data-hora 5)))) ano))

(defun isdate())

(defun ishora())
