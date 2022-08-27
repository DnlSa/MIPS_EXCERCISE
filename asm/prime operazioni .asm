#primi esempi di mips

# somma 2 valori somma t0 e t1 e salva dentro t0 
add $t0 , $t0 , $t1

# prendi registro t0 somma 1 e riscrivi il registro 
addi $t0,$t0, 1

# s0 = t2 sposta i valori dal registro t2 a registro s0
move $s0,$t2

# t1 = leggi in memoria ($sp +4)
lw $t1 , 4($sp)

# sintassi codice_istruzione op1 , op2 , op3

# lw legge in memoria l indirizzo $sp +4byte di offset e salva tutto in t1
