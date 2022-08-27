.data

n: .word 6

.text
.globl main

main:
	lw $a0, n # $a0 = n
	add $a1, $0 , $a0
	 #define integer for work my software
	add $s0 , $0 , 1 # int s0 = 1
	add $s1 , $0 , 2 # int s1 = 2
	add $s2 , $0 , 4 # int s2 = 4
	add $s3 , $0 , 3 # int s3 = 3
	jal verify # verifica se n <=2 mi risparmia un po di istruzioni 
	beq $v0 , $s0 , exit  # if(v0 == 1) -> exit

	div $a0 , $s1
	mflo $a1
	jal verify
	mult $v0 , $s3
	mflo $s4 # result 3 T[N/2]
	
	div $a0 , $s2
	mflo $a1
	jal verify
	mult $v0 , $s1
	mflo $s5 # result 3 T[N/4]
	
	add $a0 , $s4 , $s5
	li $v0 ,1
	syscall 
	j exit
	

verify: 

	add $t0 , $0 , 2 # c = 3
	slt $t1 , $t0 , $a1 #  1 se c <= n 
	beq $t1 , $0 , else # t0 = 0 -> exit
	
	add $v0 , $0 , $a1  
	jr $ra # return n

else: 
	add $v0 , $0 , 1 # v0 
	jr $ra # return  1
	
exit:
 	li $v0 , 10
 	syscall	