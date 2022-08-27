.text
# per passare un parametro ho fatto l addizzione tra un registro temporaneo e una costante 
# poi ho passato alla stampa

#	add $a0 , $t1 , 10 
#	la $v0 ,1
#	syscall

#adesso provo a fare un addizione
#	add $s0, $zero , 20 # do 20 al registro s0
#	add $s0 , $s0 , $s0 #moltiplico per 2
#	sub $t0, $s0 , 25 # sottrazione 
#	move $a0 , $t0 # sposto registro t0 su a0 per stamparlo
#	la $v0 ,1 
#	syscall	
	
#molti plicazione con addizzione

#	 add $s0 , $0 , 20 # assegna al registro s0 20
#	 add $s0 , $s0 , $s0 # moltiplica per 2 ed e 40 
#	 add $s0 , $s0 , $s0 # moltiplica per 2 40 ed e 80 
#	 move $a0 , $s0 # sposto il registro per stampare i valore 
#	 li $v0 , 1 
# 	syscall

#provo a vedere i spiazzamenti 

	lw $t0 ,$0 ,0($s0)
	add $t0 ,$t0 , 20
	sw  $t0 , 32($s3)



