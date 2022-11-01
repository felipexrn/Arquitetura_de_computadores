.text
# Lê inteiro de 4 digitos e exibe o n�mero substituindo zeros por ' '.
main: addi $v0, $0, 5 # lê inteiro
	syscall
	addi $t0, $0, 10 # Armazena o valor base 10 para decomposição de algarismos em $t0
	addi $t1, $0, ' ' # armazena ' ' = 32 em $t1
	addi $t2, $0, -1 # armazena -1 em $t2
			
	div $v0, $t0 # divide $v0 por $t0 (decomp�e por 10)
	mflo $v0 # armazena o valor de Lo (inteiro) em $v0
	mfhi $t3 # armazena o valor de Hi (resto) em $t3
	mul $t4, $t3, $t2 # multiplica $t3 por -1(inverte o valor) armazena em $t4
	srl $t4, $t4, 31 # desloca $t4 em 31 bits (se $t4  > 0, resta 1, se n�o, resta 0) 
	xori $t4, $t4, 1 # opera XOR entre $t4 e 1 (0 vira 1 ou 1 vira 0)
	mul $t4, $t4, $t1 # multiplica $t1 e $t4 (multiplica por 1 ou 0)
alg1:	add $t3, $t3, $t4 # adiona $t4 em $t3 (32 se $v0 = 0, Hi se $v0 > 0)
	
	div $v0, $t0 # divide $v0 por $t0 (decompõe por 10)
	mflo $v0 # armazena o valor de Lo (inteiro) em $v0
	mfhi $t5 # armazena o valor de Hi (resto) em $t5
	mul $t4, $t5, $t2 # multiplica $t5 por -1(inverte o valor) armazena em $t4
	srl $t4, $t4, 31 # desloca $t4 em 31 bits (se $t4  > 0, resta 1, se n�o, resta 0) 
	xori $t4, $t4, 1 # opera XOR entre $t4 e 1 (0 vira 1 ou 1 vira 0)
	mul $t4, $t4, $t1 # multiplica $t1 e $t4 (multiplica por 1 ou 0)
alg2:	add $t5, $t5, $t4 # adiona $t4 em $t5 (32 se $v0 = 0, Hi se $v0 > 0)

	div $v0, $t0 # divide $v0 por $t0 (decompõe por 10)
	mflo $v0 # armazena o valor de Lo (inteiro) em $v0
	mfhi $t6 # armazena o valor de Hi (resto) em $t6
	mul $t4, $t6, $t2 # multiplica $t6 por -1(inverte o valor) armazena em $t4
	srl $t4, $t4, 31 # desloca $t4 em 31 bits (se $t4  > 0, resta 1, se n�o, resta 0) 
	xori $t4, $t4, 1 # opera XOR entre $t4 e 1 (0 vira 1 ou 1 vira 0)
	mul $t4, $t4, $t1 # multiplica $t1 e $t4 (multiplica por 1 ou 0)
alg3:	add $t6, $t6, $t4 # adiona $t4 em $t6 (32 se $v0 = 0, Hi se $v0 > 0)
	
	div $v0, $t0 # divide $v0 por $t0 (decompõe por 10)
	mflo $v0 # armazena o valor de Lo (inteiro) em $v0
	mfhi $t7 # armazena o valor de Hi (resto) em $t7
	mul $t4, $t7, $t2 # multiplica $t7 por -1(inverte o valor) armazena em $t4
	srl $t4, $t4, 31 # desloca $t4 em 31 bits (se $t4  > 0, resta 1, se n�o, resta 0) 
	xori $t4, $t4, 1 # opera XOR entre $t4 e 1 (0 vira 1 ou 1 vira 0)
	mul $t4, $t4, $t1 # multiplica $t1 e $t4 (multiplica por 1 ou 0)
alg4:	add $t7, $t7, $t4 # adiona $t4 em $t7 (32 se $v0 = 0, Hi se $v0 > 0)
	
	sub $t8, $t7, $t1 # subtrai 32 do algarismo (se $t7 < 32, $t8 < 0, $t8 == 0)
	srl $t8, $t8, 31 # desloca $t8 31 bits à direita (se algarismo > 0, resta 1, se não, resta 0)
	xori $t8, $t8, 1 # opera XOR entre $t8 e 1 (0 vira 1 ou 1 vira 0)
	mul $t8, $t8, $t0 # (multiplica por 10) 
	addi $t8, $t8, 1 # adiciona 1 a $t8 (se algarismo > 0, 1, se não 11) 
	add $a0, $0, $t7 # (4º algarismo)
	add $v0, $0, $t8 # imprime $a0
	syscall
	
	sub $t8, $t6, $t1 # subtrai 32 do algarismo (se $t6 < 32, $t8 < 0, $t8 == 0)
	srl $t8, $t8, 31 # desloca $t8 31 bits à direita (se algarismo > 0, resta 1, se n�o, resta 0)
	xori $t8, $t8, 1 # opera XOR entre $t8 e 1 (0 vira 1 ou 1 vira 0)
	mul $t8, $t8, $t0 # (multiplica por 10) 
	addi $t8, $t8, 1 # adiciona 1 a $t8 (se algarismo > 0, 1, se não 11) 
	add $a0, $0, $t6 # (3º algarismo)
	add $v0, $0, $t8 # imprime $a0
	syscall
	
	sub $t8, $t5, $t1 # subtrai 32 do algarismo (se $t5 < 32, $t8 < 0, $t8 == 0)
	srl $t8, $t8, 31 # desloca $t8 31 bits à direita (se algarismo > 0, resta 1, se não, resta 0)
	xori $t8, $t8, 1 # opera XOR entre $t8 e 1 (0 vira 1 ou 1 vira 0)
	mul $t8, $t8, $t0 # (multiplica por 10) 
	addi $t8, $t8, 1 # adiciona 1 a $t8 (se algarismo > 0, 1, se não 11) 
	add $a0, $0, $t5 # (2º algarismo)
	add $v0, $0, $t8 # imprime $a0
	syscall
	
	sub $t8, $t3, $t1 # subtrai 32 do algarismo (se $t3 < 32, $t8 < 0, $t8 == 0)
	srl $t8, $t8, 31 # desloca $t8 31 bits à direita (se algarismo > 0, resta 1, se não, resta 0)
	xori $t8, $t8, 1 # opera XOR entre $t8 e 1 (0 vira 1 ou 1 vira 0)
	mul $t8, $t8, $t0 # (multiplica por 10) 
	addi $t8, $t8, 1 # adiciona 1 a $t8 (se algarismo > 0, 1, se não 11) 
	add $a0, $0, $t3 # (1º algarismo)
	add $v0, $0, $t8 # imprime $a0
	syscall
	
	addi $v0, $0, 10 # encerra programa
	syscall
