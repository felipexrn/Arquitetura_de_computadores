# *Dizemos que um número i é congruente módulo m a j se i % m = j % m.
# Exemplo: 35 é congruente módulo 4 a 39, pois 35 % 4 = 3 = 39 % 4.
# Faça um programa que, dados i, j e m, informe se i e j são congruentes módulos m
.text
mian:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0 # I
	
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0 # J
	
	addi $v0 $0 5
	syscall
	add $t2 $0 $v0 # M
	
	div $t0 $t2
	mfhi $t3	# A =  I % M
	div $t1 $t2
	mfhi $t4	# B =  J % M
	
	addi $v0 $0 11 
	
	beq $t3 $t4 cong # I congruente J em M? cong : linha 23
	
	addi $a0 $0 'i'
	syscall
	addi $a0 $0 'n'
	syscall
cong:	addi $a0 $0 'c'
	syscall
	addi $a0 $0 'o'
	syscall
	addi $a0 $0 'n'
	syscall
	addi $a0 $0 'g'
	syscall
	addi $a0 $0 'r'
	syscall
	addi $a0 $0 'u'
	syscall
	addi $a0 $0 'e'
	syscall
	addi $a0 $0 'n'
	syscall
	addi $a0 $0 't'
	syscall
	addi $a0 $0 'e'
	syscall
	addi $a0 $0 '\n'
	syscall
	
end:	addi $v0 $0 10
	syscall
	