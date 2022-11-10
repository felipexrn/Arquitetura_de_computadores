.text
# lê três números (entre 0 e 100).
# Calcula a média ponderada com pesos 1, 2 e 3.
# Se a média >= 60 imprime a média, depois a letra A.
# Caso contrário, imprime a média, depois a letra R.
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0
	addi $v0 $0 5
	syscall
	add $t2 $0 $v0
	sll $t1 $t1 1
	add $t3 $0 $t2
	sll $t2 $t2 1
	add $t2 $t2 $t3
	add $t3 $t0 $t1
	add $t3 $t3 $t2
	addi $v0 $0 6
	div $t3 $v0
	mflo $a0
	addi $v0 $0 1
	syscall
	addi $t3 $0 60
	slt $t4 $a0 $t3
	beq $t4 $0 aprov
	addi $v0 $0 11
	addi $a0 $0 '\n'
	syscall
	addi $a0 $0 'R'
	syscall
	j fim
aprov:addi $v0 $0 11
	addi $a0 $0 '\n'
	syscall
	addi $a0 $0 'A'
	syscall
fim:	addi $v0 $0 10
	syscall