# Programa que leia do usuario um intervalo fechado
# e imprima os numeros pares desse intervalo (inclusive os limites).
.text
main: 	addi $v0 $0 5
	syscall
	add $t0 $0 $v0 # inicio
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0 # fim
	sub $t2 $t1 $t0 # intervalo
	addi $t3 $0 0 # incremento
	
for:	add $a0 $t0 $t3
	andi $v0 $a0 1
	bne $v0 $0 rfor
prn:	addi $v0 $0 1
	syscall
	addi $a0 $0 '\n'
	addi $v0 $0 11
	syscall
rfor:	beq $t2 $t3 end
	addi $t3 $t3 1
	j for

end:	addi $v0 $0 10
	syscall