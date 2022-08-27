#SOLUZIONE DEL MIRROR Mattrix
# mirror (ricorsiva )
# swap (ricorsiva)
# inoltre per rendere piu interessante la scrittura ho evitato di usare registri $S
# si e volutamente evitato di scrivere la funzione di stampa per non allungare il codice ulteriormente in quanto procedura fuori traccia 

.data 
matrix: .word  1 2 3 4  5 6 7 8  9 10 11 12  13 14 15 16   17 18 19 20
dim : .word 4 5 
.text
.globl main 

main: 	
	addi $sp , $sp , -4
	sw $ra , 0($sp)
	
	la $a0 , matrix # a0 <- &matrix
	la $t0 , dim # t0 <- &dim
	lw $a1 , 0($t0) # a1 <- cols <- 4
	lw $a2 , 4($t0) # a2 <- row <- 5	
	jal mirror # mirror(£matrix , 4 , 5)
	lw $ra , 0($sp)
	addi $sp , $sp , 8
	jr $ra

mirror: 
	addi $sp , $sp , -20 #push registri caller save
	sw $ra , 0($sp)
	sw $a0 , 4($sp) 
	sw $a1 , 8($sp) 
	sw $a2 , 12($sp)
	sll $t3 , $a1 , 2 # t3 = 4*4 
	sw $t3 , 16($sp) # push $t3
	beq $a2 , $0 , end2 # while(row != 0)
	add $t3 ,$t3 , -4  # t3 = (4*4)-4 ) = 16 ->punta alla fine della riga 
	add $a2 , $t3 , $a0 # a2 = matrix [i][cols-1]
	jal swap # void swap (&matrix[i][0] , matrix[i][cols] , cols ) -> ( a0 , a2 , $a1)
	lw $a0 , 4($sp) # pop dei registri caller save
	lw $a1 , 8($sp)
	lw $a2 , 12($sp)
	lw $t3 , 16($sp)
	add $a0 , $a0 , $t3 # $a0 <- matrix[i++][0]
	add $a2 , $a2 , -1 #   $a2 <- row--
 	jal mirror
 	lw $ra , 0($sp) # pop dei registri 
	lw $a0 , 4($sp) 
	lw $a1 , 8($sp)
	lw $a2 , 12($sp)
	lw $t3 , 16($sp) 
 	addi $sp , $sp , 20
 	jr $ra	
 	
end2: jr $ra

swap : 
	add $sp , $sp , -4 
	sw $ra , 0($sp) # push del regitato ra
	add $a1 , $a1 , -1 # dim--
	add $t2 , $0 , 1 # t2 <- 1
	beq $a1 , $t2 , end1 # while(cols != 1)
	lw $t0 , 0($a0) # swap 
	lw $t1 , 0($a2)
	sw $t0 , 0($a2)
	sw $t1 , 0($a0)
	add $a0 , $a0 , 4 # matrix [i][s+1]
	add $a2 , $a2 , -4 # matrix[i] [cols--]
	jal swap
	lw $ra , 0($sp)  # pop del registro ra
	add $sp , $sp , 4
	jr $ra
	
end1: jr $ra
	