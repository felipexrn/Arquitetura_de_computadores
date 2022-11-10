.text
main:	addi $v0, $0, 5
	syscall
	add $t0, $v0, $0
	addi $v0, $0, 5
	syscall
	add $t1, $v0, $0
	slt $at, $t0, $t1
	beq $at, $0 then
else:	add $a0, $0, $t1
	j pri
then:	add $a0, $0, $t0
pri:	addi $v0, $0, 1
	syscall
end:	addi $v0, $0, 10
	syscall