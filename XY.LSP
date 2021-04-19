(defun c:XY ()
  (setvar "cmdecho" 0) ; Impede os comandos de aparecerem na tela
  (setvar "osmode" 1) ; pega pontos a partir de seus endpoints
  (setq P1 (getpoint "\nClique no ponto desejado: ")) ; Seleciona o ponto do autocad
  (command "id" p1) ; Executa o comando id do autocad, que mostra o x y e z de algo, nesse caso, o ponto
  (setvar "osmode" 0) ; nao pega nenhum ponto de algum jeito
  (setvar "luprec" 2) ; muda a precisão das coordenadas para 2 (default 4)
  (command "text" pause "1.0" pause p1) ; mostra na tela as coordenadas do ponto p1
  (setvar "cmdecho" 1) ; Permite que os comandos aparecam na tela
  (princ) ; ... printa na tela?
)
