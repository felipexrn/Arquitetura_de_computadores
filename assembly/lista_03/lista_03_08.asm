# Faça um programa que leia números inteiros diferentes de zero
# e encontre o menor valor digitado e o maior valor digitado.
# O programa informa o maior e o menor, um em cada linha,
# quando o usuário digitar um 0.
.text
main:	addi $t0 $0 0 # maior
	addi $t1 $0 0 # menor
	
while:	addi $v0 $0 5
	syscall
	beq $v0 $0 prn
	
maior:	slt $t2 $v0 $t0 # $t0 >= $v0? 1:0
	beq $t0 $0 menor
	add $t0 $0 $v0
	
menor:	slt $t2 $v0 $t1 # $v0 < $t1? 1:0
	beq $t1 $0 while
	add $t1 $0 $v0
	j while
	
prn:	add $a0 $0 $t0
	addi $v0 $0 1
	syscall
	
	addi $a0 $0 '\n'
	addi $v0 $0 11
	syscall
	
	add $a0 $0 $t1
	addi $v0 $0 1
	syscall

end:	addi $v0 $0 10
	syscall
	
	