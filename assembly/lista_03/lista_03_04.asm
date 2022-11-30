# Faça um programa que leia do usuário um intervalo fechado
# e imprima os números pares desse intervalo (inclusive os limites).
.text
main: 	addi $v0 $0 5
	syscall
	add $t0 $0 $v0 # inicio
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0 # fim

for:	
	