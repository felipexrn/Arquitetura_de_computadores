.text
main: addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	addi $t1 $0 4
	div $t0 $t1
	mfhi $t2
	beq $t2 $0 quat
	addi $t1 $0 400
	div $t0 $t1
	mfhi $t2
	beq $t2 $0 bis
	j nbis
quat:	addi $t1 $0 100
	div $t0 $t1
	mfhi $t2
	bne $t2 $0 bis
nbis:	addi $a0 $0 'n'
	addi $v0 $0 11
	syscall
	addi $a0 $0 'ã'
	addi $v0 $0 11
	syscall
	addi $a0 $0 'o'
	addi $v0 $0 11
	syscall
	addi $a0 $0 ' '
	addi $v0 $0 11
	syscall
bis:	addi $a0 $0 'é'
	addi $v0 $0 11
	syscall
	addi $a0 $0 ' '
	addi $v0 $0 11
	syscall
	addi $a0 $0 'b'
	addi $v0 $0 11
	syscall
	addi $a0 $0 'i'
	addi $v0 $0 11
	syscall
	addi $a0 $0 's'
	addi $v0 $0 11
	syscall
	syscall
	addi $a0 $0 'e'
	addi $v0 $0 11
	syscall
	addi $a0 $0 'x'
	addi $v0 $0 11
	syscall
	addi $a0 $0 't'
	addi $v0 $0 11
	syscall
	addi $a0 $0 'o'
	addi $v0 $0 11
	syscall
fim:	add $v0 $0 10
	syscall