.text
# lê um inteiro e imprime -1 se ímpar e 0 se par
main: addi $2, $0, 5 # lê inteiro
	syscall
	andi $4, $2, 1 # verifica se $2 é par 
	addi $8, $0, 1 # armazena 1 em $8
	not $4, $4 # nega $4 (inverte valor)
	add $4, $4, $8 # soma $4 e $8 (soma 1)
	
	addi $2, $0, 1 # imprime inteiro
	syscall
	
	addi $2, $0, 10 # encerra programa
	syscall
