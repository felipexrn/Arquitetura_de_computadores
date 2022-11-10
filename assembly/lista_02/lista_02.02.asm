.text
# lê inteiro e exibe o seu dobro caso positivo e seu quadrado caso seja negativo
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0
  beq $t0 $0 fim
	add $t1 $0 $t0
	srl $t1 $t1 31
	addi $t2 $0 1
	beq $t1 $t2 negativo
	sll $a0 $t0 1
	j print
negativo:mul $a0 $t0 $t0
print:	addi $v0 $0 1
	syscall
fim:	addi $v0 $0 10
	syscall