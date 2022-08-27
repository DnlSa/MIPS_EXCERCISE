.data
stringa: .asciiz "abababababababa"

.text

.globl main


main:
	addi  $sp , $sp , 12
	sw $ra , 0($sp)
	sw $s0, 4($sp)
	
	la $a0, stringa
	#lw $a0 , 0($a0) # passo la stringa in un nel registro da passare alla fnzione 
	sw $a0 , 8($sp)  # faccio un push nello stack del registro temporaneo perche mi riservira dopo
	
	jal len # calcolo della lunghezza della parola
	
	addi $a1 , $v0 , 0 # questa e la lunghezza della parola 
 	lw $a0 , 8($sp) # pop dell indirizzo della parola 
	jal palindroma # verifica se sia palindroma 
	       
len: 
	addi $sp, $sp , -8
	sw $ra , 0($sp)
	sw $s0, 4($sp)  # registro per il calcolo della parola
	addi $t1, $a0 , 0  # passo id registo a t1 + spiazzamento che deriva dalla ricorsione  
	#lw $t0 , 0($t1) 
nextCH:
	lb $t0 , 0($t1) # carica byte su t0
	beq  $t0 , $0 , exit # quando sara 0 allora va in uscita
	addi $s0 , $s0 , 1 # incrementatore lughezza
	addi $t1 , $t1 , 1 # punto al carattere successivo 
	j nextCH
	
exit:   addi $v0 , $s0 , 0 # $v0 = len parola
	lw $s0, 4($sp) # ripristino registri 
	lw $ra , 0($sp)      
	addi $sp, $sp , 8 # ripristino stack
	jr $ra       
	        
	         
	         
palindroma:  

	addi $sp, $sp , -4 
	sw $ra , 0($sp) # salvo registro per la ricorsione 

	addi $t0 , $a0 , 0 #  t0 = id della parola 
	addi $t1 , $a1 , 0 #  t1 = n

	# vedere come viene rappresentata una stringa in memoria in teoria una stringa al piu occupa un byte
	# cio mi evita di calcolare uno spizzamento non classico dei 4 byte dei numeri
	

