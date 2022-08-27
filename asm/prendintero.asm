#prende in input un valore intero e lo sposta in un regiatro  
.text


	li $v0,5 # prendo l intero 
	syscall
	move $s0 , $v0