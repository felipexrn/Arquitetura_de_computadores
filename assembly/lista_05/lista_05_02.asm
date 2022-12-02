# Crie um programa que lê 6 valores inteiros
# e, em seguida, mostre na tela os valores lidos.
.text
main:	lui $t0 0x1001 # aposta para V[0]
	addi $t1 $0 6 # t = 6
while:	beq $t1 $0 prn # t == 0? prn: prox instr 
	addi $v0 $0 5
	syscall
	sw $v0 0 ($t0)
	addi $t0 $t0 4
	addi $t1 $t1 -1
	j while
prn:	lui $t0 0x1001 # aponta para V[0]
	addi $t1 $0 6 # t = 6
while2:	beq $t1 $0 end # t == 0? prn: prox instr
	lw $a0 0($t0)
	addi $v0 $0 1
	syscall
	add $a0 $0 ' '
	addi $v0 $0 11
	syscall
	addi $t0 $t0 4
	addi $t1 $t1 -1
	j while2
	
end:	addi $v0 $0 10
	syscall		