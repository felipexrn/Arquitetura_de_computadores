# Fa�a um programa que implementa um la�o com um teste no in�cio
# que conte de 0 a 10 imprimindo esses n�meros,
# um em cada linha da sa�da.
.text
main:	add $t0 $0 11
	addi $t1 $0 0
while:beq $t1 $t0 end
	add $a0 $0 $t1
	addi $v0 $0 1
	syscall
	addi $a0 $0 '\n'
	addi $v0 $0 11
	syscall
	addi $t1 $t1 1
	j while
end:	addi $v0 $0 10
	syscall