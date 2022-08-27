
# programma che verifica se l array e decrescente 

# 1 se ordinato 0 altrimenti 

.data

ARR : .word   9 8 7 6 5 4 3 2 1
dim : .word  9

.text
.globl main

main: 
	la $a0 , ARR
	la $a1 , dim
	jal ordinamento
	add $a0 , $v0 , $0
	li $v0 , 1
	syscall
	li $v0 , 10
	syscall
	
	
ordinamento: 
		add $s0 ,$0, $a0,  # salvo registri in s0 e s1
		lw $s1 ,  0($a1)
		add $s1 , $s1 ,  -1 # deve partire da 8 
	
loop: 		lw $t4 , 0($s0) # carico il primo elemento dell array 
		lw $t5 , 4($s0) # carico il secondo elemento dell array

		slt $t6 , $t5 , $t4 # imposta a 1 se t5 < t4
		beq $t6 , $t0 , else 
		add $s0 , $s0 , 4 # do lo spiazzamento al registro per pescare i valori 
		add $s1 , $s1 ,  -1  # sotrai 1 alla dimensione dell array  
		beq $s1 , $0 , exit  # quando e 0 allora vai in exit
		j loop
		  
else: 
		add $v0 , $0 , $0
		jr $ra	
	
	
exit: 		add $v0, $0 , 1
		jr $ra