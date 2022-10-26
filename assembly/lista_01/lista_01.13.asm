.text
# exibe "Hello World"
main: addi $4, $0, 72 # armazena 'H'
	addi $2, $0, 11 # exibe caracter
	syscall
	
	addi $4, $0, 101 # armazena 'e'
	addi $2, $0, 11 # exibe caracter
	syscall
	
	addi $4, $0, 108 # armazena 'l'
	addi $2, $0, 11 # exibe caracter
	syscall
	
	addi $4, $0, 108 # armazena 'l'
	addi $2, $0, 11 # exibe caracter
	syscall
	
	addi $4, $0, 111 # armazena 'o'
	addi $2, $0, 11 # exibe caracter
	syscall
	
	addi $4, $0, 32 # armazena ' '
	addi $2, $0, 11 # exibe caracter
	syscall
	
	addi $4, $0, 87 # armazena 'W'
	addi $2, $0, 11 # exibe caracter
	syscall
	
	addi $4, $0, 111 # armazena 'o'
	addi $2, $0, 11 # exibe caracter
	syscall
	
	addi $4, $0, 114 # armazena 'r'
	addi $2, $0, 11 # exibe caracter
	syscall
	
	addi $4, $0, 108 # armazena 'l'
	addi $2, $0, 11 # exibe caracter
	syscall
	
	addi $4, $0, 100 # armazena 'd'
	addi $2, $0, 11 # exibe caracter
	syscall

	addi $2, $0, 10 # encerra programa
	syscall
