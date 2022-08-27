

.text 
	#passo il primo intero 
	add $t0 , $0 , 25
	#passo il secondo intero 
	add $t1 , $0 , 10
	# addizione primo e secondo intero 
	add $a0 , $t0 , $t1
	#stampa
	li $v0 , 1
	syscall 