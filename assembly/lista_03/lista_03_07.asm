# Fa�a um programa que leia n�meros inteiros diferentes de zero.
# Calcule a soma dos valores positivos.
# O la�o do programa termina quando o usu�rio digita um valor zero.
# Em seguida o programa imprime a soma dos valores positivos digitados.
.text
main:	addi $a0 $0 0 # acumulador

while:	addi $v0 $0 5
	syscall
	beq $v0 $0 prn
	add $a0 $a0 $v0
	j while
	
prn:	addi $v0 $0 1
	syscall

end:	addi $v0 $0 10
	syscall