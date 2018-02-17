;
;helper para o manuseio de data e hora
;
(defpackage #:com.folha-pgto.helpers.datahora
  (:use
      :com.folha-pgto.helpers.packages
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
(defun get-data() "retorna apenas a data no formato dia mes ano"
  (init)
  (let ((dt (format nil "~2,'0d/~2,'0d/~4,'0d"  (elt data-hora 3)
                                                (elt data-hora 4)
                                                (elt data-hora 5)))) dt))

;retorna data e hora no formato dia mes ano hora minuto segundo
(defun get-data-hora() "retorna data e hora no formato dia mes ano hora minuto segundo"
  (init)
  (let ((dthora (format nil "~2,'0d/~2,'0d/~4,'0d ~2,'0d:~2,'0d:~2,'0d" (elt data-hora 3)
                                                                        (elt data-hora 4)
                                                                        (elt data-hora 5)
                                                                        (elt data-hora 2)
                                                                        (elt data-hora 1)
                                                                        (elt data-hora 0)))) dthora))

;retorna apenas hora no formato hora minuto segundo
(defun get-hora() "retorna apenas hora no formato hora minuto segundo"
  (init)
  (let ((hr (format nil "~2,'0d:~2,'0d:~2,'0d" (elt data-hora 2)
                                               (elt data-hora 1)
                                               (elt data-hora 0)))) hr))

;retorna key no formato ano mes dia hora minuto segundo
(defun get-key() "retorna key no formato ano mes dia hora minuto segundo"
  (init)
  (let ((key (format nil "~4,'0d~2,'0d~2,'0d~2,'0d~2,'0d~2,'0d"  (elt data-hora 5)
                                                                 (elt data-hora 4)
                                                                 (elt data-hora 3)
                                                                 (elt data-hora 2)
                                                                 (elt data-hora 1)
                                                                 (elt data-hora 0)))) key))
;retorna o dia da semana
(defun get-dia-semana() "retorna o dia da semana"
  (init)
  (nth (elt data-hora 6) *dias-semana*))

;retorna o dia do mes
(defun get-dia-mes() "retorna o dia do mes"
  (init)
  (let ((dia (format nil "~2,'0d"  (elt data-hora 3)))) dia))

;retorna o mes do ano corrente
(defun get-mes() "retorna o mes do ano corrente"
  (init)
  (let ((mes (format nil "~2,'0d"  (elt data-hora 4)))) mes))

;retorna o ano
(defun get-ano() "retorna o ano"
  (init)
  (let ((ano (format nil "~2,'0d"  (elt data-hora 5)))) ano))

;verifica se a data informada é valida
(defun is-date(data) "verifica se a data informada é valida"
  (let* ((dia (subseq data 0 2))
         (mes (subseq data 3 5))
         (ano (subseq data 6 10)))
    (valide-date (parse-integer dia)
                 (parse-integer mes)
                 (parse-integer ano))))

;aplica regra de validação para data
(defun valide-date (dia mes ano) "aplica regra de validação para data"
   (if (and
            (eq (is-mes-valido mes) 't)
            (eq (is-dia-valido dia mes ano) 't)
            (eq (is-ano-valido ano) 't)) t))

;verifica se é um dia valido
(defun is-dia-valido(dia mes ano) "verifica se é um dia valido"
  (if (and (> dia 0) (<= dia (get-ultimo-dia-mes mes ano))) t))

;verifica se o mes e valido
(defun is-mes-valido(mes) "verifica se o mes e valido"
  (if (and (> mes 1) (<= mes 12)) t))

;verifica se o ano é valido
(defun is-ano-valido(ano) "verifica se o ano é valido"
  (if (>= ano *ano-minimo*) t))

;retorna o ultimo dia do mes e ano informados
(defun get-ultimo-dia-mes(mes ano) "retorna o ultimo dia do mes e ano informados"
  (if (= mes *mes-fevereiro*)
    (if (= (mod ano 4) 0)
      (let ((dia *ultimo-dia-fevereiro-bisexto*)) dia)
      (let ((dia (nth mes *ultimo-dia-mes*))) dia))
    (let ((dia (nth mes *ultimo-dia-mes*))) dia)))
