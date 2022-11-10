.text
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0
	slt $t2 $t0 $t1
	addi $t3 $0 1
	beq $t2 $t3 menor
	beq $t0 $t1 igual
	add $a0 $0 $t0
	addi $v0 $0 1
	syscall
	addi $a0 $0 '>'
	addi $v0 $0 11
	syscall
	add $a0 $0 $t1
	addi $v0 $0 1
	syscall
	j fim
menor:add $a0 $0 $t0
	addi $v0 $0 1
	syscall
	addi $a0 $0 '<'
	addi $v0 $0 11
	syscall
	add $a0 $0 $t1
	addi $v0 $0 1
	syscall
	j fim
igual:add $a0 $0 $t0
	addi $v0 $0 1
	syscall
	addi $a0 $0 '='
	addi $v0 $0 11
	syscall
	add $a0 $0 $t1
	addi $v0 $0 1
	syscall
fim: addi $v0 $0 10
	syscall