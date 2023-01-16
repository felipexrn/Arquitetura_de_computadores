.text
main: nop

# propriedades graficas
	addi $s0 $0 512 # width
	addi $s1 $0 256 # height
	addi $s2 $0 1 # proporcao
	div $s0 $s2
	mflo $s3 # h
	div $s1 $s2
	mflo $s4 # w
	#sll $s3 $s3 2 # w
	#sll $s4 $s4 2 # h

# cenarios
	
	addi $a0 $0 1 # local a ser guardado o cenario
	jal storescreen
	jal cenario1
	
	addi $a0 $0 2 # local a ser guardado o cenario
	jal storescreen
	jal cenario2
	
	addi $a0 $0 3 # local a ser guardado o cenario
	jal storescreen
	jal cenario3
	
	addi $v0 $0 1
menu:	beq $v0 $0 end
	
	add $v0 $0 5 # escolha o cenario
	syscall
	
	beq $v0 $0 end # encerra programa ao digitar 0

	add $a0 $0 $v0 # numero cenario a ser carregado
	jal loadscreen
	
# animacao de portaand na tela

	addi $t9 $0 42 # x
	addi $s5 $0 27 # y
	addi $t8 $0 70 # fim x
	add $t6 $0 $t9 # variacao de x
animacao1:
	beq $t6 $t8 fimanimacao1
	
	addi $v1 $0 0x10010000 # endereco da escrita
	add $a0 $0 $v1 # endereco
	addi $a1 $0 0xdddddd # RGB 0x ff ff ff cor do ceu
	addi $a2 $0 5 # b
	addi $a3 $0 5 # h
	add $t0 $0 $t6 # x
	add $t1 $0 $s5 # y
	jal portaand
	
	addi $s6 $0 25000 # taxa de atraso
	jal timer
	
	addi $a0 $0 1 # numero cenario a ser carregado o retangulo
	add $t0 $0 $t6 # x
	add $t1 $0 $s5 # y
	addi $t2 $0 5 # b
	addi $t3 $0 5 # h
	jal loadret
	
	addi $t6 $t6 1 # x++
	
	andi $s6 $s5 1
	beq $s6 $0 walk1
	addi $s5 $s5 -1 # y--
	j endwalk1
walk1:	
	addi $s5 $s5 1 # y++
endwalk1:
	j animacao1
	
fimanimacao1:
	j animacao2
	
animacao2:
	beq $t6 $t9 fimanimacao2
	
	addi $v1 $0 0x10010000 # endereco da escrita
	add $a0 $0 $v1 # endereco
	addi $a1 $0 0xdddddd # RGB 0x ff ff ff cor do ceu
	addi $a2 $0 5 # b
	addi $a3 $0 5 # h
	add $t0 $0 $t6 # x
	add $t1 $0 $s5 # y
	jal portaand
	
	addi $s6 $0 25000 # taxa de atraso
	jal timer
	
	addi $a0 $0 1 # numero cenario a ser carregado o retangulo
	add $t0 $0 $t6 # x
	add $t1 $0 $s5 # y
	addi $t2 $0 5 # b
	addi $t3 $0 5 # h
	jal loadret
	
	addi $t6 $t6 -1 # x--

	j animacao2
	
fimanimacao2:
	j animacao1
	 
	j menu

# funcao para carregar cenario na tela

loadscreen:
	sw $ra 0($sp)
	addi $sp $sp -4
	
	sll $a0 $a0 2 # byte de memoria
	mul $a1 $s3 $s4 # tamanho da tela
	mul $a0 $a0 $a1 # offset de memoria ate o cenario
	addi $a0 $a0 0x10010000 # endereco inicial do cenario
	# x inicial
	# y inicial
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
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

# funcao para guardar cenario na memoria

storescreen:
	sw $ra 0($sp)
	addi $sp $sp -4
	
	sll $a0 $a0 2 # byte de memoria
	mul $a1 $s3 $s4 # tamanho da tela
	mul $a0 $a0 $a1 # offset de memoria ate o cenario
	addi $v1 $a0 0x10010000 # endereco da escrita
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
# funcao para carregar um retangulo de cenario na memoria
	
loadret:
	sw $ra 0($sp)
	addi $sp $sp -4
	
	sll $t0 $t0 2 # x inicial a ser carregado
	sll $t1 $t1 9 # y inicial a ser carregado
	sll $a0 $a0 2 # ajuste de byte para origem do carregamento 
	mul $a1 $s3 $s4 # tamanho da tela
	mul $a0 $a0 $a1 # offset de memoria ate o cenario
	addi $a0 $a0 0x10010000 # endereco inicial do cenario
	add $a0 $a0 $t0 # deslocamento x na tela de carregamento
	add $a0 $a0 $t1 # deslocamento y na tela de carregamento
	add $a2 $0 0x10010000 # inicio da escrita
	add $a2 $a2 $t0 # deslocamento x na tela de escrita
	add $a2 $a2 $t1 # deslocamento y na tela de escrita
	add $a1 $0 $t2 # contador de x
	sll $t4 $t2 2 # espaco de memoria a deslocar em x
	addi $t5 $0 1 
	sll $t5 $t5 9 # espaco de memoria a deslocar em y

	
loadpixret1:
	beq $t3 $0 fimloadpixret1
loadpixret2:
	beq $a1 $0 fimloadpixret2
	lw $a3 0($a0) # copia cenario
	sw $a3 0($a2) # escreve cenario
	addi $a0 $a0 4 # prx pixel a ser copiado
	addi $a2 $a2 4 # prx pixel a ser escrito
	addi $a1 $a1 -1 # x--
	j loadpixret2
fimloadpixret2:
	add $a0 $a0 $t5 # proxima linha a ser carregada
	add $a2 $a2 $t5 # proxima linha a ser escrita
	sub $a0 $a0 $t4 # linha a ser carregada - x
	sub $a2 $a2 $t4 # linha a ser escrita - x
	addi $t3 $t3 -1 # y--
	add $a1 $0 $t2 # contador = x
	j loadpixret1
fimloadpixret1:
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra


cenario1: # cenario 1

	sw $ra 0($sp)
	addi $sp $sp -4

ceu1:
	add $a0 $0 $v1 # endereco
	addi $a1 $0 0x78d4f9 # RGB 0x ff ff ff cor do ceu
	addi $a2 $0 128 # b
	addi $a3 $0 64 # h
	addi $t0 $0 0 # x
	addi $t1 $0 0 # y
	
	jal ret
	
sol1:	addi $t0 $0 7 # raio
	add $t1 $0 $t0 
	addi $t2 $0 3 # pi
	add $a0 $0 $v1 # inicio
	addi $t4 $0 67 # x
	sll $t4 $t4 2
	addi $t5 $0 9 # y
	sll $t5 $t5 9
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0xffff00 # cor

	jal circ

lua0:

	addi $t0 $0 6 # raio
	add $t1 $0 $t0 
	addi $t2 $0 3 # pi
	add $a0 $0 $v1 # inicio
	addi $t4 $0 67 # x
	sll $t4 $t4 2
	addi $t5 $0 9 # y
	sll $t5 $t5 9
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0x78d4f9 # cor

	#jal circ
	
nuvens1:
	addi $s5 $0 0xffffff # cor
	
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

terreno1:

	addi $s5 $0 0xe7c278 # RGB 0x ff ff ff cor do chao
	addi $s6 $0 0x21d648 # RGB 0x ff ff ff cor da grama
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 55 # b
	addi $a3 $0 5 # h
	addi $t0 $0 0 # x
	addi $t1 $0 59 # y
	
	jal chao

	add $a0 $0 $v1 # endereco
	addi $a2 $0 55 # b
	addi $a3 $0 5 # h
	addi $t0 $0 65 # x
	addi $t1 $0 59 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 10 # b
	addi $a3 $0 5 # h
	addi $t0 $0 0 # x
	addi $t1 $0 54 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 10 # b
	addi $a3 $0 5 # h
	addi $t0 $0 83 # x
	addi $t1 $0 54 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 45 # b
	addi $a3 $0 4 # h
	addi $t0 $0 40 # x
	addi $t1 $0 32 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 35 # b
	addi $a3 $0 4 # h
	addi $t0 $0 0 # x
	addi $t1 $0 19 # y
	
	jal chao
	
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 35 # b
	addi $a3 $0 4 # h
	addi $t0 $0 93 # x
	addi $t1 $0 19 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 7 # b
	addi $a3 $0 5 # h
	addi $t0 $0 20 # x
	addi $t1 $0 42 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 7 # b
	addi $a3 $0 5 # h
	addi $t0 $0 93 # x
	addi $t1 $0 42 # y
	
	jal chao

	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
cenario2: # cenario 2

	sw $ra 0($sp)
	addi $sp $sp -4

ceu2:
	add $a0 $0 $v1 # endereco
	addi $a1 $0 0x01077a # RGB 0x ff ff ff cor do ceu
	addi $a2 $0 128 # b
	addi $a3 $0 64 # h
	addi $t0 $0 0 # x
	addi $t1 $0 0 # y
	
	jal ret
	
estrelas1:
	add $a0 $0 $v1 # endereco
	addi $t0 $0 2 # x
	addi $t1 $0 2 # y
	addi $a1 $0 0xffff88 # cor
	addi $a2 $0 1 # b
	add $a3 $0 1 # h
	
	jal ret
	
	add $a0 $0 $v1 # endereco
	addi $t0 $0 7 # x
	addi $t1 $0 15 # y
	addi $a1 $0 0xffff88 # cor
	addi $a2 $0 1 # b
	add $a3 $0 1 # h
	
	jal ret
	
	add $a0 $0 $v1 # endereco
	addi $t0 $0 25 # x
	addi $t1 $0 12 # y
	addi $a1 $0 0xffff88 # cor
	addi $a2 $0 1 # b
	add $a3 $0 1 # h
	
	jal ret
	
	add $a0 $0 $v1 # endereco
	addi $t0 $0 115 # x
	addi $t1 $0 25 # y
	addi $a1 $0 0xffff88 # cor
	addi $a2 $0 1 # b
	add $a3 $0 1 # h
	
	jal ret
	
	add $a0 $0 $v1 # endereco
	addi $t0 $0 110 # x
	addi $t1 $0 6 # y
	addi $a1 $0 0xffff88 # cor
	addi $a2 $0 1 # b
	add $a3 $0 1 # h
	
	jal ret
	
	add $a0 $0 $v1 # endereco
	addi $t0 $0 95 # x
	addi $t1 $0 17 # y
	addi $a1 $0 0xffff88 # cor
	addi $a2 $0 1 # b
	add $a3 $0 1 # h
	
	jal ret
	
	add $a0 $0 $v1 # endereco
	addi $t0 $0 37 # x
	addi $t1 $0 35 # y
	addi $a1 $0 0xffff88 # cor
	addi $a2 $0 1 # b
	add $a3 $0 1 # h
	
	jal ret
	
	add $a0 $0 $v1 # endereco
	addi $t0 $0 55 # x
	addi $t1 $0 45 # y
	addi $a1 $0 0xffff88 # cor
	addi $a2 $0 1 # b
	add $a3 $0 1 # h
	
	jal ret
	
	add $a0 $0 $v1 # endereco
	addi $t0 $0 77 # x
	addi $t1 $0 35 # y
	addi $a1 $0 0xffff88 # cor
	addi $a2 $0 1 # b
	add $a3 $0 1 # h
	
	jal ret
	
lua1:	addi $t0 $0 7 # raio
	add $t1 $0 $t0 
	addi $t2 $0 3 # pi
	add $a0 $0 $v1 # inicio
	addi $t4 $0 75 # x
	sll $t4 $t4 2
	addi $t5 $0 15 # y
	sll $t5 $t5 9
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0xffff00 # cor

	jal circ

lua2:

	addi $t0 $0 7 # raio
	add $t1 $0 $t0 
	addi $t2 $0 3 # pi
	add $a0 $0 $v1 # inicio
	addi $t4 $0 78 # x
	sll $t4 $t4 2
	addi $t5 $0 15 # y
	sll $t5 $t5 9
	add $a0 $a0 $t4
	add $a0 $a0 $t5 
	add $t6 $0 $a0 # inicio
	addi $a1 $0 0x01077a # cor

	jal circ
	
nuvens2:
	addi $s5 $0 0xaaaaaa # cor
	
	addi $t0 $0 47 # x
	addi $t1 $0 10 # y

	jal nuvem
	
	addi $t0 $0 17 # x
	addi $t1 $0 4 # y

	jal nuvem
	
	addi $t0 $0 88 # x
	addi $t1 $0 8 # y

	jal nuvem
	
# desenha o chao

terreno2:

	addi $s5 $0 0xa87900 # RGB 0x ff ff ff cor do chao
	addi $s6 $0 0x088000 # RGB 0x ff ff ff cor da grama
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 30 # b
	addi $a3 $0 5 # h
	addi $t0 $0 0 # x
	addi $t1 $0 59 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 15 # b
	addi $a3 $0 5 # h
	addi $t0 $0 45 # x
	addi $t1 $0 59 # y
	
	jal chao

	add $a0 $0 $v1 # endereco
	addi $a2 $0 55 # b
	addi $a3 $0 5 # h
	addi $t0 $0 73 # x
	addi $t1 $0 59 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 10 # b
	addi $a3 $0 5 # h
	addi $t0 $0 0 # x
	addi $t1 $0 54 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 10 # b
	addi $a3 $0 5 # h
	addi $t0 $0 80 # x
	addi $t1 $0 54 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 45 # b
	addi $a3 $0 4 # h
	addi $t0 $0 40 # x
	addi $t1 $0 25 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 35 # b
	addi $a3 $0 4 # h
	addi $t0 $0 0 # x
	addi $t1 $0 40 # y
	
	jal chao
	
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 35 # b
	addi $a3 $0 4 # h
	addi $t0 $0 93 # x
	addi $t1 $0 40 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 7 # b
	addi $a3 $0 5 # h
	addi $t0 $0 45 # x
	addi $t1 $0 54 # y
	
	jal chao
	
	add $a0 $0 $v1 # endereco
	addi $a2 $0 7 # b
	addi $a3 $0 10 # h
	addi $t0 $0 73 # x
	addi $t1 $0 49 # y
	
	jal chao
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

cenario3: # cenario 3

	sw $ra 0($sp)
	addi $sp $sp -4

	
n0:	addi $t8 $0 1 # proporcao
	addi $t5 $0 10 # x
	addi $t6 $0 10 # y
	addi $v1 $v1 0 # inicio
	addi $s5 $0 0xeeeeee # cor
	
	jal numzero
	
n1:	addi $t8 $0 1 # proporcao
	addi $t5 $0 16 # x
	addi $t6 $0 10 # y
	addi $v1 $v1 0 # inicio
	addi $s5 $0 0xeeeeee # cor
	
	jal numum
	
n2:	addi $t8 $0 1 # proporcao
	addi $t5 $0 22 # x
	addi $t6 $0 10 # y
	addi $v1 $v1 0 # inicio
	addi $s5 $0 0xeeeeee # cor
	
	jal numdois
	
n3:	addi $t8 $0 1 # proporcao
	addi $t5 $0 28 # x
	addi $t6 $0 10 # y
	addi $v1 $v1 0 # inicio
	addi $s5 $0 0xeeeeee # cor
	
	jal numtres
	
n8:	addi $t8 $0 1 # proporcao
	addi $t5 $0 34 # x
	addi $t6 $0 10 # y
	addi $v1 $v1 0 # inicio
	addi $s5 $0 0xeeeeee # cor
	
	jal numoito

	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

# funcao desenha chao
chao:	
	sw $ra 0($sp)
	addi $sp $sp -4
	
	add $t2 $0 $a2 # b grama
	add $t4 $0 $t0 # x grama
	add $t5 $0 $t1 # y grama
	
	add $a1 $0 $s5 # RGB 0x ff ff ff cor do chao
	
	jal ret
	
	add $a0 $0 $v1 # endereco
	add $a1 $0 $s6 # RGB 0x ff ff ff cor da grama
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
	
	add $a0 $0 $v1 # endereco
	add $t0 $0 $t5 # x
	add $t1 $0 $t6 # y
	add $a1 $0 $s5 # cor
	addi $a2 $0 7 # b
	add $a3 $0 2 # h
	
	jal ret

	add $a0 $0 $v1 # endereco
	addi $t0 $t5 10 # x
	addi $t1 $t6 1 # y
	add $a1 $0 $s5 # cor
	addi $a2 $0 6 # b
	add $a3 $0 3 # h
	
	jal ret

	add $a0 $0 $v1 # endereco
	addi $t0 $t5 5 # x
	addi $t1 $t6 -1 # y
	add $a1 $0 $s5 # cor
	addi $a2 $0 10 # b
	add $a3 $0 4 # h
	
	jal ret

	add $a0 $0 $v1 # endereco
	addi $t0 $t5 12 # x
	addi $t1 $t6 0 # y
	add $a1 $0 $s5 # cor
	addi $a2 $0 8 # b
	add $a3 $0 3 # h
	
	jal ret

	add $a0 $0 $v1 # endereco
	addi $t0 $t5 8 # x
	addi $t1 $t6 -2 # y
	add $a1 $0 $s5 # cor
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


# funcao que desenha elipses

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

	jal linhad

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

	jal linhad

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

	jal linhae

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

	jal linhae

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

linhad:
	sw $ra 0($sp)
	addi $sp $sp -4
ld:
	beq $a2 $0 fimld
	sw $a1 0($t6)
	addi $t6 $t6 4
	addi $a2 $a2 -1
	j ld
fimld: 
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
# funcao que desenha linhas a esquerda

linhae:
	sw $ra 0($sp)
	addi $sp $sp -4
le:
	beq $a2 $0 fimle
	sw $a1 0($t6)
	addi $t6 $t6 -4
	addi $a2 $a2 -1
	j le
fimle: 
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
#funcoes para desenhar numeros
numeros:
	addi $t8 $0 1 # proporcao
	addi $t5 $0 10 # x
	addi $t6 $0 10 # y
	addi $v1 $v1 0 # inicio
	addi $s5 $0 0xdddddd # cor
	
numzero:	

	sw $ra 0($sp)
	addi $sp $sp -4
	
	jal numum
	
	addi $v0 $0 -2 # x
	mul $v0 $t8 $v0 
	add $t5 $t5 $v0 
	addi $v0 $0 -1 # y
	mul $v0 $t8 $v0 
	add $t6 $t6 $v0
	
	jal traco
	
	addi $v0 $0 0 # x
	mul $v0 $t8 $v0 
	add $t5 $t5 $v0 
	addi $v0 $0 10 # y
	mul $v0 $t8 $v0 
	add $t6 $t6 $v0
	
	jal traco
	
	addi $v0 $0 2 # x
	mul $v0 $t8 $v0 
	add $t5 $t5 $v0 
	addi $v0 $0 -9 # y
	mul $v0 $t8 $v0 
	add $t6 $t6 $v0 
	
	addi $t5 $t5 0 # x
	addi $t9 $0 -6
	mul $t9 $t9 $t8
	add $t5 $t5 $t9
	addi $t6 $t6 0 # y
	
	jal numum

	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
numum:
	sw $ra 0($sp)
	addi $sp $sp -4
	
	addi $t5 $t5 0 # x
	addi $t9 $0 3
	mul $t9 $t9 $t8
	add $t5 $t5 $t9
	addi $t6 $t6 0 # y

	jal barrasup
	
	jal barrainf
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
numdois:

	sw $ra 0($sp)
	addi $sp $sp -4
	
	jal barrainf
	
	addi $v0 $0 1 # x
	mul $v0 $t8 $v0 
	add $t5 $t5 $v0 
	addi $v0 $0 -1 # y
	mul $v0 $t8 $v0 
	add $t6 $t6 $v0
	
	jal traco
	
	addi $v0 $0 0 # x
	mul $v0 $t8 $v0 
	add $t5 $t5 $v0 
	addi $v0 $0 5 # y
	mul $v0 $t8 $v0 
	add $t6 $t6 $v0
	
	jal traco
	
	addi $v0 $0 0 # x
	mul $v0 $t8 $v0 
	add $t5 $t5 $v0 
	addi $v0 $0 5 # y
	mul $v0 $t8 $v0 
	add $t6 $t6 $v0
	
	jal traco
	
	addi $v0 $0 -1 # x
	mul $v0 $t8 $v0 
	add $t5 $t5 $v0 
	addi $v0 $0 -9 # y
	mul $v0 $t8 $v0 
	add $t6 $t6 $v0
	
	addi $t5 $t5 0 # x
	addi $t9 $0 3
	mul $t9 $t9 $t8
	add $t5 $t5 $t9
	addi $t6 $t6 0 # y
	
	jal barrasup
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
numtres:
	sw $ra 0($sp)
	addi $sp $sp -4
	
	jal numum
	
	
	addi $v0 $0 -2 # x
	mul $v0 $t8 $v0 
	add $t5 $t5 $v0 
	addi $v0 $0 -1 # y
	mul $v0 $t8 $v0 
	add $t6 $t6 $v0
	
	jal traco
	
	addi $v0 $0 0 # x
	mul $v0 $t8 $v0 
	add $t5 $t5 $v0 
	addi $v0 $0 5 # y
	mul $v0 $t8 $v0 
	add $t6 $t6 $v0
	
	jal traco
	
	addi $v0 $0 0 # x
	mul $v0 $t8 $v0 
	add $t5 $t5 $v0 
	addi $v0 $0 5 # y
	mul $v0 $t8 $v0 
	add $t6 $t6 $v0
	
	jal traco
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

numquatro:

	sw $ra 0($sp)
	addi $sp $sp -4
	
	
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

numcinco:

	sw $ra 0($sp)
	addi $sp $sp -4
	
	
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
numseis:

	sw $ra 0($sp)
	addi $sp $sp -4
	
	
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

numsete:


	sw $ra 0($sp)
	addi $sp $sp -4
	
	
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
numoito:
	sw $ra 0($sp)
	addi $sp $sp -4
	
	jal numzero
	
	addi $v0 $0 1 # x
	mul $v0 $t8 $v0 
	add $t5 $t5 $v0 
	addi $v0 $0 4 # y
	mul $v0 $t8 $v0 
	add $t6 $t6 $v0
	
	jal traco
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
numnove:	

	sw $ra 0($sp)
	addi $sp $sp -4
	
	
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

# funcoes para desenhar segmentos retos
barrasup:	

	sw $ra 0($sp)
	addi $sp $sp -4

	add $a0 $0 $v1 # endereco
	addi $t0 $t5 0 # x
	addi $t1 $t6 0 # y
	add $a1 $0 $s5 # cor
	addi $a2 $0 1 # b
	mul $a2 $a2 $t8
	add $a3 $0 4 # h
	mul $a3 $a3 $t8
	
	jal ret

	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra


barrainf:

	sw $ra 0($sp)
	addi $sp $sp -4

	add $a0 $0 $v1 # endereco
	addi $t0 $t5 0 # x
	add $t1 $t6 0 # y
	addi $t9 $0 5
	mul $t9 $t9 $t8
	add $t1 $t1 $t9
	addi $a2 $0 1 # b
	mul $a2 $a2 $t8
	add $a3 $0 4 # h
	mul $a3 $a3 $t8
	
	jal ret
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
traco:

	sw $ra 0($sp)
	addi $sp $sp -4

	add $a0 $0 $v1 # endereco
	addi $t0 $t5 0 # x
	addi $t1 $t6 0 # y
	add $a1 $0 $s5 # cor
	addi $a2 $0 2 # b
	mul $a2 $a2 $t8
	add $a3 $0 1 # h
	mul $a3 $a3 $t8
	
	jal ret	
	
	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
# funcoes para desenhar portas lógicas	
portaand:

	sw $ra 0($sp)
	addi $sp $sp -4

	jal ret

	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	
portaor:

	sw $ra 0($sp)
	addi $sp $sp -4


	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra
	

portanot:

	sw $ra 0($sp)
	addi $sp $sp -4


	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

#funcao para passar tempo
timer:	
	sw $ra 0($sp)
	addi $sp $sp -4
	
	add $s6 $s6 $0 # taxa de atraso
	
fortimer:

	beq $s6 $0 fimtimer 
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        addi $s6, $s6, -1
        j fortimer
              
fimtimer:

	addi $sp $sp 4
	lw $ra 0($sp)
	jr $ra

# fim do programa

end:
	addi $v0 $0 10
	syscall

