.text
#L� dois inteiros e exibe a multipica��o dos dois valores
main: addi $2, $0, 5 # l� inteiro
	syscall
	add $4, $0, $2 # armazena no reg de sa�da de inteiro 
	addi $2, $0, 5 # l� inteiro
	syscall
	mul $4, $4, $2 # multiplica o primeiro valor com o segundo e armazena no reg de s�ida de inteiro
	addi $2, $0, 1 # exibe inteiro
	syscall
	addi $2, $0, 10 # encerra programa
	syscall
	