#scrivere un programma in assembler mips che verifichi se  un array e ordinato in modo crescente  


.data

ARR : .word   1 2 3 4 5 6 7 8 9
dim : .word  9
false : .asciiz "l array non e ordinato "
true : .asciiz "l array e ordinato"


.text
.globl main


main: 
	la $a0 , ARR
	la $a1 , dim
	jal ordinamento
	add $a0 , $v0 , $0
#	li $v0 , 1
#	syscall	
	li $v0 , 10
	syscall
	
	
ordinamento: 
		add $s0 ,$0, $a0,  # salvo registri in s0 e s1
		lw $s1 ,  0($a1)
		add $s1 , $s1 ,  -1 # deve partire da 8 
	
loop: 		lw $t4 , 0($s0) # carico il primo elemento dell array 
		lw $t5 , 4($s0) # carico il secondo elemento dell array

		slt $t6 , $t4 , $t5 # imposta a 1 se t4 < t5
		beq $t6 , $t0 , else 
		add $s0 , $s0 , 4 # do lo spiazzamento al registro per pescare i valori 
		add $s1 , $s1 ,  -1  # sotrai 1 alla dimensione dell array  
		beq $s1 , $0 , exit  # quando e 0 allora vai in exit
		j loop
		  
else: 
		add $v0 , $0 , $0
		li $v0 ,4 # condizione di false 
		la $a0 , false
		syscall 
		
		jr $ra	
	
	
exit: 		add $v0, $0 , 1

		li $v0 ,4 # condizione di false 
		la $a0 , true
		syscall 
		jr $ra
