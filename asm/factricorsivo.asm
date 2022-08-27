.data 

n : .word 8

.text
.globl main

main:
	lw $a0 , n  # a0 = 5
	jal fact
	
	add $a0 , $v0 , $0
	li $v0 ,1 
	syscall 
	li $v0 , 10 
	syscall
	
fact:
	add $sp , $sp , -8
	sw $ra , 0($sp)
	sw $s0 , 4($sp)
	
	add $s0 , $0 , $a0 # s0 = a0
	add $a1 , $a1 , $0  # serve per impostare v0 a 1
	beq $a1 , $0 , if # if(a1 == 0 ) -> else
	
	slti $t0 , $s0 , 1 # if(s0 <= 1) -> goto exit  
	bne $t0 , $0 , exit  
	
	mult $v0 , $a0 #  v0 =  n*v0 
	mflo $v0 # result
	add $a0 , $a0 , -1 # n--
	
	jal fact 
	lw $ra , 0($sp)
	lw $s0 , 4($sp)
	add $sp , $sp , 8
	jr $ra
	
if: 
	add $a1 , $a1 , 1
	add $v0 , $0 , 1
	jal fact
	
exit:  # nell ultima pop dei valori torna qui booh
	lw $ra , 0($sp)
	lw $s0 , 4($sp)
	add $sp , $sp , 8
	jr $ra
	
	
	