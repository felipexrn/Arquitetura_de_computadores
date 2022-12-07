# Escreva um programa que leia um número inteiro
# positivo n e em seguida imprima n linhas
# do chamado Triangulo de Floyd.
# Por exemplo, para n = 6, temos:
# 1
# 2 3
# 4 5 6
# 7 8 9 10
# 11 12 13 14 15
# 16 17 18 19 20 21
.text
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0 # Numero = 6
	addi $t1 $0 1 # Valor
	addi $t2 $0 1 # Colunas
	
laco1:	beq $t0 $0 end
	
	addi $t3 $0 0 # i = 0

laco2:	beq $t3 $t2 quebra # i vezes
	add $a0 $0 $t1 # imprimrir valor
	addi $v0 $0 1
	syscall
	
	addi $a0 $0 ' ' # imprime espaço
	addi $v0 $0 11
	syscall
	
	addi $t1 $t1 1 # valor++
	addi $t3 $t3 1 # i++
	j laco2
	
quebra:	addi $a0 $0 '\n' # quebra linha
	addi $v0 $0 11
	syscall
	
	addi $t2 $t2 1 # colunas++
	addi $t0 $t0 -1 # Numeros--
	j laco1
	
end:	addi $v0 $0 10
	syscall
	
