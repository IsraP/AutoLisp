(princ "\nParedes - Por: Fredy Godinho - Visite www.aditivocad.com ")

;|ROTINA PARA DESENHAR DESENHAR PAREDES
   Por Fredy Godinho. 
   Este programa é de uso livre, pode ser modificado use a vontade, 
   mas não abuse, seja gente fina, mantenha o cabeçalho com os créditos originais !
   e caso faça alguma alteração, poderá enviar para contato@aditivocad.com
      Obrigado !

   Wall ROUTINE
   By Fredy Godinho. - Brazil
   This routine is FREE and can be changed, use but do not abuse, please keep this information !
   if you change it, send to contato@aditivocad.com
   tanks !
|;


(defun c:parx (/ #cont #dist pt1 pt2 #agl1 #ln1 #ln2 #ln2b #ln2a)
  (setvar "cmdecho" 0)
  (setq #cont 0)
  (if (not #esp)
    (setq #esp 0.15)
    )
  (setq #espa (getdist (strcat "\nEspessura <" (rtos #esp) ">: ")))
  (if #espa
    (setq #esp #espa)
    )
  (setq #dist (/ #esp 2))
  (setq	pt1 (getpoint "\nInicio: ")
	pt2 (getpoint pt1 "\nPonto: ")
	)
  (while (/= pt2 nil)
    (setq #agl1 (angle pt1 pt2))
    (command ".line"
	     (polar pt1 (+ #agl1 1.5707963) #dist)
	     (polar pt2 (+ #agl1 1.5707963) #dist)
	     ""
	     )
    (if	(= #cont 0)
      (setq #ln1 (entlast))
      (progn
	(setq #ln2 #ln1
	      #ln1 (entlast)
	      )
	(arrmt #ln1 #ln2)
	)
      )
    (command ".line"
	     (polar pt1 (- #agl1 1.5707963) #dist)
	     (polar pt2 (- #agl1 1.5707963) #dist)
	     ""
	     )
    (if	(= #cont 0)
      (setq #ln2a (entlast))
      (progn
	(setq #ln2b #ln2a
	      #ln2a (entlast)
	      )
	(arrmt #ln2a #ln2b)
	)
      )
    (setq pt1	pt2
	  pt2	(getpoint pt1 "\nPonto: ")
	  #cont	(1+ #cont)
	  )
    )
  (princ)
  )
(defun arrmt (la lb)
  (setq	pt3 (inters
	      (cdr (assoc 10 (entget la)))
	      (cdr (assoc 11 (entget la)))
	      (cdr (assoc 10 (entget lb)))
	      (cdr (assoc 11 (entget lb)))
	      nil
	      )
	)
  (command ".change" la "" pt3 ".change" lb "" pt3)
  (princ)
  )

(PROMPT "\nDigite  PARX")
(PRINC)