;
;helper para o manuseio de data e hora
;
(defpackage #:com.folha-pgto.helpers.constantes
  (:use
      :cl)
  (:export
      :*dias-semana*
      :*situacao-colaborador*))

(in-package #:com.folha-pgto.helpers.constantes)

; constante para dias da semana
(defvar *dias-semana* '("Segunda-feira" "Terça-feira" "Quarta-feira" "Quinta-feira" "Sexta-feira" "Sábado" "Domindo"))


; define contantentes e variaveis globais
(defvar *situacao-colaborador* '("Ativo" "Desligado" "Afastado"))
