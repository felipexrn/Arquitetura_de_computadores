# Crie um programa que leia 6 valores inteiros pares,
# descartando qualquer entrada ímpar,
# e, em seguida, mostre na tela os valores lidos na ordem inversa.
.text
main:	lui $t0 0x1001 # aponta para v[0]
	addi $t1 $0 6 # t = 6
	add $t2 $0 0 # contador = 0
	
for:	beq $t1 $t2 prn # $t1 == $t2? prn: prox instr
	addi $v0 $0 5
	syscall
	
par:	andi $t3 $v0 1 # par? 0:1
	bne $t3 $0 for
	sw $v0 0($t0) # v[i] = entrada
	addi $t2 $t2 1 # contator ++
	addi $t0 $t0 4 # aponta para v[i]
	j for
	
prn:	