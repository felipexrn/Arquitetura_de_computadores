.text
# Lê inteiro de 3 algarismos, exibe a soma dos algarismos
main: addi $2, $0, 5 # Lê inteiro
	syscall
	addi $8, $0, 10 # adiciona 10 em $8
	
	div $2, $8 # divide o valor de $2 pelo valor de $8
	mfhi $9 # armazena o valor de Hi em $9 (resto)
	add $4, $4, $9 # soma $9 e $4 e armazena no reg de saída de inteiro
	mflo $2 # armazena o valor de Lo em $2 (quociente)
	
	div $2, $8 # divide o valor de $2 pelo valor de $8
	mfhi $9 # armazena o valor de Hi em $9 (resto)
	add $4, $4, $9 # soma $9 e $4 e armazena no reg de saída de inteiro
	mflo $2 # armazena o valor de Lo em $2 (quociente)
	
	div $2, $8 # divide o valor de $2 pelo valor de $8
	mfhi $9 # armazena o valor de Hi em $9 (resto)
	add $4, $4, $9 # soma $9 e $4 e armazena no reg de saída de inteiro
	mflo $2 # armazena o valor de Lo em $2 (quociente)
	
	addi $2, $0, 1 # exibe valor de $4
	syscall
	
	addi $2, $0, 10 # encerra programa
	syscall
	