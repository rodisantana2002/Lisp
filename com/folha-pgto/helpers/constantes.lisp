
(in-package #:com.folha-pgto.helpers)

; constante para datas/dias
(defparameter *dias-semana* '("Segunda-feira" "Terça-feira" "Quarta-feira" "Quinta-feira" "Sexta-feira" "Sábado" "Domindo"))
(defparameter *ultimo-dia-mes* '(0 31 28 31 30 31 30 31 31 30 31 30 31))
(defparameter *ultimo-dia-fevereiro-bisexto* 29)
(defparameter *mes-fevereiro* 2)
(defparameter *ano-minimo* 1900)

; define contantentes e variaveis globais
(defparameter *situacao-colaborador* '("Ativo" "Desligado" "Afastado"))
(defparameter *sexo* '("Masculino" "Feminino"))

(defparameter *linha* "+-------------------------------------------------+")

(defparameter *caminho-bd* "folha-pgto/dao/bd/")
(defparameter *extensao-arq-bd* ".dat")
