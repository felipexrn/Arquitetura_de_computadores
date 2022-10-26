.text
# Lê um caracter minúsculo e exibe o seu equivalente maiúsculo
main: addi $2, $0, 12 # lê caracter
	syscall
	addi $4, $0, 32 # armazena 32 (distância ascii entre caracteres) em $4
	sub $4, $2, $4 # subtrai valores ascii entre carcteres e armazena em $4
	addi $2, $0, 11 # exibe caracter 
	syscall
	addi $2, $0, 10 # encerra programa
	syscall