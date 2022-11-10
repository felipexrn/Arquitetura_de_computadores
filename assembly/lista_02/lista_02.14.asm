.text
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0
	addi $t5 $0 1000
	addi $t6 $0 10
	
et1:	add $t2 $0 $t5
	div $t0 $t2
	mfhi $t0
	mflo $t4
	bne $t3 $0 num1
	beq $t4 $0 esp1
num1:	addi $t3 $0 1
	add $a0 $0 $t4
	addi $v0 $0 1
	syscall
	addi $t7 $0 1
	beq $t5 $t7 pro
	div $t5 $t6
	mflo $t5
	j et1
esp1:	add $a0 $0 ' '
	addi $v0 $0 11
	syscall
	addi $t7 $0 1
	beq $t5 $t7 pro
	div $t5 $t6
	mflo $t5
	j et1

pro:	addi $a0 $0 ','
	addi $v0 $0 11
	syscall 
	addi $t5 $0 1000
	addi $t6 $0 10
	add $t3 $0 $0

et2:	add $t2 $0 $t5
	div $t1 $t2
	mfhi $t1
	mflo $t4
	bne $t3 $0 num2
	beq $t4 $0 esp2
num2:	addi $t3 $0 1
	add $a0 $0 $t4
	addi $v0 $0 1
	syscall
	addi $t7 $0 1
	beq $t5 $t7 fim
	div $t5 $t6
	mflo $t5
	j et2
esp2:	add $a0 $0 ' '
	addi $v0 $0 11
	syscall
	addi $t7 $0 1
	beq $t5 $t7 fim
	div $t5 $t6
	mflo $t5
	j et2

fim:	addi $v0 $0 10
	syscall
