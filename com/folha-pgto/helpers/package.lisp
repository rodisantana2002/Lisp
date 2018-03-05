;
;definicao do pacore - helpers
(defpackage #:com.folha-pgto.helpers
  (:use
      :cl
      :cl-store)
  (:export
      ;exportação constantes
      :*dias-semana*
      :*situacao-colaborador*
      :*sexo*
      :*ultimo-dia-mes*
      :*ultimo-dia-fevereiro-bisexto*
      :*mes-fevereiro*
      :*ano-minimo*
      :*linha*

      ;exportacao datahora
      :get-data
      :get-data-hora
      :get-hora
      :get-dia-semana
      :get-dia-mes
      :get-mes
      :get-ano
      :get-key
      :is-date

      ;exportacao documentação de pacotes
      :doc-pkg

      ;tratamento de grafos
      ;:gerar-grafo
      ;:caminho-menor-custo

      ;serialização
      :write-objeto
      :read-objeto)

  (:nicknames :helpers))
