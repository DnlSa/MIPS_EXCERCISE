
#funziona solo che aumenta l iterazioni abbastanza 

.data

a : .word 4
b : .word 10

.text
.globl main

main: 
	add $a0 , $0 , 55  # a
	add $a1 , $0 , 100# b
	
	
	
	
	jal MCD
	add $a0 , $0, $v0
	li $v0 , 1
	syscall
	li $v0 , 10
	syscall
	
	
	
MCD:
	add $sp , $sp , -4
	sw $ra , 0($sp)
	
	beq $a1 , $0 , exit #condizione di uscita 
	
	slt $t0 ,  $a1 , $a0 # 1 se a<b
	beq $t0 , $0 , else
	
	div $a0 ,$a1  # a modulo b
	mfhi $t1  # resto 
	add $a0 , $0, $a1
	add $a1 , $0 , $t1
	jal MCD
	
else:	add $t0 , $0 , $a0 # temp = a ; 
	add $a0 , $0 , $a1 # s0=s1
	add $a1 , $0 , $t0 # s1 = temp
	jal MCD
	

exit:  
	add $v0 , $0 , $a0
	lw $ra , 0($sp)
	add $sp , $sp , 4
	jr $ra
	