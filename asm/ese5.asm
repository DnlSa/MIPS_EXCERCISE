.text

#	add $s0 , $0 , 15 # scrivo nel registro il numero 20 
#	add $s1 , $0 , 15 # scrivo nel registro numero 15
#	bne $s0 , $s1 , else # va alla label se s0 e s1 sono diversi 
#	#beq $s0 , $s1 , else #va alla label se s0 e s1 sono uguali 
#	add $s3 , $s1 , $s0 # addizione di s0+s1
#	j exit  # istruzione di salto alla label exit
#	else: sub $s3 , $s0,$s1 # esecuzione dell else dal beq
#	exit : move $a0 , $s3 # esecuzione della exit che viene eseguita sempre anche dopo else
#	li $v0 , 1 # stampa valore
#	syscall

#esempio slide istruzioni ips pagina 50 
		add $s0 , $0 , 18 # scrivo nel registro il numero 20 
		add $s1 , $0 , 17 # scrivo nel registro numero 15
		
		slt $t0 , $s0 , $s1  # se $s0 e minore di $s1 allora imposta $t0 a 1
		# conseguenza importante se scambio i registri diventa se -$s0 maggiore di $s1
		# se ho 2 numeri uguali slt mi da 0 come out 
		add $a0 , $0 , $t0
		li $v0 , 1 # stampa valore
		syscall
		
		beq $t0 , $0 , else # se 0 e $t0 sono uguali allora vai alla label
		add $s2 , $s1 , $s0 # somma 
		j exit
		else: sub $s2 , $s0 , $s1 #sottrai
		exit : move $a0 , $s2 # esecuzione della exit che viene eseguita sempre anche dopo else
		li $v0 , 1 # stampa valore
		syscall
			