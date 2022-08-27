.data

a : .word 4
b : .word 10

.text
.globl main

main: 
	add $s0 , $0 , 4  # a
	add $s1 , $0 , 90 # b
	
loop:
	beq $s1 , $0 , exit
	slt $t0 ,  $s0 , $s1 # 1 se a<b
	beq $t0 , $0 , else
	
	add $t0 , $0 , $s0 # temp = a ; 
	add $s0 , $0 , $s1 # s0=s1
	add $s1 , $0 , $t0 # s1 = temp
	
	j loop
	
		
				
else:	div $s0 ,$s1  # a modulo b
	mfhi $t1  # resto 
	add $s0 , $0, $s1
	add $s1 , $0 , $t1
	j loop

exit: 
	add $a0 , $0, $s0
	li $v0 , 1
	syscall
	li $v0 , 10
	syscall