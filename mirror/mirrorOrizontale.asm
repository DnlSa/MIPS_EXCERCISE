.data 
matrix : .word 1 2 3  4 5 6  7 8 9
dim : .word 3
.text
.globl main

main:
  	la $a0 , matrix # a0 = &matrix
  	la $a1 , dim # $a1 = &dim 
  	lw $a1 , 0($a1) # $a1 = 3
  	add $a2 , $a1 , 0 # a2 = a1 = count
  	jal mirror	
        li $v0 , 10
	syscall
  
mirror : 
	addi $sp , $sp , -20 # push valori nello stack 
 	sw $ra , 0($sp)
	sw $s0 , 4($sp)
	sw $s1 , 8($sp)
	sw $s2 , 12($sp)
	sw $s3 , 16($sp)
	beq $a2 , $0 , end #  while (s2 != 0 )
	add $s0 , $0 , $a0 # s0 = &matrix
	add $s1 , $0 , $a1  # s1 = dim
	add $s2 , $s1 , -1 # serve per puntare 
	add $s3 , $s1 , -1 # serve per il for
	sll $s2 , $s2 , 2 #  s2 = 4 * (dim-1) punta ultimo valore della riga   
	add $s2 , $s0 , $s2  # s2 = s2+ &matrix
	add $t2 , $0 , 1 # se arrivo a 1 dovro swappare lo stesso valore ed e a dir poco inutile 
	
for: 	
	beq $s3 , $t2 , else  # for (s3 != 0). . .. .. 	
	lw $t0 , 0($s0)  # t0 = matrix[0]
	lw $t1 , 0($s2)  # t1 = matrix[2]
	sw $t1 , 0($s0)  # matrix[0] = t1 
	sw $t0 , 0($s2) # matrix[2] = t2
	add $s3,  $s3 , -1 # s1-- 
	add $s2 ,  $s2 , -4 # s2 = &s2 - 4 byte
	add $s0 , $s0 , 4 # s0 = $s0 + 4 byte
	j for
	
else: 	
	sll $t3 , $a1 , 2 # $t3 = dim*4
	add $a0 , $t3 , $a0 # $a0 = $a0+ $t3
	add $a2 , $a2 , -1 # $a2--
	jal mirror # matrix(matrix , dim , count)
 	lw $ra , 0($sp) # pop dei valori nello stack
	lw $s0 , 4($sp)
	lw $s1 , 8($sp)
	lw $s2 , 12($sp)
	lw $s3 , 16($sp)
	addi $sp , $sp , 20
	jr $ra
	
end: 	jr $ra