# Faça um programa que leia um vetor com 10 posições.
# Em seguida deverá ser impresso o maior e o menor elemento do vetor.
.text
main:	lui $t0 0x1001 # aponta para v[0]
	addi $t1 $0 0 # maior
	addi $t2 $0 0 # menor
	addi $t3 $0 10 # contador = 10
	
do:	addi $v0 $0 5
	syscall
	add $t1 $0 $v0 # inicia maior
	add $t2 $0 $v0 # inicia menor
	sw $v0 0 ($t0) # v[i] = Sv0
	addi $t0 $t0 4 # i += 4
	addi $t3 $t3 -1 # contador --

while:	beq $t3 $0 prn # contador == 0? prn:  prx instr
	addi $v0 $0 5
	syscall
	sw $v0 0 ($t0) # v[i] = Sv0
	addi $t0 $t0 4 # i += 4
	addi $t3 $t3 -1 # contador --

maior:	slt $t4 $t1 $v0 # $v0 >= $t1? 1:0
	beq $t4 $0 menor # maior? prx instr: menor
	add $t1 $0 $v0
	
menor:	slt $t4 $v0 $t2 # $v0 < $t2: 1:0
	beq $t4 $0 while # menor? prx instr: while
	add $t2 $0 $v0 
	j while
	
prn:	add $a0 $0 $t1 
	addi $v0 $0 1
	syscall
	addi $a0 $0 '\n' 
	addi $v0 $0 11
	syscall
	add $a0 $0 $t2 
	addi $v0 $0 1
	syscall

end:	addi $v0 $0 10
	syscall