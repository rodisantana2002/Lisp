;
;helper para o manuseio de data e hora
;
(defpackage :com.folha-pgto.helpers.constantes
  (:use
      :cl)
  (:export
      :*dias-semana*
      :*situacao-colaborador*
      :*sexo*
      :*ultimo-dia-mes*
      :*ultimo-dia-fevereiro-bisexto*
      :*mes-fevereiro*
      :*ano-minimo*))

(in-package :com.folha-pgto.helpers.constantes)

; constante para datas/dias
(defparameter *dias-semana* '("Segunda-feira" "Terça-feira" "Quarta-feira" "Quinta-feira" "Sexta-feira" "Sábado" "Domindo"))
(defparameter *ultimo-dia-mes* '(0 31 28 31 30 31 30 31 31 30 31 30 31))
(defparameter *ultimo-dia-fevereiro-bisexto* 29)
(defparameter *mes-fevereiro* 2)
(defparameter *ano-minimo* 1900)

; define contantentes e variaveis globais
(defparameter *situacao-colaborador* '("Ativo" "Desligado" "Afastado"))
(defparameter *sexo* '("Masculino" "Feminino"))
