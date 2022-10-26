.text
# Lê inteiro exibe 1 se impar e zero se par
main: addi $2, $0, 5 # lê inteiro
	syscall
	addi $8, $0, 2 # armazena 2 em $8 
	div $2, $8 # divide $2 por $8
	mfhi $4 # armazena Hi (resto) em $4
	addi $2, $0, 1 # imprime inteiro
	syscall
	addi $2, $0, 10 # encerra programa
	syscall