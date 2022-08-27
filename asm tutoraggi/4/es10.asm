# scambiare le diagonali devo 
# 1) 



.data

matrix: .word 2 3 0  1 5 4  0 2 3 
n: .word 3


.text
.globl main

main:	la $a0 , matrix # a0 = &matrix 
	lw $a1 , n # a1 = n;
	add $s0 , $a0 , $0
	add $s2 , $a1 , $0
	jal switchDiag # void switchDiag (int *a0 , in n) # ne passo un puntatore alla matrixe 
 	add $s0 , $a0 , $0
 	mult $s2 , $s2 
 	mflo $s2
 	
 while1: 
 	beq $s2 , $0 , end
 	lw $a0 , 0($s0)
 	li $v0 , 1
 	syscall
 	
 	add $s0 , $s0 , 4
 	add $s2 , $s2 , -1
	
	j while1
	
end: 
	li $v0 , 10
	syscall

switchDiag : 
	
	add $sp , $sp , -24 #push valori in stack
	sw $ra , 0($sp)
	sw $s0 , 4($sp)
	sw $s1 , 8($sp)
	sw $s2 , 12($sp)
	sw $s3 , 16($sp)
	sw $s4 , 20($sp)
	
	add $s0 , $a1 , -1 # int n=2
	add $s1 , $0 , $a0 # int s1 = &matrix  
	add $s2 , $0 , $0  # int q = 0 
	add $s3 , $s0 , 1  # int count = n  
	add $s4 , $0 , $a1 # int k = n
	
while: 	beq $s3 , $0 , exit # while(count>0)
	add $s3 , $s3 , -1 # count--;

	#calcolo spiazzamento 
	add $t2 , $0 , 4 # t2 = 4  taglia dell intero 
	
	#calcolo primo elemento 
	mult $s2 , $t2   # q =  q*4
	mflo $t1  # spiazzamento calcolato 
	add $t3 , $t1 , $s1 
	lw $t5 , 0($t3) # a1 = matrix[0+q]
	
	#calcolo ultimo elemento
	mult $s0 , $t2   # n =  n*4
	mflo $t1  # spiazzamento calcolato 
	add $t4 , $t1 , $s1  # matrix[0+n]
	lw $t6 , 0($t4) # a1 = matrix[n]
	
	#swap
	sw $t6 , 0($t3)
	sw $t5 , 0($t4) 

	#calcolo seconda riga 	
	mult $s4 , $t2   # k =  k*4
	mflo $t1  # spiazzamento calcolato 
	add $s1 , $s1 , $t1 # riga cambiata

	#decremento un po di robe 
	add $s0 , $s0 , -1 # n--
	add $s2 , $s2 , 1 # q++
	j while

		
exit : 
	lw $ra , 0($sp)
	lw $s0 , 4($sp)
	lw $s1 , 8($sp)
	lw $s2 , 12($sp)
	lw $s3 , 16($sp)
	lw $s4 , 20($sp)
	add $sp , $sp , 24 #pop  valori dallo stack
	jr $ra
	
	