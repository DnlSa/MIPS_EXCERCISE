.data

parola:  .asciiz "ingegni"


.text
.globl main

main: 
	la $a0 , parola # a0 = parola;
	jal palindroma  # palindroma(parola);
	
	add $a0 , $v0 ,$0
	li $v0 , 1
	syscall
	
	li $v0 , 10 
	syscall
	
palindroma: 
		add $sp , $sp , -4 # push registri nello stack
		sw $ra , 0($sp)
		add $t2 , $0 ,$0   # int i=0
		add $t4 , $a0 , $0 # char *ptr_1 = parola;
		add $t6 , $a0 , $0 # char *ptr_2 = parola; 
		add $t7 , $0 , 1 # int flag =1 ; serve per le parole che scartano 1 lettera
		j for
		
continue: 	add $t6 , $t6 , -1 # ptr_2-1
		lb $t3 , 0($t4) # char a = *ptr_1
		lb $t5 , 0($t6) # char b = *(ptr_2)
		bne $t3 , $t5 , exit # if(a != b) 
		
		sb $0 , 0($t4) # *ptr_1 = 0
		sb $0 , 0($t6) # *ptr_2 = 0 
		
		beq $t2 , $0 , true  # if( i == 0 || i == 1 )
		beq $t2 , $t7 , true 
		add $a0 , $a0 , 1 
		jal palindroma # palindrola(parola+1)
		lw $ra , 0($sp) # pop  dei valori da stack
		add $sp , $sp , 4
		jr $ra
	
	
	
	
	#devo trovare il modo di calcolare la lunghezza della parola 	
for :   # iterazone per il calcolo 
	lb $t1 , 0($t6)	# char n = *(ptr)
	beq $t1  ,$0 , continue # if( !isalpha(*(ptr+i)))
	
	add $t6 , $t6 , 1 # ptr+1
	add $t2 , $t2 , 1 # i++
	j for	
	
exit: 
	add $v0 , $0 , $0 
	jr $ra
	
	
true: 
	add $v0 , $0 , 1
	jr $ra