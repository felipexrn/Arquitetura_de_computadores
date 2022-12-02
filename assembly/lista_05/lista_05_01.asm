# Faca um programa que possua um vetor (apelide de A)
# a) Atribua os seguintes valores a esse vetor:
	# 1, 0, 5, -2, -5, 7.
# b) Armazene em uma variável inteira (simples)
	# a soma entre os valores das posições
	# A[0], A[1] e A[5] do vetor
	# e mostre na tela esta soma.
# c) Modifique o vetor na posição 4,
	# atribuindo a esta posição o valor 100.
# d) Mostre na tela cada valor do vetor A, um em cada linha.
.text
main:	lui $t0 0x1001 # int A[];

a:	addi $t1 $0 1 
	sw $t1 0x0($t0) # A[0] = 1
	addi $t1 $0 0 
	sw $t1 0x4($t0) # A[1] = 0
	addi $t1 $0 5 
	sw $t1 0x8($t0) # A[2] = 5
	addi $t1 $0 -2
	sw $t1 0xc($t0) # A[3] = -2
	addi $t1 $0 -5
	sw $t1 0x10($t0) # A[4] = -5
	addi $t1 $0 7
	sw $t1 0x14($t0) # A[5] = 7
	
b:	addi $t1 $0 0 
	sw $t1 0x18($t0) # int soma = 0
	lw $t2 0x0($t0)
	add $t1 $t1 $t2 
	sw $t1 0x18($t0) # soma += A[0]
	lw $t2 0x4($t0)
	add $t1 $t1 $t2 
	sw $t1 0x18($t0) # soma += A[1]
	lw $t2 0x14($t0)
	add $t1 $t1 $t2 
	sw $t1 0x18($t0) # soma += A[5]
	lw $a0 0x18($t0)
	addi $v0 $0 1
	syscall # imprime soma
	addi $v0 $0 11
	addi $a0 $0 '\n'
	syscall # quebra linha
	
c:	addi $t1 $0 100
	sw $t1 0x10($t0) # A[4] = 100
	
d:	addi $t2 $0 6 # int t = 0
	addi $t3 $0 0 # int i = 0
for:	beq $t2 $t3 end # t==i? end: prox instr
		addi $v0 $0 1
		lw $a0 0($t0)
		syscall # imprime A[i]
		addi $v0 $0 11
		addi $a0 $0 '\n'
		syscall # quebra linha
		addi $t0 $t0 4 # avança ponteiro 4 bytes
		addi $t3 $t3 1 # i++
		j for
end:	addi $v0 $0 10
	syscall