.text
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	
et1:	addi $t1 $0 1000
	div $t0 $t1
	mfhi $t0
	mflo $t3
	bne $t2 $0 num1
	beq $t3 $0 esp1
num1:	addi $t2 $0 1
	add $a0 $0 $t3
	addi $v0 $0 1
	syscall
	j et2
esp1:	add $a0 $0 ' '
	addi $v0 $0 11
	syscall
	
et2:	addi $t1 $0 100
	div $t0 $t1
	mfhi $t0
	mflo $t3
	bne $t2 $0 num2
	beq $t3 $0 esp2
num2:	addi $t2 $0 1
	add $a0 $0 $t3
	addi $v0 $0 1
	syscall
	j et3
esp2:	add $a0 $0 ' '
	addi $v0 $0 11
	syscall
	
et3:	addi $t1 $0 10
	div $t0 $t1
	mfhi $t0
	mflo $t3
	bne $t2 $0 num3
	beq $t3 $0 esp3
num3:	addi $t2 $0 1
	add $a0 $0 $t3
	addi $v0 $0 1
	syscall
	j et4
esp3:	add $a0 $0 ' '
	addi $v0 $0 11
	syscall
	
et4:	addi $t1 $0 1
	div $t0 $t1
	mfhi $t0
	mflo $t3
	bne $t2 $0 num4
	beq $t3 $0 esp4
num4:	addi $t2 $0 1
	add $a0 $0 $t3
	addi $v0 $0 1
	syscall
	j fim
esp4:	add $a0 $0 ' '
	addi $v0 $0 11
	syscall
	
fim:	addi $v0 $0 10
	syscall