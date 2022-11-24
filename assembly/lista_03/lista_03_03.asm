# Faça um programa que implementa um laço com um teste no início
# que conte de 0 a 10 imprimindo esses números,
# um em cada linha da saída.
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