.text
# lê 3 inteiros representando hora minutos e segundos e exibe segundos em inteiro 
main: addi $2, $0, 5 # lê inteiro
	syscall
	addi $8, $0, 1 # armazena 1 em $8
	sll  $9, $8, 12 # desloca todos os bits um bit à esquerda e armazena em $9
	sub $9, $9, 496 # subtrai 496 (para 3600) de $9 e armazena em $9
	mul $9, $9, $2 # multiplica $9 e $2 e armazena em $9
	add $4, $4, $9 # soma os valores de $4 e $9 e armazena no reg de sa�da de inteiro
	
	addi $2, $0, 5 # lê inteiro
	syscall
	sll  $9, $8, 6 # desloca todos os bits um bit à esquerda e armazena em $9
	sub $9, $9, 4 # subtrai 4 (para 60) de $9 e armazena em $9
	mul $9, $9, $2 # multiplica $9 e $2 e armazena em $9
	add $4, $4, $9 # soma os valores de $4 e $9 e armazena no reg de sa�da de inteiro
	
	addi $2, $0, 5 # lê inteiro
	syscall
	add $4, $4, $2 # soma os valores de $4 e $2 e armazena no reg de sa�da de inteiro
	
	addi $2, $0, 1 # exibe inteiro armazenado em $4
	syscall
	
	addi $2, $0, 10 # encerra o programa
	syscall
	
