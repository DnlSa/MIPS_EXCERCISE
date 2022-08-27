


ric: 
addi $sp , $sp , -8
sw $ra , 0($sp)
sw $s0 , 4($sp)

add $s0 , $0 , $a0 # s0 <- n
add $t1 , $0 , 3 

slt $t0 , $t1 , $a0 # if(3 < a0)
bne $t0 , $0 , else_1

beq $t0 , $t1 , else_2 # if (n == 3)

add $a0 , $a0 , -2  # n-2
jal ric # f(n-2)

add $v0 , $s0 , $v0 # f(n-2)+n 
addi $v0 , $v0 , 1 # f(n-2)+n-1

lw $s0, 4($sp)
lw $ra , 0($sp)
addi $sp , $sp , 8


else_1 : 
	add $v0 , $0 , 0
	jr $ra
	
else_2 : add $v0 , $0 , 1
	jr $ra