#2 sezioni definiamo nel nostro programma una sezione
 
#data dove contiene le variabili - il data salva le variabli nella ram 

#text dove conteniamo tutte e istruzioni che vengono eseguite 


.data
 myMessage: .asciiz "hello world \n"


.text 
#conitene tutto il set di istruzioni 
	li $v0 , 4
	la $a0, myMessage
	syscall
	
# li -  comendo di lettura del valore 4 
# la -  inserimento nel registro $a0 ,  varibile muMessagge
# syscall - chiamate al sistema operativo servono per input out
# $v0 - valori di ritorno delle funzioni
# $a0 - intero da stampare in questo caso ho passato una stringa
