.data
.word 'O', 'l', 'a', ' ', 'm', 'u', 'n', 'd', 'o', '!', '\n', 0
.text
main:	addi $v0 $0 11
	lui $t0 0x1001
	
while:	lw $a0 0($t0)
	beq $a0 $0 end
	syscall
	addi $t0 $t0 4
	j while
	
end: 	addi $v0 $0 10
	syscall