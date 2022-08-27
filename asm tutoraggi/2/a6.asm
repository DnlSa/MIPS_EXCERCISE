# tale algoritmo deve trovare il max 


.data

A : .word 1 ,13, 999,24,5,3,46,76,8,9,3 , 120 , 547
B : .asciiz " : è il nassimo del array"
C : .asciiz ": e la dimensione dell' array "

.text
.globl main 

main: 
	la $a1 , A
	la $s1 , B
	
	#algoritmo di definizione dell array 
	add $s2 ,$0 , 4 # dimensione dell int 
	sub $t3 , $s1 , $a1  # differenza tra indirizzi essendo memeoria flat
	div $t3 , $s2 # divisione con ll int 
	
	mflo $a0   # a0= 10  risultato divisione 
	add $a0 , $a0 , -1 # devo compiere n-1 passi perche conto 2 registri consecutivi 
	lw $a2 , 0($a1) # A[i] 
	jal maxfind
	
	add $a0 , $0 , $v0
	li $v0 , 1
	syscall
	
	li $v0 , 4
	la $a0 , B
	syscall
	
	li $v0 , 10 
	syscall
	
	
maxfind: 
		add $sp , $sp , -12
		sw $ra , 0($sp)
		sw $s1 , 4($sp)
		sw $s2 , 8($sp)
		
		add $a1 , $a1 , 4 # incremento array 
		lw $a3 , 0($a1) # A[i+1] 
		beq $a0 , $0 , exit #decremento sempre a0 ad ogni passo fino a tornare 0 
		slt $t0 , $a2 , $a3 # se a2 <= a3 allora e 1 altirmetni e 0
 		beq $t0 , $0 , else
		add $a2 , $0 , $a3 # qua prendi il nuovo valore 
		add $a0 , $a0 , -1 # decremetno n
		jal maxfind
			
else: 
		beq $a0 , $0 , exit #importante perche la ricorsione torna su i salti eseguiti se non metto questa condizione va a trovare indirizzi inesistenti e non esce piu dal loob
		add $a0 , $a0 , -1 # decremetno n
		
		jal maxfind
	
exit: 		add $v0 , $0 , $a2
		lw $s2 , 8($sp)
		lw $s1 , 4($sp)
		lw $ra , 0($sp)
		add $sp , $sp , 12
		jr $ra