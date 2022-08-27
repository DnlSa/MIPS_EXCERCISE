


funzione ricorsiva

	n se n<=1
	
	n+f(n/2)+f(n/4) n>1




f: 
	slti $t0 , $a0 , 2 # $t0 = (n<=1)
 	bne $t0 , $0 , base
 	
 	addi $sp , $sp , -8
 	sw $ra, 0($sp)
 	sw $s0, 4($sp)
 	
 	
 	add $s0 , $0 , $a0 # $s0 <- n
 	sra $a0 , $a0 , 1  # $a0 <- n/2  si fa lo shift a destra sra ->  mantiene il segno srl->NO
 	jal f # prima chiamata ricorsiva $v0 <- f(n/2)
 	sra $a0 , $s0 , 2   # a0  <- n/4
 	add $s0 , $s0 , $v0 # $s0 <- n+f(n/2)
 	jal f	# seconda chiamata ricorsiva $v0 <- f(n/4)
 	add $v0 , $v0 , $s0 # $v0 <- n+f(n/2)+f(n/4)
 	
 	
 	
 	lw $s0 , 4($sp)
 	lw $ra , 0($sp)
 	add $sp , $sp , 8
 	jr $ra
 	
 base:  add $v0 , $0 , $a0
 	jr $ra