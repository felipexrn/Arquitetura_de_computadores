.text
# l� m�s entre 1 e 12 e exibe quantidade de dias do m�s no calend�rio Eduland�s
# at� o m�s 7 todos os meses �mpares tem 31 dias
# ap�s o m�s 7 todos os meses pares tem 31 dias
main: addi $v0, $0, 5 # l� inteiro
	syscall
	addi $t0, $0, 30 # adiciona 30 em $t0
	addi $t1, $0, 8 # adiciona 8 de $t1
	div $v0, $t1 # divide $v0 por $t1 (8)
	mflo $a0 # armazena Lo em $a0
	add $a0, $a0, $v0 # adiciona $v0 em $a0
	andi $a0, $a0, 1 # verifica se � par (se par 0, se �mpar 1)
	addi $a0, $a0, 30 # adiciona 30 em $a0
	
	addi $v0, $0, 1 # imprime inteiro
	syscall

	addi $v0, $0, 10 # encerra programa
	syscall
	
