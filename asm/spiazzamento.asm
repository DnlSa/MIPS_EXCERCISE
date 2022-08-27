# 0x7fffeffc il valore massimo dello stack
# 0x7fffeff0 il valore dello stack pointer -12 bit /4 bit = 3 word


.text 

addi $t0 , $t0, 5
addi $t1 , $t1, 4
addi $t2 , $t2, 3

addiu $sp , $sp , -12 # decremento lo stack pointer di 12 bit che sono esattamente 3 word

#adesso memorizzo i valori (faccio unoperazione di push)
sw $t0 , 8($sp) # memorizzo i valori nello stak pointer on spizzamento 8 
sw $t1 , 4($sp)
sw $t2 , 0($sp)

#adesso faccio l operazione inversa che mi permette di ricarcare i valori nei registri e dealloco i 12 bit
#(faccio un operazione di pop)
lw $t3 , 8($sp) #carico i valore di t0 del refistro t3
lw $t4 , 4($sp) # carico i valore di t1 nel registro t4
lw $t5 , 0($sp) # carico i valore di t2 nel registro t5
addiu $sp  , $sp , 12 #dealloco le word che ho preso prima 