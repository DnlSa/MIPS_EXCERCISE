.data


.text
.globl main

main: 
	add $s0 , $0 , 10 # variabile x
	add $s1 , $0 , 8 # variabile y
	
	#if 10 < 34 // se inverto e forzo a lavorare in nevativo un numero allora mi segna sempre 1
	slt $t0 , $s0 , $s1  # imposta a 1 se s1 <= s0
	beq $t0 , $0 , else # salta a else sae e uguale 
	
	# caso in cui s0 e piu piccolo di s1
	sub  $v0 , $s0 , $s0

	add $v0 , $v0 , 1
	jal exit
	
		
			
else : 
	sub $v0 , $s0 , $s1
	add $v0 , $v0 , 1
	jal exit
	
		
exit: 
	add $a0 , $v0 , $0 
	li $v0 ,1	
	syscall
