.data 
array: .word 1, 2, 3, 4, 5, 6, 12, 6, 10, 7, 8
end:	.asciiz "\n la somma e : " 
.text 

.globl main

main:

add $s0 , $0 , 5 # if 
add $s1 , $0 ,10 # if
move $t2, $0 
add $s3 , $s3,  11
move $t3 , $0


for:
slt $t0 ,$t2 , $s3 # ciclo for
beq $t0 , $0 , exit #ciclo for 
   lw $t1 , array($t3)
   add $t2, $t2 , 1 # incrementatore del ciclo for
   addi $t3, $t3 , 4 # incrementatore dell array
   
   	#li $v0, 1 	#stampa valori dell array 
	#move $a0 , $t1 
	#syscall
  
   slt $t0 , $s0 , $t1 # istruzione dell if se numero array e maggiore di s0 e 1 
   beq $t0 , $0 , for
   bne $t0 , $0 , cond2
cond2: slt $t0 , $t1,$s1
       beq $t0 , $0 , for
       add $t4 , $t4 , $t1
       j for # salto al for 

exit: 
        li $v0 , 4  # messaggio di uscita 
	la $a0 , end
	syscall

        li $v0 , 1
        move $a0 , $t4 # $t4 ha la somma dei valori
        syscall
       
       