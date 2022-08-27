
.data  # passo la variabile qui dentro 

str : .asciiz "ciao"

.text

li $v0 , 4 # carica registro v0 e 4 e il numeor per la print string
la $a0 , str # str e l indirizzzo della stringa viene memorizzato nel a0
syscall #la chimata a sistema va  vdere il registro $a0 



