#convenzioni di chiamata 
 
#importantissimo

#ognifunzione restituisce valori $v0 e $v1
#ogni funzione accetta valori $a0,$a1,$a2,$a3
#in questo esempio si e volutamente usato i regiri $s per far vedere la convenzione se no in altri 
#contesti si sarebbero usati i registri provvisori

.data 

avviso: .asciiz "\nI valori di default che sono stati modificati e poi ripristinati sono:  "
space: .asciiz " | "

.text
.globl main

main:  
	#inizializzo delle variabili 
	addi $s0, $0, 1
	addi $s1, $0, 2
	addi $s2, $0, 3
	addi $a0, $0, 4
	addi $a1, $0, 5
	addi $a2, $0, 6
	addi $a3, $0, 7
	jal funzione1 
	move $s4,$v0 # ritorno nella main 
	
# stampa valori 
	li $v0 , 1
	move $a0 , $s4
	syscall
	
	
	li $v0 , 4
	la $a0 , avviso
	syscall
	
	li $v0 , 1
	move $a0 , $s0
	syscall
	
	li $v0 , 4
	la $a0 , space
	syscall
	
	
	li $v0 , 1
	move $a0 , $s1
	syscall
	
	li $v0 , 10
	syscall
	


funzione2:
	add $s3 , $a0, $a3
	add $v0,$0,$s3
	jr $ra # torno dentro la funzione 1

	

funzione1:
	addi $sp, $sp , -16 #mi prendo lo spazio nello stak
	#salvataggio variabili nello stack
	sw $ra ,  12($sp) # alloco il registro di ritorno  	
	sw $s2 , 8($sp) # alloco la ariabile s0 dell funzione chimante
	sw $s1, 4($sp) # alloco la variabile s1 della funzione chiamante 
	sw $s0 , 0($sp) # alloco la variabile s1 della funzione chiamante 
	
	add $s1, $a0 , $a1 # faccio le operazioni della funzione 1 vedere che sto modificando i registri della chimante 
	sub $s2, $s1,$a2 # elaborazione dei valori riscrivendo le variabili della fuznione chiamante 
	add $a0 , $0 , $s2 # riscritto il registro a0 che ho usato con il valore $s2
	
	jal funzione2 # salto in un altra funzione adesso pero mi cambiera il valore del $ra perche faccio un altra jal
	
	sub $v0,$v0,$s2
	#adesso ripristino tutte le variabili del chiamante 
	lw $s0 , 0($sp)
	lw $s1 , 4($sp)
	lw $s2 , 8($sp)
	lw $ra , 12($sp)
	addi $sp,$sp,16 #dealloco lo spazio ridandolo allo stack
	jr $ra






	
