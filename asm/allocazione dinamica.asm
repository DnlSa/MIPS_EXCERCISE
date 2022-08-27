
.data 


.text 


	addi $s2 , $s2 , 34
	li $a0,12 #carica in memoria la costante 256 che sara la dimensione 
	#del blocco di memoria da allocare nel sistema 
	li $v0 ,9  # chimata per sbrk 
	syscall
	move $s0 , $v0 #ritorna il puntatore al blocco in memoria
	sw $s2 , 0($s0)
	