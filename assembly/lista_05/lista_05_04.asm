# Faca um programa que leia um vetor de 10 posições.
# Contar e escrever quantos valores pares ele possui.
.text
main:	lui $t0 0x1001 # aponta para v[0]
	addi $t1 $0 10 # t = 10
	addi $a0 $0 0 # contador de pares
	
for:	beq $t1 $0 prn # t == 0? prn: prox instr
	addi $v0 $0 5
	syscall
	sw $v0 0($t0) # v[i] = $v0
	andi $v0 $v0 1
	bne $v0 $0 rfor # $v0 é par ? rfor: prox instr
	addi $a0 $a0 1 # contador de pares ++
	
rfor:	addi $t0 $t0 4 # i += 1 
	addi $t1 $t1 -1 # t--
	j for

prn:	addi $v0 $0 1
	syscall
	
end:	addi $v0 $0 10
	syscall