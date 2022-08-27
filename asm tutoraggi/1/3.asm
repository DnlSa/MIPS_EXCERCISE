#fibbonacci

.data 

n : .word 12


.text
.globl main

main: 
	lw $a0 , n # carico in a0 il numero 5
	add $a0 , $a0 , -1
	add $a1 , $0 , 1 # fib(n-1)
	add $a2 , $0 , $0 # fib (n-2)
	add $s1 ,  $0 , 2 # se n <2 escit
	slt $t0 , $s1 , $a0 # if se fosse minore di 5 
	beq $t0 , $0 , else
	jal Fib
	add $a0 , $0 , $v0
	li $v0 , 1
	syscall
	li $v0 , 10
	syscall
	
	
	
	
else: # uscita in caso fosse minore di 2
	add $a0 , $0 , 1
	li $v0 , 1
	syscall
	li $v0 , 10
	syscall



Fib: # devo farlo in modo ricorsivo

	add $sp , $sp , -8 # push dei valori in memoria 
	sw $ra , 0($sp)
	sw $s1 , 4($sp) # salvo valori nello stack
	
	add $a3 , $a1 , $a2 # fib(n-1)+ fib(n-2)
	add $a2 , $0 , $a1  # fib(n-2)  diventa fib (n-1)
	add $a1 , $0 , $a3 # fib (n-1) diventa il valore appna calcolato che nella prossima iterazione diventera fib(n-1)
	add $a0 , $a0 , -1 # sottraggo un n 
	beq $a0 , $0 , rec
	jal Fib
	
rec:    add $v0 , $0 ,$a3
	lw $s1 , 4($sp)
	lw $ra , 0($sp)
	add $sp , $sp , 8
	jr $ra
	
	
	
	
#print:  add $a0 ,$0 , $a3
#	li $v0 , 1
#	syscall
	
	
	