# Faca um programa que leia 3 inteiros correspondentes a um país de registro de um produto;
# 9 inteiros com o código do fabricante do produto e um código de um produto.
# O programa deve imprimir o número do código verificador para um padrão de códigos de barra EAN-13.
.text
main:	addi $a0 $0 0
	addi $t0 $0 3
	addi $t1 $0 10
	
alg12:	addi $v0 $0 5 # A = alg 12 * 1
	syscall
	add $a0 $a0 $v0
	
alg11:	addi $v0 $0 5 # B = alg 11 * 3
	syscall
	mul $v0 $v0 $t0
	add $a0 $a0 $v0 
	
alg10:	addi $v0 $0 5 # C = alg 10 * 1
	syscall
	add $a0 $a0 $v0
	
alg09:	addi $v0 $0 5 # D = alg 09 * 3
	syscall
	mul $v0 $v0 $t0
	add $a0 $a0 $v0
	
alg08:	addi $v0 $0 5 # E = alg 08 * 1
	syscall
	add $a0 $a0 $v0
	
alg07:	addi $v0 $0 5 # F = alg 07 * 3
	syscall
	mul $v0 $v0 $t0
	add $a0 $a0 $v0
	
alg06:	addi $v0 $0 5 # G = alg 06 * 1
	syscall
	add $a0 $a0 $v0
	
alg05:	addi $v0 $0 5 # H = alg 05 * 3
	syscall
	mul $v0 $v0 $t0
	add $a0 $a0 $v0
	
alg04:	addi $v0 $0 5 # I = alg 04 * 1
	syscall
	add $a0 $a0 $v0
	
alg03:	addi $v0 $0 5 # J = alg 03 * 3
	syscall
	mul $v0 $v0 $t0
	add $a0 $a0 $v0
	
alg02:	addi $v0 $0 5 # K = alg 02 * 1
	syscall
	add $a0 $a0 $v0
	
alg01:	addi $v0 $0 5 # L = alg 01 * 3
	syscall
	mul $v0 $v0 $t0
	add $a0 $a0 $v0 # M = A + B + C + D + E + F + G + H + I + J + K + L
	
dig:	div $a0 $t1
	mflo $t2 # N + M % 10
	addi $t2 $t2 1 # O = N + 1
	mul $t2 $t2 $t1 # P = O * 10
	sub $a0 $t2 $a0 # Q = P - M
	div $a0 $t1
	mfhi $a0 # R = Q % 10
	
prn:	addi $v0 $0 1
	syscall
	
end:	addi $v0 $0 10
	syscall