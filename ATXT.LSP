; FROM THE DESK OF PAUL STANDING
; AREA TEXT COMBINED () ATXT.LSP V.1.0
; Nov 9th, 1994

(defun C:atxt (/ e th val unit fmt pt )
  (setvar "cmdecho" 0) ; Impede os comandos de aparecerem na tela para mostrar tudo de uma vez no final
  (setq e (entsel "\nPlease select an entity...")) ; Pede para selecionar uma entidade e salva em e
  (command "area" "e" e)(setq th (* 0.18 (getvar "dimscale"))) ; chama o comando area e salva uma escala diminuida na variavel th
  (setq VAL (getvar "area" )) ; pega o valor da ultima area selecionada
  (setq unit (getvar "lunits")) ; pega o formato das unidades lineares para a criação de objetos
  (setq txt_style (getvar "textstyle")) ; pega o valor do estilo de texto do usuario
  (command "style" "standard" "" "" "" "" "" "" "") ; seta o estilo de texto como standard  
  (setq fmt (rtos val)) ; Fmt receberá o valor da area em string para ser mostrado depois
  (setq PT (getvar "viewctr")) ; salva o valor do centro da visao da tela (basicamente onde o usuário está olhando)
  (command "text" PT TH "0" Fmt) ; executa um comando text para mostrar o resultado da area, pt = eixo X, th = eixo y, 0 de rotaçao e o texto (fmt)
  (princ " Place Text") ; mostra no console que o texto foi posicionado
  (command "move" "SI" "L" PT pause) ; move o texto para onde o cursor selecionar
  (setvar "textstyle" txt_style) ; Coloca o valor de txt do usuario como o valor a ser mostrado na tela
  (setvar "cmdecho" 1) ; permite os comandos de aparecerem na tela
  (princ)
); ends atxt.lsp
(prompt "\nType ATXT to envoke the command")

   

