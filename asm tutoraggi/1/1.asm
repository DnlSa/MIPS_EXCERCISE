
.data


.text
.globl main

main: 
	add  $s0 , $0 , 55 # variabile x
	add $s1 , $0 , 63 # variabile y
	add $v0, $s0 , $0 #copio al volo la variabile x
	
	
	slt $t0 , $s0 ,$s1 #  se $s0 <= $s1 setta a 1 il registro t0
	beq $t0 , $0 , else # salta a else se t0 =0
	
	sub $v0, $s0 ,$s0 # x - x
	addi $v0 , $v0 , 1 # +1
	jal end	 # jump a end
	

else: sub $v0 , $s0 ,$s1 # x - y
      add $v0 , $v0 , 1 # x+1
      jal end
	
end:  add $a0 , $0 , $v0 # chiaata a sistema per la stampa del valore
 	li $v0 , 1 # chiamata della syscall
 	syscall	 # chiamata al sistema 
	