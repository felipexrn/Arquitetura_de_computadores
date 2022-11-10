.text
# Semana = (Dia + 2 * Mes + (3 * (Mes + 1) / 5) + Ano + Ano / 4 - Ano / 100 + Ano / 400 + 2) % 7;
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0 # Dia
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0 # Mes
	addi $v0 $0 5
	syscall
	add $t2 $0 $v0 # Ano
	
alg:	addi $t3 $t1 1 # A = Mes + 1
	addi $t4 $0 5 
	div $t3 $t4
	mflo $t4 # B = A / 5
	addi $t5 $0 3
	mul $t5 $t5 $t4 # C = B * 3
	sll $t6 $t1 1 # D = Mes * 2
	srl $t7 $t2 2 # E = Ano / 4
	addi $t8 $0 100
	div $t8 $t2 $t8
	mflo $t8 # F = Ano / 100
	addi $t9 $0 400
	div $t9 $t2 $t9
	mflo $t9 # G = Ano / 400
	add $t3 $t0 $t6
	add $t3 $t3 $t5
	add $t3 $t3 $t2
	add $t3 $t3 $t7
	sub $t3 $t3 $t8
	add $t3 $t3 $t9
	addi $t3 $t3 2 # H = Dia + D + C + Ano + E - F + G + 2
	addi $t4 $0 7
	div $t3 $t4
	mfhi $a0 
	addi $a0 $a0 1 # Semana = H % 7
	
	# 1 domingo
	# 2 segunda
	# 3 terça
	# 4 quarta
	# 5 quinta
	# 6 sexta
	# 7 sábado
	
pri:	addi $v0 $0 1
	syscall