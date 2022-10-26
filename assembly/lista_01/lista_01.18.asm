.text
# lê 2 inteiros mostra o menor entre eles
main: addi $2, $0, 5 # lê inteiro
	syscall
	add $4, $0, $2 # armazena $2 em $4
	addi $2, $0, 5 # lê inteiro
	syscall
	
	sub $8, $4, $2 # subtrai $2 por $4 e armazena em $8
	srl $9, $8, 31 # desloca $8 31 bits à direita armazena em $9
	addi $10, $0, 1 # armazena 1 em $10
		
	xor $10, $9, $10 # opera XOR entre $9 e $10
	
	mul $9, $4, $9 # multiplica $2 por $9
	mul $10, $2, $10 # multiplica $2 por $10
	add $4, $10, $9 # soma $9 e $10 em $4
	
	addi $2, $0, 1 # imprime inteiro
	syscall
	
	addi $2, $0, 10 # encerra programa
	syscall
