.data 
array: .word 1, 2, 3, 4, 10, 14, 17, 12

.text 

.globl main

main:

add $s0 , $0 , 5 # if 
add $s0 , $0 ,10 # if

la $t0 , array
lw $t1 , 0($t0)

li $v0 , 1
move $a0 , $t1
syscall
