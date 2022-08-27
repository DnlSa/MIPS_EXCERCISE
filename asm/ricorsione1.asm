#funzione ricorsiva


.data


.text 
.globl main

main: 
	add $s1,$0,1
	addi  $s0, $s0 ,5
	
	slt $t0,$s1,$s0
	beq $t0 ,$0 , exit1
	jal fact
	move $s3 , $v0
	
	# stampa risultato da sistemare
	li $v0,1
        move $a0, $s3 
        syscall
	j exit
	
	
exit1: li $v0,1
       addi $a0, $0 , 1
       syscall
       
exit:  li $v0 , 10
       syscall
	

fact: 
	#convenizione di chiamata 
	addi $sp, $sp, -4 # alocazone spazio dello stack
	sw $ra , 0($sp) # puntatore alla funzione main da ripristinare alla fine 
	sw $s0 , 4($sp) # valore di input che  mi voglio tenere per scriverlo alla fine 	
	
	slt $t2,$0, $s0
	beq $t2 ,$0 , exit
	sub $t1,$s0,1
	
	mul $v0,$t1,$s0
	sub $s0,$s0,1
	j fact
	
	

	 




