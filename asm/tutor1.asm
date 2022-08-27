

.data 
x: .word 5
y: .word 3

.text
.glogl main

main: 
	la $t0 , x		# indirizzo della x
	lw $t0 , 0($t0)		# $t0 = x
	
	la $t1 , y		# indirizzo della y
	lw $t1 , 0($t1)		# $t0 = x
	
	addi $v0 , $t0,1        # risultato= x+1
	
	slt $t2 , $t0 , $t1
	beq $t2 , $zero ,  miny 
	sub $v0 , $v0, $t0     
	j fine              #basta un salto incondizionato
	
miny:
	sub $v0 , $v0, $t1
	
fine : 
	jr $ra  # return 
	