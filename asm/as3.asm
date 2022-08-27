#fibbonacci 

# 1 1 2 3 5 8

.data 

array: .word # vedere se preservare spazio nell array 

.text
.globl main 

main: 
	li $v0 , 5 # inserimento numero di elementi nell array 
	syscall 
	
	
	mul $s0 , $v0 , 4 # preservo spazio per l array
	
	li $v0 ,9
	move $a0 , $s0
	syscall
	
	
	#codice che include i primi 2 elementi nell array 
	 
	
	
	
	jal fibbonacci
	
	#stampa array e uscita 
		
		
fibbonacci:  # codice che stampa i successivi elelemtni 
	    
	