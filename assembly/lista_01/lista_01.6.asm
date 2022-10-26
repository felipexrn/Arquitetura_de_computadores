.text
# Lê inteiro de 3 algarismos e exibe inteiro com 3 algarismos com zeros completando espaços vazios
main: addi $2, $0, 5 # lê inteiro
	syscall
	addi $8, $0, 10 # armazena 10 em $8
	
	div $2, $8 # divide o valor de $2 pelo valor de $8
	mfhi $9 # armazena o valor de Hi em $4 (resto)
	mflo $2 # armazena o valor de Lo em $2 (inteiro)
	
	div $2, $8 # divide o valor de $2 pelo valor de $8
	mfhi $10 # armazena o valor de Hi em $4 (resto)
	mflo $2 # armazena o valor de Lo em $2 (inteiro)
	
	div $2, $8 # divide o valor de $2 pelo valor de $8
	mfhi $4 # armazena o valor de Hi em $4 (resto)
	addi $2, $0, 1 # exibe valor de $4
	syscall
	mflo $2 # armazena o valor de Lo em $2 (inteiro)
	
	add $4, $0, $10 # adiciona $11 em $4 
	addi $2, $0, 1 # exibe valor de $4
	syscall
	
	add $4, $0, $9 # adiciona $11 em $4 
	addi $2, $0, 1 # exibe valor de $4
	syscall
	
	addi $2, $0, 10 # encerra programa
	syscall
	 
