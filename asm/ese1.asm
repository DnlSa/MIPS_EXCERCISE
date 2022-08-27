#esercizi mips 

# creazione di un ciclo for
.data 

 str: .asciiz "x" # dichiarazione della variabile 


.text
 
  main:
 
     li $t0,0	# inizio del ciclo for
     li $t1 ,5 # fine del ciclo for
   
  loop: 
  	li $v0 , 4 # stampa la x
 	la $a0 , str # copiamo il carattere nel registro a0
 	syscall # chiamo la system call (analizza la a0)
 	
 	
 	add $t0 , $t0 , 1 # incrementatore del ciclo 
 	beq $t0 , $t1 , exit # questo comando mi dice che se $t0 == $t1 allora vai nella funzione exit
  	j loop # ritorna nella funzione loop 
 
 exit: 
 	li $v0 , 10 # codice per stampare cose 
 	syscall