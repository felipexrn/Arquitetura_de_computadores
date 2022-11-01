.text
# Lê inteiro e exibe o quadrado do valor 
main: addi $2, $0, 5 # l� inteiro
	syscall
	mul $4, $2, $2 # multiplica o valor por ele mesmo e armazena no reg de sa�da de inteiro
	addi $2, $0, 1 # exibe inteiro
	syscall
	addi $2, $0, 10 # encerra programa
	syscall