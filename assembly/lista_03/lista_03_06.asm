# Fa�a um programa que leia n�meros inteiros e calcule a soma.
# O la�o do programa termina quando o usu�rio digita um valor negativo.
# Em seguida o programa imprime a soma dos valores digitados.
.text
main:	addi $t0 $0 0 # verificador de menor
	
while:	addi $v0 $0 5
	syscall
	slt $t0 $v0 $0
	bne $t0 $0 prn
	add $a0 $a0 $v0
	j while

prn:	addi $v0 $0 1
	syscall
	
end:	addi $v0 $0 10
	syscall