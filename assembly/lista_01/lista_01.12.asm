.text
# lê três inteiros e exibe m�dia ponderada inteira com pesos 3, 9 e 15 sem mul
main: addi $8, $0, 1 # armazena inteiro base para sll em $8
	
	addi $2, $0, 5 # lê inteiro
	syscall
	sll $9, $8, 1 # armazena o descolacamento de 1 bit de $8 pra esquerda em $9
	add $9, $9, $2 # soma valor de $9 e $2
	add $4, $4, $9 # acumula valor de $9 em $4
	
	addi $2, $0, 5 # lê inteiro
	syscall
	sll $9, $8, 3 # armazena o descolacamento de 3 bits de $8 pra esquerda em $9
	add $9, $9, $2 # soma valor de $9 e $2
	add $4, $4, $9 # acumula valor de $9 em $4
	
	addi $2, $0, 5 # lê inteiro
	syscall
	sll $9, $8, 4 # armazena o descolacamento de 4 bits de $8 pra esquerda em $9
	sub $9, $9, $2 # subtrai valor de $9 e $2
	add $4, $4, $9 # acumula valor de $9 em $4
	
	addi $9, $0, 3 # armazena inteiro 3 em $9
	div $4, $9 # divide $4 por $9
	mflo $4 # armazena valor de Lo (inteiro) em $4
	
	addi $2, $0, 1 # imprime inteiro
	syscall
	
	addi $2, $0, 10 # encerra progrmama
	syscall
	