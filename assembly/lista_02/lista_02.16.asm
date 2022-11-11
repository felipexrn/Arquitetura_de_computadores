.text
# *Faça um programa que leia um número com 9 algarismos.
# informe os dois algarismos seguintes que devem formar um CPF válido.
main:	addi $v0 $0 5
	syscall
dec:	addi $t0 $0 10
	div $v0 $t0
	mflo $v0 
	mfhi $t1 # algarismo 1
	div $v0 $t0
	mflo $v0 
	mfhi $t2 # algarismo 2
	div $v0 $t0
	mflo $v0 
	mfhi $t3 # algarismo 3
	div $v0 $t0
	mflo $v0 
	mfhi $t4 # algarismo 4
	div $v0 $t0
	mflo $v0 
	mfhi $t5 # algarismo 5
	div $v0 $t0
	mflo $v0 
	mfhi $t6 # algarismo 6
	div $v0 $t0
	mflo $v0 
	mfhi $t7 # algarismo 7
	div $v0 $t0
	mflo $v0 
	mfhi $t8 # algarismo 8
	div $v0 $t0
	mflo $v0 
	mfhi $t9 # algarismo 9
dig10:	addi $s0 $0 0
	addi $t0 $0 2
	mul $t0 $t0 $t1
	add $s0 $s0 $t0 
	addi $t0 $0 3
	mul $t0 $t0 $t2
	add $s0 $s0 $t0 
	addi $t0 $0 4
	mul $t0 $t0 $t3
	add $s0 $s0 $t0 
	addi $t0 $0 5
	mul $t0 $t0 $t4
	add $s0 $s0 $t0 
	addi $t0 $0 6
	mul $t0 $t0 $t5
	add $s0 $s0 $t0 
	addi $t0 $0 7
	mul $t0 $t0 $t6
	add $s0 $s0 $t0 
	addi $t0 $0 8
	mul $t0 $t0 $t7
	add $s0 $s0 $t0 
	addi $t0 $0 9
	mul $t0 $t0 $t8
	add $s0 $s0 $t0 
	addi $t0 $0 10
	mul $t0 $t0 $t9
	add $s0 $s0 $t0
	addi $t0 $0 11
	div $s0 $t0 
	mfhi $s0
	addi $t0 $0 2
	slt $t0 $t0 $s0
	beq $t0 $0 r1
	addi $t0 $0 11
	sub $s1 $t0 $s0 # Digito 10
	j dig11
r1:	addi $s1 $0 0 # Digito 10
dig11:	addi $s0 $0 0
	addi $t0 $0 2
	mul $t0 $t0 $s1
	add $s0 $s0 $t0 
	addi $t0 $0 3
	mul $t0 $t0 $t1
	add $s0 $s0 $t0 
	addi $t0 $0 4
	mul $t0 $t0 $t2
	add $s0 $s0 $t0 
	addi $t0 $0 5
	mul $t0 $t0 $t3
	add $s0 $s0 $t0 
	addi $t0 $0 6
	mul $t0 $t0 $t4
	add $s0 $s0 $t0 
	addi $t0 $0 7
	mul $t0 $t0 $t5
	add $s0 $s0 $t0 
	addi $t0 $0 8
	mul $t0 $t0 $t6
	add $s0 $s0 $t0 
	addi $t0 $0 9
	mul $t0 $t0 $t7
	add $s0 $s0 $t0 
	addi $t0 $0 10
	mul $t0 $t0 $t8
	add $s0 $s0 $t0 
	addi $t0 $0 11
	mul $t0 $t0 $t9
	add $s0 $s0 $t0
	addi $t0 $0 11
	div $s0 $t0 
	mfhi $s0
	addi $t0 $0 2
	slt $t0 $t0 $s0
	beq $t0 $0 r2
	addi $t0 $0 11
	sub $s2 $t0 $s0 # Digito 11
	j pri
r2:	addi $s2 $0 0 # Digito 11
pri:	addi $v0 $0 1
	add $a0 $0 $s1
	syscall
	add $a0 $0 $s2
	syscall
fim:	addi $v0 $0 10
	syscall