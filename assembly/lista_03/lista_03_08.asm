# Faca um programa que leia nï¿½meros inteiros diferentes de zero
# e encontre o menor valor digitado e o maior valor digitado.
# O programa informa o maior e o menor, um em cada linha,
# quando o usuario digitar um 0.
.text
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0 # maior
	add $t1 $0 $v0 # menor
	
maior:	slt $t2 $t0 $v0 # $v0 >= $t0? 1:0
	beq $t2 $0 menor
	add $t0 $0 $v0
	
menor:	slt $t2 $v0 $t1 # $v0 < $t1? 1:0
	beq $t2 $0 while
	add $t1 $0 $v0
	
while:	addi $v0 $0 5 # do while
	syscall
	beq $v0 $0 prn
	j maior
	
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
	
	
