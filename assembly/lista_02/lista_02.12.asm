.text
# lê duas notas (entre 0 e 100)e as faltas de um aluno em uma disciplina.
# A média do aluno é calculada ponderadamente, com pesos 2 e 3.
# A cada 5 faltas o aluno perde 10 pontos.
# O programa deve informar a média, a penalidade e a média final, uma em cada linha.
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0
	addi $v0 $0 5
	syscall
	add $t2 $0 $v0
	addi $t3 $0 2
	mul $t0 $t0 $t3
	addi $t3 $0 3
	mul $t1 $t1 $t3
	addi $t3 $0 5
	add $a0 $t0 $t1
	div $a0 $t3
	mflo $a0
	mflo $t5
	addi $v0 $0 1
	syscall
	addi $a0 $0 '\n'
	addi $v0 $0 11
	syscall
	div $t2 $t3
	mflo $a0
	addi $t3 $0 10
	mul $a0 $a0 $t3
	addi $v0 $0 1
	syscall
	addi $a0 $0 '\n'
	addi $v0 $0 11
	syscall
	sub $a0 $t5 $a0
	slt $t6 $a0 $0
	bne $t6 $0 n
	j pri
n:	addi $a0 $0 0
pri:	addi $v0 $0 1
	syscall
fim:	addi $v0 $0 10
	syscall
