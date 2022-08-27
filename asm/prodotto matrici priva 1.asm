# va tutto bene solamente ho barato alla fine per uscire dal ciclo ho adottato un registro $s7
# come se persistesse alla chiamata  



.data 

mat1 : .word 2 3  1 5

mat2 : .word 3 2  0 4

N : .word 2

.text
.globl main


main: 
	la $a0 , mat1 # a0 <- mat1
	la $a1 , mat2 # $a1 <- mat2
	lw $a2 , N   # $a2 <- N
	la $s0 , N
	add $a3 , $s0 , 4 # nel segmento data e il primo spazio di memoria libero 
	addi $sp , $sp , -4
	sw $ra , 0($sp)
	jal matrix # int *matrix(mat1 , mat2, N)
	
	add $s3 , $s0 , 4 # indirizzo di memoria della matrice 	
	li $v0 ,10
	syscall
 	 lw $ra , 0($sp)    # return 0 
 	 addi $sp , $sp , 4
 	 jr $ra
 	 
 	 
 	 
 matrix: beq $s7 , $a2 , fine 
 	addi $sp , $sp , -28
	sw $ra , 0($sp)
	sw $s0 , 4($sp)
	sw $s1 , 8($sp)
	sw $s2 , 12($sp)
	sw $s3 , 16($sp)
	sw $a3 , 20($sp)
	sw $s7 , 24($sp)
	 
	add $t0 , $0 , $0 # t0 <- 0
	add $t5 , $0 , $a2 # t5 <- N
	add $t6 , $0 , $a2 # t6 <- N <- count = 2
	add $t7 , $a2 , 1 # t7 <= 4
	
loop:  	beq $t0 , $0 , else # while(h != 0)
	lw $t1 , 0($s0) # $t1 <- mat1[i][j]
	lw $t2 , 0($s1) # $t2 <- mat2[i][j]
	mult $t1 , $t2  
	mflo $t1 # t1 <- t1*t2
	
	add $s3, $s3 , $t1 # $s3 <- s3+(t1*t2)
	add $s0 , $s0 , 4 # mat1[i][j+1]
	add $t4 , $0 , 4 #  t4 <- 4 byte (int dimension)
	mult $t5 , $t4  
	mflo $t3         # t3 <- N*4
	add $s1 , $s1 , $t3  # mat2[i+1][j]
	add $t0 , $t0 , -1 # h--
	add $t6 , $t6 , -1 # count--
	
	j loop
	
else: 	
	
	beq $t6 , $0 , write  #if( t6 != 0)
	
	add $s0 , $0 , $a0 # s0 <- a0 <- mat1
	add $s1 , $0 , $a1 # s1 <- a1 <- mat2
	add $t0 , $0 , $a2 # t0 <- N
	add $s3 , $0 , $0 # s3 <- 0
	add $t7 , $t7 , -1 # count--
	beq $t7 , $0 , exit 
	j loop	
	
write: 
	sw $s3 , 0($a3)
	add $a3 , $a3 , 4 # a3 <- nuova area di memoria vuota
	add $a1 , $a1 , 4 # mat2[i][j+1]
	add $t6 , $0 , $a2 # t6 <- N
	j else
	
	
	
exit: 	
	add $t4 , $0 , 4 #  t4 <- 4 byte (int dimension)
	mult $t5 , $t4   #  
	mflo $t3         # t3 <- N*4
	add $a0 , $a0 , $t3  # mat1[i+1][j]
	sub $a1 , $a1 , $t3 # mat2[i][j+1]
	add $s7 , $s7 , 1 # ultimo decremento violo la chimata a funzione 
	
	jal matrix
	
	lw $ra , 0($sp)
	lw $s0 , 4($sp)
	lw $s1 , 8($sp)
	lw $s2 , 12($sp)
	lw $s3 , 16($sp)
	lw $a3 , 20($sp)
	lw $s7 , 24($sp)
	addi $sp , $sp , 28
	jr $ra
	 
	
fine: jr $ra	
	
	
	
	
	
	
	#add $t4 , $0 , 4 #  t4 <- 4 byte (int dimension)
	#mult $t5 , $t4   #  
	#mflo $t3         # t3 <- N*4
	#add $a0 , $a0 , $t3  # mat1[i+1][j]
	
	
	
	