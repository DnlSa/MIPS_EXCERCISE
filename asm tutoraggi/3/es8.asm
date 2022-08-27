

#procedura che calcoli la somma della diagonale principale 



.data
matrix : .word 1 3 4 5  2 3 4 5  6 7 6 5  10 2 3 4
 #visto come un array flat allocato nel campo data 
n : .word 4 
 

.text
.globl main

main: 

	la $a0 , matrix # a0 = & matrix
	lw $a1 , n # passo valore n
	add $a2 , $0 , $a2 # parametro sommatore 
	add $a3 , $a1 , $0 # passato alla funzione tracci il count 
	jal diagonalSum
	add $a0 , $v0 , $0 # v0 trona e alloco in a0 
	li $v0 , 1
	syscall
	
	li $v0 , 10
	syscall	
		
#tutto e fattibile in modo iterabile o ricorsivo . si predilige la ricorsione perch epiu divertente 
# essendo una procedura ricorsiva ho il pieno controllo degli argomenti che passo quindi a propio conosco gia che 
# gli argomenti passati mi posso gestire solamente io 
#devo poter salvare il valore che calcolo anche per le successive iterazioni alloco a2 che conterra la somma 
diagonalSum:
 	add $sp , $sp , -4
 	sw $ra , 0($sp)

 	add $t0 , $0 , $0 # reset t0
 	add $t1 , $0 , $0 # reset t1
 	
 	lw $s3 , 0($a0) # t3 = matrix[i] 
 	add $a2 ,  $a2 , $s3 # a2 = a2 + s3
 	add $a3 ,$a3 , -1 # a3-- 
 	beq $a3 , $0 , exit # if(a3 == 0) -> exit
	
 	add $t0 , $a1 , 1 # $t0 = 4+1
 	add $t2 , $0 , 4 # int = 4 byte 
 	mult $t0 , $t2 # moltiploco per 4 lo spiazzmento # vedere se va bene t1 = 5*4 = 20
 	mflo $t1 # t1 = 20
 	
 	add $a0 , $a0 , $t1 #
 	jal diagonalSum # int diagonalsum( int *a0 , int  n , int sum , int count)
 	
 	lw $ra , 0($sp)

 	add $sp , $sp , 4
 	jr $ra # return

exit: 	add $v0, $0, $a2   # return v0 
	jr $ra
 	
 	
 	
 	
 	 
 	 
 	 
		