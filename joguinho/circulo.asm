.text
main:

# propriedades graficas

	addi $s0 $0 1024 # width
	addi $s1 $0 512 # height
	addi $s2 $0 1 # proporcao
	div $s0 $s2
	mflo $s3 # w
	div $s1 $s2
	mflo $s4 # h
	sll $s3 $s3 2
	sll $s4 $s4 2

# circulos

c1:
	addi $t0 $0 5 # raio
	div $t0 $s2
	mflo $t0
	add $t1 $0 $t0 
	addi $t2 $0 3 # pi
	addi $a0 $0 0x10010000 # inicio
	addi $t4 $0 10 # x
	div $t4 $s2
	mflo $t4
	sll $t4 $t4 2
	addi $t5 $0 75 # y
	div $t5 $s2
	mflo $t5
	mul $t5 $t5 $s0
	
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0xff0000 # cor

	jal circ
	
c2:
	addi $t0 $0 7 # raio
	div $t0 $s2
	mflo $t0
	add $t1 $0 $t0 
	addi $t2 $0 3 # pi
	addi $a0 $0 0x10010000 # inicio
	addi $t4 $0 250 # x
	div $t4 $s2
	mflo $t4
	sll $t4 $t4 2
	addi $t5 $0 125 # y
	div $t5 $s2
	mflo $t5
	mul $t5 $t5 $s0
	
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0x00ff00 # cor

	jal circ

c3:
	addi $t0 $0 3 # raio
	div $t0 $s2
	mflo $t0
	add $t1 $0 $t0 
	addi $t2 $0 3 # pi
	addi $a0 $0 0x10010000 # inicio
	addi $t4 $0 420 # x
	div $t4 $s2
	mflo $t4
	sll $t4 $t4 2
	addi $t5 $0 125 # y
	div $t5 $s2
	mflo $t5
	mul $t5 $t5 $s0
	
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0x0000ff # cor

	jal circ

	j end

circ:
	sw $ra 0($sp)
	addi $sp $sp -4

q4: 
	beq $t1 $0 fimq4
	sub $t3 $t0 $t1 # A = raio - linha
	sll $t3 $t3 1 # B = A * 2
	div $t3 $t2 # C = B MOD 3
	mflo $t3
	mul $t3 $t3 $t3 # D = C**2
	srl $t3 $t3 2 # E = D MOD 4

	sub $a2 $t0 $t3 # tamanho

	jal linhap

	add $t6 $t6 $s3
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
	div $t3 $t2 # C = B MOD 3
	mflo $t3
	mul $t3 $t3 $t3 # D = C**2
	srl $t3 $t3 2 # E = D MOD 4

	sub $a2 $t0 $t3 # tamanho

	jal linhap

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
	div $t3 $t2 # C = B MOD 3
	mflo $t3
	mul $t3 $t3 $t3 # D = C**2
	srl $t3 $t3 2 # E = D MOD 4

	sub $a2 $t0 $t3 # tamanho

	jal linhan

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
	div $t3 $t2 # C = B MOD 3
	mflo $t3
	mul $t3 $t3 $t3 # D = C**2
	srl $t3 $t3 2 # E = D MOD 4

	sub $a2 $t0 $t3 # tamanho

	jal linhan

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

linhap:
	sw $ra 0($sp)
	addi $sp $sp -4
lp:
	beq $a2 $0 fimlp
	sw $a1 0($t6)
	addi $t6 $t6 4
	addi $a2 $a2 -1
	j lp
fimlp: 
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

linhan:
	sw $ra 0($sp)
	addi $sp $sp -4
ln:
	beq $a2 $0 fimln
	sw $a1 0($t6)
	addi $t6 $t6 -4
	addi $a2 $a2 -1
	j ln
fimln: 
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra


end:
	addi $v0 $0 10
	syscall 
