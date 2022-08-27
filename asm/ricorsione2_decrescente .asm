
# procedura che verifica se array orinato in maniera decrescente  o meno

 #la ricorsione va fatta cosi SEMPRE



.data

array: .word 9 8 7 6 5 4 3 2 1
flag: .word 0
.text
.globl main
main:
 	la $a0 , array
 	la $t0 , flag
 	add $t1 , $0 , 4
 	sub $t0 , $t0 , $a0 
 	div $t0 , $t1
 	mflo $a1 
 	add $a1 , $a1 , -1 # n-1
 	jal verify
 	add $a0 , $v0 , $0  # a0 = verify(array , n)
 	li $v0 , 1 #stampa 1 se ordinato  0 altrimetni 
 	syscall
 	li $v0 , 10 # return  0 
 	syscall
 	
 verify:
 	add $sp , $sp , -4 # push del registro di ritorno nello stack
 	sw $ra , 0($sp)
 	beq $a1,$0, exit
 	lw $t1 , 0($a0) # array[i]
 	lw $t2 , 4($a0) # array[i+1]
 	slt $t0 , $t2 , $t1 # if(array[i+1] <= array[i]) -- t0 = 1
 	beq $t0 , $0 , else  # se non sono uguali return diretto 
 	add $a0 , $a0 , 4 # i++
 	add $a1 , $a1 , -1 # n--
 	jal verify # verify (array+i , n-1)
 	
 	# blocco funzione di ritorno importantissimo mettere qua perche 
 	#quando richiamiamo la jr $ra torna l istruzione dopo la jal e quindi il ripristino della ricorsione la fa in queste 3 righe di codice
 	
 	
 	lw $ra , 0($sp) # pop indirizzo di ritorno dallo stack
	add $sp , $sp , 4
	jr $ra
	
 else: 
 	add $v0 , $0 , $0 # v0 = 0 (false)
 	jr $ra
	
exit: 
 	add $v0 , $0 ,1 # v0 = 1 (true)
	jr $ra
