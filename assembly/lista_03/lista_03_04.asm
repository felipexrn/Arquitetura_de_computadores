# Fa�a um programa que leia do usu�rio um intervalo fechado
# e imprima os n�meros pares desse intervalo (inclusive os limites).
.text
main: 	addi $v0 $0 5
	syscall
	add $t0 $0 $v0 # inicio
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0 # fim

for:	
	