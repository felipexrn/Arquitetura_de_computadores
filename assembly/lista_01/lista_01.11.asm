.text
# Lê um inteiro de 3 algarismos e exibe os algarismos invertidos
main: addi $2, $0, 5 # lê inteiro
	syscall
	addi $8, $0, 10 # armazena base 10 em $8
	
	div $2, $8 # divide inteiro em $2 por 10 em $8 
	mfhi $4 # armazena valor de Hi (resto) em $4
	addi $2, $0, 1 #exibe inteiro
	syscall
	mflo $2 # armazena valor de Lo (inteiro) em $2
	
	div $2, $8 # divide inteiro em $2 por 10 em $8 
	mfhi $4 # armazena valor de Hi (resto) em $4
	addi $2, $0, 1 #exibe inteiro
	syscall
	mflo $2 # armazena valor de Lo (inteiro) em $2
	
	div $2, $8 # divide inteiro em $2 por 10 em $8 
	mfhi $4 # armazena valor de Hi (resto) em $4
	addi $2, $0, 1 #exibe inteiro
	syscall
	
	add $2, $0, $8 # encerra programa
	syscall