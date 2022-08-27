#trovare il minimo dei 2


.data


.text
.globl main

main:
	add $s0,$0,5  # variabile x
	add $s1,$0,4 #variabile y
	slt $t0 , $s0 , $s1 # se x < y allora $t0 = 1
	beq $t0,$0,else 
	add $t1, $0 , $s0 # in t1 scrivo il valore x
	j operation
	
	
else: 	add $t1,$0,$s1 # in t1 scrivo il valore y


operation:  
	addi $s0 , $s0 , 1
	sub $s2 , $s0 , $t1
	
	li $v0 , 1
	move $a0, $s2
	syscall