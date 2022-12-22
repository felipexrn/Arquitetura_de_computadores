.text
main: nop

# propriedades graficas
	addi $s0 $0 512 # width
	addi $s1 $0 256 # height
	addi $s2 $0 1 # proporcao
	div $s0 $s2
	mflo $s3 
	div $s1 $s2
	mflo $s4 
	#sll $s3 $s3 2 # w
	#sll $s4 $s4 2 # h

# cenarios
	addi $a1 $0 0 # 1 mapa de bits. 0 funcoes
	beq $a1 $0 cenario1

	addi $a0 $0 1 # numero cenario a ser carregado

loadscreem:
	sll $a0 $a0 2 # byte de memoria
	mul $a1 $s3 $s4 # tamanho da tela
	mul $a0 $a0 $a1 # offset de memoria ate o cenario
	addi $a0 $a0 0x10010000 # endereco inicial do cenario
	lui $a2 0x1001 # inicio da escrita

loadpix:
	beq $a1 $0 fimloadpix
	lw $a3 0($a0) # copia cenario
	sw $a3 0($a2) # escreve cenario
	addi $a0 $a0 4 # prx pixel a ser copiado
	addi $a2 $a2 4 # prx pixel a ser escrito
	addi $a1 $a1 -1 # variavel de iteracao
	j loadpix
fimloadpix:


# fazer aqui funcao para guardar cenario na memoria


	j end

cenario1: # cen�rio 1

ceu:
	addi $a0 $0 0x10010000 # endereco
	addi $a1 $0 0x78d4f9 # RGB 0x ff ff ff cor do ceu
	addi $a2 $0 128 # b
	addi $a3 $0 64 # h
	addi $t0 $0 0 # x
	addi $t1 $0 0 # y
	
	jal ret
	
sol:	addi $t0 $0 7 # raio
	add $t1 $0 $t0 
	addi $t2 $0 3 # pi
	addi $a0 $0 0x10010000 # inicio
	addi $t4 $0 67 # x
	sll $t4 $t4 2
	addi $t5 $0 9 # y
	sll $t5 $t5 9
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0xffff00 # cor

	jal circ

lua:

	addi $t0 $0 6 # raio
	add $t1 $0 $t0 
	addi $t2 $0 3 # pi
	addi $a0 $0 0x10010000 # inicio
	addi $t4 $0 67 # x
	sll $t4 $t4 2
	addi $t5 $0 9 # y
	sll $t5 $t5 9
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0x78d4f9 # cor

	#jal circ
	
nuvens:
	
	addi $t0 $0 40 # x
	addi $t1 $0 9 # y

	jal nuvem
	
	addi $t0 $0 12 # x
	addi $t1 $0 5 # y

	jal nuvem
	
	addi $t0 $0 75 # x
	addi $t1 $0 5 # y

	jal nuvem
	
# desenha o chao

terreno:
	addi $a0 $0 0x10010000 # endereco
	addi $a2 $0 55 # b
	addi $a3 $0 5 # h
	addi $t0 $0 0 # x
	addi $t1 $0 59 # y
	
	jal chao

	addi $a0 $0 0x10010000 # endereco
	addi $a2 $0 55 # b
	addi $a3 $0 5 # h
	addi $t0 $0 65 # x
	addi $t1 $0 59 # y
	
	jal chao
	
	addi $a0 $0 0x10010000 # endereco
	addi $a2 $0 10 # b
	addi $a3 $0 5 # h
	addi $t0 $0 0 # x
	addi $t1 $0 54 # y
	
	jal chao
	
	addi $a0 $0 0x10010000 # endereco
	addi $a2 $0 10 # b
	addi $a3 $0 5 # h
	addi $t0 $0 83 # x
	addi $t1 $0 54 # y
	
	jal chao
	
	addi $a0 $0 0x10010000 # endereco
	addi $a2 $0 45 # b
	addi $a3 $0 4 # h
	addi $t0 $0 40 # x
	addi $t1 $0 32 # y
	
	jal chao
	
	addi $a0 $0 0x10010000 # endereco
	addi $a2 $0 35 # b
	addi $a3 $0 4 # h
	addi $t0 $0 0 # x
	addi $t1 $0 19 # y
	
	jal chao
	
	
	addi $a0 $0 0x10010000 # endereco
	addi $a2 $0 35 # b
	addi $a3 $0 4 # h
	addi $t0 $0 93 # x
	addi $t1 $0 19 # y
	
	jal chao
	
	addi $a0 $0 0x10010000 # endereco
	addi $a2 $0 7 # b
	addi $a3 $0 5 # h
	addi $t0 $0 20 # x
	addi $t1 $0 42 # y
	
	jal chao
	
	addi $a0 $0 0x10010000 # endereco
	addi $a2 $0 7 # b
	addi $a3 $0 5 # h
	addi $t0 $0 93 # x
	addi $t1 $0 42 # y
	
	jal chao

	j end

chao:	
	sw $ra 0($sp)
	addi $sp $sp -4
	
	add $t2 $0 $a2 # b grama
	add $t4 $0 $t0 # x grama
	add $t5 $0 $t1 # y grama
	
	addi $a1 $0 0xe7c278 # RGB 0x ff ff ff cor do ch�o
	
	jal ret
	
	addi $a0 $0 0x10010000 # endereco
	addi $a1 $0 0x21d648 # RGB 0x ff ff ff cor da grama
	add $a2 $0 $t2 # b
	addi $a3 $0 1 # h
	add $t0 $0 $t4 # x
	add $t1 $0 $t5 # y
	
	jal ret	

	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

# funcao que desenha nuvem
nuvem:
	
	sw $ra 0($sp)
	addi $sp $sp -4
	
	add $t5 $0 $t0 # x # 40
	add $t6 $0 $t1 # y # 9
	#addi $a0 $0 0x10010000 # endereco
	
	addi $a0 $0 0x10010000 # endereco
	add $t0 $0 $t5 # x
	add $t1 $0 $t6 # y
	addi $a1 $0 0xffffff # cor
	addi $a2 $0 7 # b
	add $a3 $0 2 # h
	
	jal ret

	addi $a0 $0 0x10010000 # endereco
	addi $t0 $t5 10 # x
	addi $t1 $t6 1 # y
	addi $a1 $0 0xffffff # cor
	addi $a2 $0 6 # b
	add $a3 $0 3 # h
	
	jal ret

	addi $a0 $0 0x10010000 # endereco
	addi $t0 $t5 5 # x
	addi $t1 $t6 -1 # y
	addi $a1 $0 0xffffff # cor
	addi $a2 $0 10 # b
	add $a3 $0 4 # h
	
	jal ret

	addi $a0 $0 0x10010000 # endereco
	addi $t0 $t5 12 # x
	addi $t1 $t6 0 # y
	addi $a1 $0 0xffffff # cor
	addi $a2 $0 8 # b
	add $a3 $0 3 # h
	
	jal ret

	addi $a0 $0 0x10010000 # endereco
	addi $t0 $t5 8 # x
	addi $t1 $t6 -2 # y
	addi $a1 $0 0xffffff # cor
	addi $a2 $0 4 # b
	add $a3 $0 4 # h
	
	jal ret
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	

# funcao para desenhar retangulos
ret:	
	sll $t0 $t0 2 
	add $t0 $t0 $a0 # inicio + x
	sll $t1 $t1 9
	add $t0 $t0 $t1 # inicio + y
	add $a0 $0 $t0 # endereco
	add $t0 $0 $a0 
	add $t1 $0 $a1 # cor
	add $t2 $0 $a2 # b
	add $t3 $0 $a3 # h

laco1:	
	beq $t3 $0 fimret
laco2:	
	beq $t2 $0 fimlaco2
	
	sw $t1 0($t0) # 'pinta' pixel
	addi $t0 $t0 4 # proximo endereco de memoria

	addi $t2 $t2 -1 # x--
	j laco2

fimlaco2:
	add $t0 $t0 $s0 # proxima linha 
	sll $t7 $a2 2 # x * 4 (endereco de mem)
	sub $t0 $t0 $t7 # volta para inicio
	add $t2 $0 $a2 # x = b
	addi $t3 $t3 -1 # y--
	j laco1

fimret:	 
	jr $ra # retorno da funcao


# funcao que desenha circulos

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

	add $t6 $t6 $s0
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

	sub $t6 $t6 $s0
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

	sub $t6 $t6 $s0
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

	add $t6 $t6 $s0
	sub $a2 $t0 $t3
	sll $a2 $a2 2
	add $t6 $t6 $a2
	addi $t1 $t1 -1
	j q3

fimq3:
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

# funcao que desenha linhas a direita

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
	
# funcao que desenha linhas a esquerda

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


# fim do programa

end:
	addi $v0 $0 10
	syscall

