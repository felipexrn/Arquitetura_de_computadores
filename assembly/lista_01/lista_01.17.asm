.text
# lê 2 inteiros e imprime a média aritimética simples com uma casa decimal
main: addi $9, $0, 2 # armazena valor 2 em $9
	addi $2, $0, 5 # lê inteiro
	syscall
	add $4, $4, $2 # adiciona $2 em $4
	addi $2, $0, 5 # lê inteiro
	syscall
	add $4, $4, $2 # adiciona $2 em $4
	add $8, $0, $4 # armazena $4 em $8
	
	sll $4, $4, 3 # desloca $4 3 bits à esquerda
	sll $8, $8, 1 # desloca $8 1 bit à esquerda
	add $4, $4, $8 # soma os valores de $4 e $8 (x10)
	div $4, $9 # divide $4 por $9
	mflo $4 # armazena Lo (inteiro) em $4
	
	mul $9, $9, 5 # multiplica $9 por 5
	div $4, $9 # divide $4 por $9
	mfhi $8 # armazena Hi (resto) em $8
	mflo $4 # armazena Lo (inteiro) em $4
	
	addi $2, $0, 1 # imprime inteiro
	syscall
	add $4, $0, ',' # armazena ',' em $4
	addi $2, $0, 11 # imprime caracter
	syscall
	add $4, $0, $8 # armazena $8 em $4
	addi $2, $0, 1 # imprime inteiro
	syscall
	
	addi $2, $0, 10 # encerra progrmama
	syscall
