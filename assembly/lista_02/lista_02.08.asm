.text
main: addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0
	addi $v0 $0 5
	syscall
	add $t2 $0 $v0
	addi $t3 $0 1 # dia, mês ou ano menores que 1
	slt $t4 $t0 $t3
	bne $t4 $0 inv
	slt $t4 $t1 $t3
	bne $t4 $0 inv
	slt $t4 $t2 $t3
	bne $t4 $0 inv
	addi $t3 $0 12 # mês acima de 12
	slt $t4 $t3 $t1
	bne $t4 $0 inv
	addi $t3 $0 31 # dia acima de 31
	slt $t4 $t3 $t0
	bne $t4 $0 inv
	addi $t4 $0 8 # mês de 30 dias
	div $t1 $t4
	mflo $t4
	add $t4 $t4 $t1
	addi $t5 $0 2
	div $t4 $t5
	mfhi $t5
	beq $t5 $0 tri # não está claro ainda
	j triu
tri:	slt $t4 $t0 $t3
	beq $t4 $0 inv
triu:	addi $t3 $0 2
	beq $t3 $t1 fev
	j val
fev:	addi $t3 $0 4 # ano bissexto
	div $t2 $t3
	mfhi $t4
	beq $t4 $0 quat
	j nbis
quat:	addi $t3 $0 100
	div $t2 $t3
	mfhi $t4
	bne $t4 $0 bis
	addi $t3 $0 400
	div $t2 $t3
	mfhi $t4
	beq $t4 $0 bis
nbis:	addi $t3 $0 29
	slt $t4 $t0 $t3
	beq $t4 $0 inv 
	j val
bis:	addi $t3 $0 30
	slt $t4 $t0 $t3
	beq $t4 $0 inv 
	j val
inv:	addi $a0 $0 'i'
	addi $v0 $0 11
	syscall
	addi $a0 $0 'n'
	addi $v0 $0 11
	syscall
val:	addi $a0 $0 'v'
	addi $v0 $0 11
	syscall
	addi $a0 $0 'á'
	addi $v0 $0 11
	syscall
	addi $a0 $0 'l'
	addi $v0 $0 11
	syscall
	addi $a0 $0 'i'
	addi $v0 $0 11
	syscall
	addi $a0 $0 'd'
	addi $v0 $0 11
	syscall
	addi $a0 $0 'a'
	addi $v0 $0 11
	syscall
fim:	addi $v0 $0 10
	syscall
