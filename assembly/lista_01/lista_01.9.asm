.text
# Lê segundos inteiros e exibe hora no formato h:m:s
main: addi $2, $0, 5 # lê inteiro
	syscall
	addi $8, $0, 58 # armazena valor dec ascii de ':' em $8
	addi $9, $0, 60 # armazena unidade de tempo em $9
	
	div $2, $9 # divide $2 por $9
	mfhi $10 # armazena valor de Hi (resto) em $10 (segundos)
	mflo $11 # armazena valor de Lo (inteiro) em $11 (minutos)
	add $2, $0 ,$11 # armazena o valor de $11 (inteiro) em $2
	div $2, $9 # divide $2 por $9
	mfhi $11 # armazena valor de Hi (resto) em $11 (minutos)
	mflo $12 # armazena valor de Lo (inteiro) em $12 (horas)
	
	add $4, $0, $12 # horas
	addi $2, $0, 1 # exibe $4
	syscall
	add $4, $0, $8 # ':'
	addi $2, $0, 11 # exibe caracter em $4
	syscall
	add $4, $0, $11 # minutos
	addi $2, $0, 1 # exibe $4
	syscall
	add $4, $0, $8 # ':'
	addi $2, $0, 11 # exibe caracter em $4
	syscall
	add $4, $0, $10 # segundos
	addi $2, $0, 1 # exibe $4
	syscall
	
	addi $2, $0, 10 #encerra programa
	syscall