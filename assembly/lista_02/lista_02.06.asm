.text
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0 #idade
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0 #serviço
	addi $t3 $0 1
	# $t0 >= 65 OU $t1 >= 40 OU $t0 >= 60 E $t1 >= 35
idade:addi $t2 $0 64
	slt $t4 $t2 $t0
	beq $t3 $t4 sim
trab:	addi $t2 $0 39
	slt $t4 $t2 $t1
	beq $t3 $t4 sim
idTra:addi $t2 $0 59
	addi $t5 $0 34
	slt $t4 $t2 $t0
	slt $t6 $t5 $t1
	and $t7 $t4 $t6
	beq $t3 $t7 sim
nao:	addi $a0 $0 'N'
	addi $v0 $0 11
	syscall
	j fim
sim:	addi $a0 $0 'S'
	addi $v0 $0 11
	syscall
fim:	addi $v0 $0 10
	syscall
