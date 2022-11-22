# *Faça um programa que leia um número escrito em binário (no máximo 8 bits) e
# imprima seu valor em decimal.
.text
main:	addi $v0 $0 5
	syscall
	addi $a0 $0 0
	
bit7:	addi $t0 $0 10000
	addi $t2 $0 1000
	mul $t0 $t0 $t2
	div $v0 $t0
	mfhi $v0
	mflo $t1
	sll $t1 $t1 7
	add $a0 $a0 $t1
	
bit6:	addi $t0 $0 1000
	addi $t2 $0 1000
	mul $t0 $t0 $t2
	div $v0 $t0
	mfhi $v0
	mflo $t1
	sll $t1 $t1 6
	add $a0 $a0 $t1
	
bit5:	addi $t0 $0 1000
	addi $t2 $0 100
	mul $t0 $t0 $t2
	div $v0 $t0
	mfhi $v0
	mflo $t1
	sll $t1 $t1 5
	add $a0 $a0 $t1
	
bit4:	addi $t0 $0 10000
	div $v0 $t0
	mfhi $v0
	mflo $t1
	sll $t1 $t1 4
	add $a0 $a0 $t1
	
bit3:	addi $t0 $0 1000
	div $v0 $t0
	mfhi $v0
	mflo $t1
	sll $t1 $t1 3
	add $a0 $a0 $t1
	
bit2:	addi $t0 $0 100
	div $v0 $t0
	mfhi $v0
	mflo $t1
	sll $t1 $t1 2
	add $a0 $a0 $t1
	
bit1:	addi $t0 $0 10
	div $v0 $t0
	mfhi $v0
	mflo $t1
	sll $t1 $t1 1
	add $a0 $a0 $t1

bit0:	add $a0 $a0 $v0
	
prn:	addi $v0 $0 1
	syscall
	
end:	addi $v0 $0 10
	syscall