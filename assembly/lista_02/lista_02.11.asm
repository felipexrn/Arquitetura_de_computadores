.text
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0
	addi $v0 $0 5
	syscall
	add $t2 $0 $v0
	
	slt $t3 $t1 $t0
	slt $t4 $t1 $t2
	xor $t5 $t3 $t4
	bne $t5 $0 n
	
	slt $t6 $t0 $t1
	slt $t7 $t2 $t1
	xor $t8 $t6 $t7
	bne $t8 $0 n
	
	bne $t0 $t1 p
	bne $t1 $t2 p
	j n
			
p:	add $a0 $0 'P'
	add $v0 $0 11
	syscall
	beq $t3 $0 negat
	add $a0 $0 '-'
	j pri1
negat:	add $a0 $0 '+'
pri1:	add $v0 $0 11
	syscall
	j fim
n:	add $a0 $0 'N'
pri2:	add $v0 $0 11
	syscall
fim:	addi $v0 $0 10
	syscall