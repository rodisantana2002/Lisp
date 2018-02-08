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
      :is-date)
  (:nicknames :datahora))

(in-package #:com.folha-pgto.helpers.datahora)

(defvar data-hora nil)

(defun init()
  (multiple-value-bind
    (second minute hour date month year day-of-week)
    (get-decoded-time)
    (setf data-hora (vector second minute hour date month year day-of-week))))

;retorna apenas a data no formato dia mes ano
(defun get-data()
  (init)
  (let ((dt (format nil "~2,'0d/~2,'0d/~4,'0d"  (elt data-hora 3)
                                                (elt data-hora 4)
                                                (elt data-hora 5)))) dt))

;retorna data e hora no formato dia mes ano hora minuto segundo
(defun get-data-hora()
  (init)
  (let ((dthora (format nil "~2,'0d/~2,'0d/~4,'0d ~2,'0d:~2,'0d:~2,'0d" (elt data-hora 3)
                                                                        (elt data-hora 4)
                                                                        (elt data-hora 5)
                                                                        (elt data-hora 2)
                                                                        (elt data-hora 1)
                                                                        (elt data-hora 0)))) dthora))

;retorna apenas hora no formato hora minuto segundo
(defun get-hora()
  (init)
  (let ((hr (format nil "~2,'0d:~2,'0d:~2,'0d" (elt data-hora 2)
                                               (elt data-hora 1)
                                               (elt data-hora 0)))) hr))

;retorna key no formato ano mes dia hora minuto segundo
(defun get-key()
  (init)
  (let ((key (format nil "~4,'0d~2,'0d~2,'0d~2,'0d~2,'0d~2,'0d"  (elt data-hora 5)
                                                                 (elt data-hora 4)
                                                                 (elt data-hora 3)
                                                                 (elt data-hora 2)
                                                                 (elt data-hora 1)
                                                                 (elt data-hora 0)))) key))
;retorna o dia da semana
(defun get-dia-semana()
  (init)
  (nth (elt data-hora 6) *dias-semana*))

;retorna o dia do mes
(defun get-dia-mes()
  (init)
  (let ((dia (format nil "~2,'0d"  (elt data-hora 3)))) dia))

;retorna o mes do ano corrente
(defun get-mes()
  (init)
  (let ((mes (format nil "~2,'0d"  (elt data-hora 4)))) mes))

;retorna o ano
(defun get-ano()
  (init)
  (let ((ano (format nil "~2,'0d"  (elt data-hora 5)))) ano))

(defun is-date(data)
  (let* ((dia (subseq data 0 2))
         (mes (subseq data 3 5))
         (ano (subseq data 6 10)))
    (valide-date (parse-integer dia)
                 (parse-integer mes)
                 (parse-integer ano))))

(defun valide-date (dia mes ano)
   (if (and
            (eq (is-mes-valido mes) 't)
            (eq (is-dia-valido dia mes ano) 't)
            (eq (is-ano-valido ano) 't)) t))

(defun is-dia-valido(dia mes ano)
  (if (and (> dia 0) (<= dia (get-ultimo-dia-mes mes ano))) t))

(defun is-mes-valido(mes)
  (if (and (> mes 1) (<= mes 12)) t))

(defun is-ano-valido(ano)
  (if (>= ano *ano-minimo*) t))

(defun get-ultimo-dia-mes(mes ano)
  (if (= mes *mes-fevereiro*)
    (if (= (mod ano 4) 0)
      (let ((dia *ultimo-dia-fevereiro-bisexto*)) dia)
      (let ((dia (nth mes *ultimo-dia-mes*))) dia))
    (let ((dia (nth mes *ultimo-dia-mes*))) dia)))
