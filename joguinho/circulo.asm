.text
main:

# propriedades graficas

	addi $s0 $0 1024 # width (pixels)
	addi $s1 $0 512 # height (pixels)
	addi $s2 $0 1 # proporcao
	div $s0 $s2
	mflo $s3
	sll $s3 $s3 2 # w (endereco)
	div $s1 $s2
	mflo $s4
	sll $s4 $s4 2 # h (endereco)

# circulos

c1:
	addi $t0 $0 30 # raio
	div $t0 $s2
	mflo $t0
	add $t1 $0 $t0 
	addi $a0 $0 0x10010000 # inicio
	addi $t4 $0 40 # x (pixels)
	div $t4 $s2
	mflo $t4
	sll $t4 $t4 2 # x (endereco)
	addi $t5 $0 40 # y (pixels)
	div $t5 $s2
	mflo $t5
	mul $t5 $t5 $s3 # y (endereco)
	
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0xff0000 # cor
	addi $t2 $0 580 # PI (excetricidade)

	jal circ
	
c2:
	addi $t0 $0 20 # raio
	div $t0 $s2
	mflo $t0
	add $t1 $0 $t0 
	addi $a0 $0 0x10010000 # inicio
	addi $t4 $0 80 # x (pixels)
	div $t4 $s2
	mflo $t4
	sll $t4 $t4 2 # x (endereco)
	addi $t5 $0 80 # y (pixels)
	div $t5 $s2
	mflo $t5
	mul $t5 $t5 $s3 # y (endereco)
	
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0x00ff00 # cor
	addi $t2 $0 314 # PI (excetricidade)

	jal circ

c3:
	addi $t0 $0 15 # raio
	div $t0 $s2
	mflo $t0
	add $t1 $0 $t0 
	addi $a0 $0 0x10010000 # inicio
	addi $t4 $0 130 # x (pixels)
	div $t4 $s2
	mflo $t4
	sll $t4 $t4 2 # x (endereco)
	addi $t5 $0 60 # y (pixels)
	div $t5 $s2
	mflo $t5
	mul $t5 $t5 $s3 # y (endereco)
	
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0x0000ff # cor
	addi $t2 $0 100 # PI (excetricidade)

	jal circ

	j end
	
# funcao para fazer circulos

circ:
	sw $ra 0($sp)
	addi $sp $sp -4

q4: 
	beq $t1 $0 fimq4
	sub $t3 $t0 $t1 # A = raio - linha
	sll $t3 $t3 1 # B = A * 2
	addi $at $0 100
	mul $t3 $t3 $at
	div $t3 $t2 # C = B MOD 314
	mflo $t3
	mul $t3 $t3 $t3 # D = C**2
	srl $t3 $t3 2 # E = D MOD 4

	sub $a2 $t0 $t3 # tamanho

	jal linhad

	add $t6 $t6 $s3 # endereco += w
	sub $a2 $t0 $t3 
	sll $a2 $a2 2
	sub $t6 $t6 $a2
	addi $t1 $t1 -1
	j q4

fimq4: 
	add $t1 $0 $t0
	add $t6 $0 $a0 # inicio
q1:
	beq $t1 $0 fimq1
	sub $t3 $t0 $t1 # A = raio - linha
	sll $t3 $t3 1 # B = A * 2
	addi $at $0 100
	mul $t3 $t3 $at
	div $t3 $t2 # C = B MOD 314
	mflo $t3
	mul $t3 $t3 $t3 # D = C**2
	srl $t3 $t3 2 # E = D MOD 4

	sub $a2 $t0 $t3 # tamanho

	jal linhad

	sub $t6 $t6 $s3
	sub $a2 $t0 $t3
	sll $a2 $a2 2
	sub $t6 $t6 $a2
	addi $t1 $t1 -1
	j q1

fimq1:
	add $t1 $0 $t0
	add $t6 $0 $a0 # inicio
q2:
	beq $t1 $0 fimq2
	sub $t3 $t0 $t1 # A = raio - linha
	sll $t3 $t3 1 # B = A * 2
	addi $at $0 100
	mul $t3 $t3 $at
	div $t3 $t2 # C = B MOD 314
	mflo $t3
	mul $t3 $t3 $t3 # D = C**2
	srl $t3 $t3 2 # E = D MOD 4

	sub $a2 $t0 $t3 # tamanho

	jal linhae

	sub $t6 $t6 $s3
	sub $a2 $t0 $t3
	sll $a2 $a2 2
	add $t6 $t6 $a2
	addi $t1 $t1 -1
	j q2

fimq2:
	add $t1 $0 $t0
	add $t6 $0 $a0 # inicio
q3: 
	beq $t1 $0 fimq3
	sub $t3 $t0 $t1 # A = raio - linha
	sll $t3 $t3 1 # B = A * 2
	addi $at $0 100
	mul $t3 $t3 $at
	div $t3 $t2 # C = B MOD 314
	mflo $t3
	mul $t3 $t3 $t3 # D = C**2
	srl $t3 $t3 2 # E = D MOD 4

	sub $a2 $t0 $t3 # tamanho

	jal linhae

	add $t6 $t6 $s3
	sub $a2 $t0 $t3
	sll $a2 $a2 2
	add $t6 $t6 $a2
	addi $t1 $t1 -1
	j q3

fimq3:
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

# funcao para fazer linha a direita
linhad:
	sw $ra 0($sp)
	addi $sp $sp -4
ld:
	slt $at $0 $a2
	beq $at $0 fimld
	sw $a1 0($t6)
	addi $t6 $t6 4
	addi $a2 $a2 -1
	j ld
fimld: 
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

# funcao para fazer linha a esquerda
linhae:
	sw $ra 0($sp)
	addi $sp $sp -4
le:	
	slt $at $0 $a2
	beq $at $0 fimle
	sw $a1 0($t6)
	addi $t6 $t6 -4
	addi $a2 $a2 -1
	j le
fimle: 
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra


# fim do programa
end:
	addi $v0 $0 10
	syscall 
