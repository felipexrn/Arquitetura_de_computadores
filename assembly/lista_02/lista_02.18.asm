# lê numero inteiro de 3 cadas decimais exibe binário
.text
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	
menmil:	add $t1 $0 1000
	slt $t1 $v0 $t1
	beq $t1 $0 end	
	
	srl $a0 $t0 31
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 30
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 29
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 28
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 27
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 26
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 25
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 24
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 23
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 22
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 21
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 20
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 19
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 18
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 17
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 16
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 15
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 14
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 13
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 12
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 11
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 10
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 9
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 8
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 7
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 6
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 5
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 4
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 3
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 2
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 1
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
	srl $a0 $t0 0
	andi $a0 $a0 1
	addi $v0 $0 1
	syscall
	
end:	addi $v0 $0 10
	syscall