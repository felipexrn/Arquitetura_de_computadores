.text
# Lê inteiro, exibe dobro do valor 
main: addi $2, $0, 5 # Lê inteiro
	syscall
	add $4, $0, $2 # armazena valor lido no reg de saída de inteiro
	sll $4, $4, 1 # desloca 1 bit à esquerda
	addi $2, $0, 1 # exibe inteiro
	syscall
	addi $2, $0, 10 # encerra programa
	syscall
