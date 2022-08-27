#rifaccio l eswercizio con un mirror verticale con procedura  foglia ricorsiva e procedura intermedia iterata
.data 
matrix : .word 1 2 3 4  4 5 6 7  7 8 9 10  11 12 13 14  15 16 17 18 19  
dim : .word 4 5
.text
.globl main

main:
  	addi $sp, $sp , -12
  	sw $ra ,  0($sp)
  	sw $a0 ,  4($sp )
  	sw $a1 ,  8($sp)
  	la $a0 , matrix # a0 = &matrix
  	la $a1 , dim # $a1 = &dim 
  	lw $a1 , 0($a1) # $a1 = 3
  	add $a2 , $0 ,$a1
  	jal mirror	# mirror(matrix,dim);
        lw $ra ,  0($sp)
  	lw $a0 ,  4($sp )
  	lw $a1 ,  8($sp)
        add $sp , $sp , 12
        # printMatrix(&matrix) posso creare una funzione di stampa della matrice a schermo 
        # jr $ra # infine il return 0 in questo sw rompe le palle qundi lo commento 
        li $v0 , 10    # return 0
	syscall
# void mirror(int *matrix, int dim);
mirror: 
	add $sp , $sp , -16
	sw $ra , 0($sp) # push valori nello stack
	sw $a0	, 4($sp)	# richaimando un altra funzione e possibile che sovrascriva i miei paramentri in input quindi devo salvarli e rispirstinare doppo che ne esce fuori 
	sw $a1  , 8($sp)
	sw $a2 , 12($sp)
	beq $a1 , $0 , end2
	add $a1 , $0 , $a2
	add $s0 , $0, $a0 # $a0  = matrix[0][0]
	add $s2 , $a1, $a1 # s2 = 3+3
	sll $s2 , $s2 , 2 # s2 =  4*6
	add $a2 , $a0 , $s2  # a2 = matrix[0][n-1];
	jal swap  # swap(&matrix , &(matrix[0][n-1] , dim)
	lw $a0	, 4($sp) # ripristino argomenti in input 
	lw $a1  , 8($sp)
	lw $a2 , 12 ($sp)
	add $a0 , $a0 , 4 #  a0 = matrix[i++][0]
	add $a1 , $a1 , -1 # a1-- 
	jal mirror
	lw $ra , 0($sp) # pop valori nello stack
	lw $a0	, 4($sp)	# richaimando un altra funzione e possibile che sovrascriva i miei paramentri in input quindi devo salvarli e rispirstinare doppo che ne esce fuori 
	lw $a1  , 8($sp)
	lw $a2 , 12($sp)
	add $sp , $sp , 16
	jr $ra

end2  : jr $ra		
			
#void swap(int *matrix[0][0], int *matrix[0][n-1] , int dim )
swap: 	addi $sp , $sp , -4
	sw $ra , 0($sp) # pop dei valori nello stack
	addi $a1 , $a1 , -1  # dim --
	add $t3 , $0 , 1 
	beq $a1 , $t3 , end1
	# posso evitare di salvare valri argomento in quanto si ricorisva ma ho il pieno controllo della mia funzione 
	lw $t0 , 0($a0) # swap dei valori 
	lw $t1 , 0($a2)
	sw $t1 , 0($a0)
	sw $t0 , 0($a2)
	jal swap
	lw $ra , 0($sp)
	addi $sp , $sp , 4
	jr $ra
	
end1  : jr $ra	
	


	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
