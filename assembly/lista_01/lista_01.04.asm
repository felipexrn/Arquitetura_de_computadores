.text
# lê dois inteiros e exibe a média ponderada do IFRN inteira entre eles
main: addi $2, $0, 5 # lê inteiro e armazena no reg de leitura de inteiro
	syscall
	add $4, $0, $2 # armazena o valor lido no reg de saída de inteiro
	addi $2, $0, 5 # lê inteiro e armazena no reg de leitura de inteiro
	syscall
	add $8, $0, $2 # armazena o valor de $2 em $8
	sll $2, $2, 1 # desloca 1 bit de $2 pra esquerda
	add $2, $2, $8 # soma os valores de $8 e $2 e armazena em $2
	sll $4, $4, 1 # desloca todos os bits de $2 1 bit pra esquerda
	add $4, $4, $2 # soma os valores de $2 e $4 no reg de sa�da de inteiro
	addi $9, $0, 5 # adiciona o valor 5 no $9
	div $4, $9 # divide do valor de $4 por $9
	mflo $4 # armazena o valor de Lo no reg de saída de inteiro
	addi $2, $0, 1 # exibe inteiro armazenado em $4
	syscall
	addi $2, $0, 10 # encerra progrmama
	syscall
