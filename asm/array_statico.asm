	
.data
	
arr:	.word 11, 8, 3, 22, 59, 6, 16, 0, 3, 2
space: 	.asciiz " " # inserisco ascii z perche finisce con un \0 
end:	.asciiz "\nfine dell array" 


.text
#metodo 2 per stampare array
	#la $t0 , arr
	#lw $t1 , 4($t0)

#medoto 1 per prendere valore arrai lo spiazzamento e interno alle parentesi il puntatore e esterno  
	
	#li $t0 , 4 #passo una costante nel regiatro $t0 che sara usato come spiazzamento 
	#lw $t1, arr($t0) # $t0 e l offset specificato tramite li 
#per creare un for che mi stampi tutti i valori devo poter incrementnare ogni volta lo spiazzamento 

	move $s0 , $0 # inizializzazione delle variabili 1  
	addi $s1 , $s1 ,  10 # variabile 2
	move $t0 , $0 # inizializzo il registro $t0 = 0 questo e lo spiazzamento   
	
	
	
for : slt $t2 , $s0 , $s1  # introduzione ciclo for
      beq $t2 , $0 , exit # confronto
      
	lw $t1, arr($t0) # $t0 e l offset specificato tramite li 
	# IN EFFETTI CARICA IN MEMORIA L INTERO DEL PUNTATORE 
	
	addi $t0 ,$t0, 4  #incrementatore dello spiazzmemento
	add $s0 , $s0 , 1   # incrementatore del for 
	
	li $v0, 1 	#stampa l intero
	move $a0 , $t1 
	syscall
# li $v0 , numero serve per caricare il tipo di istruzione che deve eseguira la chimata a sistema 
	li $v0 , 4 # stampa lo spazio fra 2 numeri  
	la $a0 , space
	syscall
	
	j for # salto al for 
	
exit:
	li $v0 , 4  # messaggio di uscita 
	la $a0 , end
	syscall
	
	li $v0,10 # uscita NON NECESSARIA MA UTILE PERCHE FA DA BREAK
	syscall
	
	
	
	
