# Faça um programa que calcule e mostre os 10 primeiros números múltiplos de 3
.text
main:	addi $t0 $0 3
	addi $t1 $0 11
	addi $t2 $0 1
	
prn:	mul $a0 $t0 $t2
	addi $v0 $0 1
	syscall
	addi $a0 $0 '\n'
	addi $v0 $0 11
	syscall
	addi $t2 $t2 1
	beq $t1 $t2 end
	j prn
	
end:	addi $v0 $0 10
	syscall
	