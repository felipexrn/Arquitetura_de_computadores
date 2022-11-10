.text
# Faça um programa que leia a idade (em anos) e o tempo de serviço de um trabalhador.
# Informe se ele pode se aposentar (imprima S se sim, e N se não).
# As condições para aposentadoria são:
# 1) ter, ao menos, 65 anos; OU
# 2) ter trabalhado 40 anos; OU
# 3) ter pelo menos 60 anos e mais de 35 anos.
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0 #idade
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0 #servi�o
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
