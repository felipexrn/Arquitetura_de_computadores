# Programa que le 10 valores e imprime a sua soma.
.text
main:	addi $t0 $0 9 # qtd repeticoes

for:	addi $v0 $0 5
	syscall
	add $a0 $a0 $v0
	beq $t0 $0 prn
	addi $t0 $t0 -1
	j for
	
prn:	addi $v0 $0 1
	syscall

end:	addi $v0 $0 10
	syscall