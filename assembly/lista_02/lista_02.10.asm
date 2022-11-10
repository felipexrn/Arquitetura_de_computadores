.text
# Faça um programa que leia três números
# Informa a média aritmética simples desses três números.
# Arrendonda o resultado para o inteiro mais próximo.
# (a partir 0,5 arredonda para o próximo inteiro maior)
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0
	addi $v0 $0 5
	syscall
	add $t2 $0 $v0
	add $a0 $t0 $t1
	add $a0 $a0 $t2
	addi $t3 $0 3
	div $a0 $t3
	mflo $a0
	mfhi $t4
	addi $t3 $0 1
	slt $t5 $t3 $t4
	add $a0 $a0 $t5
	addi $v0 $0 1
	syscall
	add $a0 $0 ','
	addi $v0 $0 11
	syscall
	add $a0 $0 $0
	addi $v0 $0 1
	syscall
fim:	addi $v0 $0 10
	syscall
	