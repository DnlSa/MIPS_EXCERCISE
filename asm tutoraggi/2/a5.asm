.data

A : .word 1 2 3 4 5 6 7 8 9
B : .word 2 3 4 5 6 7 8 9 10
space : .asciiz " "

.text 
.globl main 
main:

	la $a2 , A #passo indirizzo di A
	la $s3 , B # passo indirizzo di B
	#indirizzo degli array essendo una memoria flat l array a va da 0x01001000 a 0x01001024 dove inizia B allora se ne faccio una sub ho la grandezza dell array A
	add $s1 , $s1 , 4 # valroe statico 
	sub $s0 , $s3 , $a2
	div $s0 , $s1
	mflo $s2  # elementi array 
	add $a1, $a1 , 0 # inizializzo i=0;  
	
for :  				# for (i=0;i<n;i++)
	beq $a1 , $s2 , exit 	# quando t2 = s2 i=9 exit
	
	lw $t2 , 0($s3) # B[i] da passare alla funzione
	add $a3 , $0 , $0 # j = 0 
	la $a2 , A #passo indirizzo di A
	jal sumarr
	add $t2 ,  $t2 ,$v0 # v0 ritorna somma di elementi A
	
	add $a0 , $0 , $t2 
	li $v0 , 1
	syscall		
	
	li $v0 , 4 # stampa lo spazio fra 2 numeri  
	la $a0 , space
	syscall
	
	add $a0 , $0 , $0
	add $a1 , $a1 , 1  # incre,emto di i++
	add $s3 , $s3 , 4
	j for 
	
exit: 
	li $v0 ,10
	syscall

#int sumnarr( int i ,int  A INDIRIZZO)
sumarr:
	add $sp , $sp , -16 # salvo nello stac
	sw $ra , 0($sp)
	sw $s0 , 4($sp)
	sw $s1 , 8($sp)
	sw $s2 , 12($sp)
	add $t0 , $0 , $0 # t=0;
	lw $t0 , 0($a2) # qiesta e la sommatoria 
	add $a0 , $a0 , $t0 # q+=A[j];
	beq $a3 , $a1 ,else # quando i = j  allora vai in else
  	add $a3 , $a3 , 1 # incremento j++
  	add $a2 , $a2 , 4 # incfemento array 
	jal sumarr #ricorsione 
  	  	
else: 	add $v0 , $0 , $a0 # return v0
	lw $s2 , 12($sp) #rinvengo nello stack i valori 
	lw $s1,8($sp)
	lw $s0,4($sp)
	lw $ra,0($sp)
	add $sp , $sp , 16
	jr $ra