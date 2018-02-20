;
;pacotes para tratamento de grafos
;
(defpackage #:com.folha-pgto.helpers.grafo
  (:use
    :cl)
  (:export
    :main)
  (:nicknames :test-model))

(in-package #:com.folha-pgto.helpers.grafo)


(defun main()
  (setq resultadoDijkstra (dijkstraCompletoLK '((s u 10) (s x 5) (u v 1) (u x 2) (x u 3) (x v 9) (x y 2) (v y 4) (y v 6) (y s 7)) 's))
  (prin1 (cdr resultadoDijkstra)))

;Retira da lista Q o vértice de menor valor na lista de estimativa
(defun retiraMenorValor (Q estimativa)
  (setq verticeResultante nil)
  ;Ordenamos a lista em ordem crescente
  (setq estimativaOrdenada (sort estimativa #'(lambda (a1 a2)(< (nth 1 a1) (nth 1 a2)))))
  ;Depois procuramos até encontrar o vértice que procuramos que pertence a Q
  (dolist (vertice Q)
    (setq verticeResultante (car (assoc vertice estimativaOrdenada)))
    (when (not (eq verticeResultante nil)) (return)))

  ;Agora retiramos de Q o vértice encontrado
  (set 'Q (remove verticeResultante Q))
  (let (resultado) verticeResultante))

;Retorna lista de todos as arestas em G que partem de u
(defun retornaSaidas(u G)
  (setq arestasSaida '())
  (dolist (aresta G)
    ;Quando encontrarmos uma aresta que sai de u, adicionamos a aresta na lista
    (when (equal u (nth 0 aresta)) (push aresta arestasSaida)))
  (let (resultado) arestasSaida))

;Retorna o peso da aresta (u,v) em G
(defun retornaPesoAresta(u v G)
  (setq peso nil)
  (dolist (aresta G)
    ;Quando encontrarmos a primeira aresta (u,v) em G
    ;setamos peso com o valor do peso da aresta em G e retornamos
    (when
      (and
        (equal (nth 0 aresta) u)
        (equal (nth 1 aresta) v))
      (setq peso (nth 2 aresta)) (return)))
  (let (resultado) peso))

;Retorna lista com do caminho de menor custo de s até w baseado na lista de precedentes Lp
(defun caminhoDeMenorCusto(s w Lp)
  (setq u w) ; Vértice de destino
  (setq caminhoResultante '())
  (push u caminhoResultante) ; Colocamos o vértice inicial no final do caminho resultante
  (loop
    (when (or (equal u nil) (equal u s)) (return)) ; Fim do caminho
    (setq u (cadr (assoc u Lp))) ; Seta u para seu precedente
    (push u caminhoResultante))
  (let (resultado) caminhoResultante))

; Retorna ((Lista das estimativas) (Lista dos precedentes))
(defun dijkstraCompletoLK (G s)
  ;Primeiro geramos o grafo para que os pesos das arestas fiquem ordenados (opcional)
  (setq grafoOrdenado
    (sort G #'(lambda (a1 a2)(< (nth 2 a1) (nth 2 a2)))))

  ;Geramos a lista V com todos os vértices do grafo
  (setq V '())
  (dolist (aresta grafoOrdenado)
    ;Cada aresta (u,v) possui dois vértices, faremos o teste em todos
    ;Verifica se o primeiro vértice esta presente "u"
      (setf V (adjoin (nth 0 aresta) V :test #'equal))
      ;Verifica se o segundo vértice esta presente "v"
      (setf V (adjoin (nth 1 aresta) V :test #'equal)))

  ; Criamos uma lista de associações para guardar as estimativas
  ;de custo de cada vértice e uma de precedentes
  (setq estimativa '())
  (setq precedente '())
  (dolist (vertice V)
    ;Estimativas iniciais são infinitas
    (push (list vertice most-positive-fixnum) estimativa)
    ;Os precedentes ficam indefinidos
    (push (list vertice nil) precedente))

  (setf (cadr (assoc s estimativa)) 0) ; Setamos o valor do vértice de origem como 0
  (setq Q (copy-seq V)) ; Faremos uma cópia da lista de vértices do grafo para Q
  (setq S '()) ; S será uma lista inicialmente vazia
  ; Iniciamos o Loop
  (loop (when (eq Q nil) (return)) ; Se Q for vazio, terminamos o loop
      (setq u (retiraMenorValor Q estimativa))
      (push u S)
    (dolist (arestaSaida (retornaSaidas u grafoOrdenado))
          (when
            (<
              (+
                (retornaPesoAresta (nth 0 arestaSaida) (nth 1 arestaSaida) grafoOrdenado)
                  ;Estimativa do vértice u
                (cadr (assoc u estimativa)))
                    ;Soma o custo do caminho com a estimativa do u atual
              (cadr (assoc (nth 1 arestaSaida) estimativa))) ; Estimativa do vértice de destino v
                ;Caso a soma for menor que a estimativa do vértice destino, relaxamos o vértice (u,v)
            (setf
              (cadr (assoc (nth 1 arestaSaida) estimativa))
              (+
                (retornaPesoAresta (nth 0 arestaSaida) (nth 1 arestaSaida) grafoOrdenado)
                (cadr (assoc u estimativa))))
            (setf (cadr (assoc (nth 1 arestaSaida) precedente)) u))))
  (let (resultado) (list estimativa precedente)))
