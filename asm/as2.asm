# Scrivere il codice assembly che, dato un array di interi V e la sua dimensione, verifichi se V e’
#ordinato in maniera decrescente.

.data 

array: .word 10 9 8 7 6 5 4 3 2  1 0
true: .asciiz "l array e ordinato"
false: .asciiz "l array NON e ordinato"

.text 
.globl main
	
main:
	addi $t2 , $t2 , 4 # registro $t2 impostato a costante 4
loop:
	lw $s1, array($t0) # do al registro s1 il primo valore dell array 
	lw $s2, array($t2) # do al registro s2 il secondo valore dell array 
	slt $t1 , $s2,$s1  # verifica se s2 e minore di s1
	beq $t1 , $0 , exit # se non lo sono signific che non sono ordinati e va in exit 
	add $t0 , $t0,4 # somma +4 allo spiazzamento dell array 
	add $t2 , $t2,4 # stessa cosa di su 
	beq $s2 , 0 , exit1 # quando s2 sara 1 cioe sara arrivato alla fine del mio array allora va in exit1
	j loop # semplice salto incondizionato 
	
exit:	li $v0 ,4 # condizione di false 
	la $a0 , false
	syscall 
	li $v0 ,10 # uscita
	syscall 
	
exit1:
	li $v0 ,4 # condizione di true 
	la $a0 , true
	syscall
	li $v0 ,10 # uscita 
	syscall 
	
	
