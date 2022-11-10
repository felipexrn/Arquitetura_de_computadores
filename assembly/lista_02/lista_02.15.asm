.text
# Congruência de Zeller para encontrar dia da semana no calendário Juliano e Gregoriano
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0 # dia
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0 # mês
	addi $v0 $0 5
	syscall
	add $t2 $0 $v0 # ano
zeller:	addi $t3 $0 1
	beq $t1 $t3 jan # if (mes == 1) { mes = 13; ano = ano - 1 }
	addi $t3 $0 2
	beq $t1 $t3 fev # if (mes == 2) { mes = 14; ano = ano - 1 } 
	j sem
jan:	addi $t1 $0 13
	sub $t2 $t2 1
	j sem
fev:	addi $t1 $0 14
	sub $t2 $t2 1
sem:	addi $t3 $0 100 
	div $t2 $t3
	mfhi $t3 # a = ano MOD 100
	mflo $t4 # b = ano / 100
	addi $t5 $t1 1 # c = mes + 1
	addi $t6 $0 13
	mul $t6 $t5 $t6 # d = c * 13
	addi $t7 $0 5
	div $t6 $t7
	mflo $t7 # e = d / 5
	addi $t8 $0 4
	div $t3 $t8
	mflo $t8 # f = a / 4
	addi $t9 $0 4
	div $t4 $t9
	mflo $t9 # g = b / 4
	addi $s0 $0 5
	div $t4 $s0
	mflo $s0 # h = b * 5
	add $s1 $t0 $t7
	add $s1 $s1 $t4
	add $s1 $s1 $t8
	add $s1 $s1 $t9
	add $s1 $s1 $s0 # i = dia + e + a + f + g + h
	addi $s2 $0 7
	div $s1 $s2
	mfhi $s2 # k = i MOD 7
car:	addi $v0 $0 11
pri:	addi $s3 $0 0
	beq $s3 $s2 sab
	addi $s3 $0 1
	beq $s3 $s2 dom
	addi $s3 $0 2
	beq $s3 $s2 seg
	addi $s3 $0 3
	beq $s3 $s2 ter
	addi $s3 $0 4
	beq $s3 $s2 qua
	addi $s3 $0 5
	beq $s3 $s2 qui
	j sex
dom:	add $a0 $0 'd' # 1 domingo
	syscall
	add $a0 $0 'o'
	syscall
	add $a0 $0 'm'
	syscall
	j fim
seg:	add $a0 $0 's' # 2 segunda
	syscall
	add $a0 $0 'e'
	syscall
	add $a0 $0 'g'
	syscall
	j fim
ter:	add $a0 $0 't' # 3 terça
	syscall
	add $a0 $0 'e'
	syscall
	add $a0 $0 'r'
	syscall
	j fim
qua:	add $a0 $0 'q' # 4 quarta
	syscall
	add $a0 $0 'u'
	syscall
	add $a0 $0 'a'
	syscall
	j fim
qui:	add $a0 $0 'q' # 5 quinta
	syscall
	add $a0 $0 'u'
	syscall
	add $a0 $0 'i'
	syscall
	j fim
sex:	add $a0 $0 's' # 6 sexta
	syscall
	add $a0 $0 'e'
	syscall
	add $a0 $0 'x'
	syscall
	j fim
sab:	add $a0 $0 's' # 0 sábado
	syscall
	add $a0 $0 'a'
	syscall
	add $a0 $0 'b'
	syscall
fim:	addi $v0 $0 10
	syscall
