# programa com funcao para desenhar elipses
.text
main:
# propriedades graficas
	addi $t0 $0 1024 # width tela
	addi $t1 $0 512 # height tela
	addi $t2 $0 1 # proporcao pixels
#ajuste de proporcao
	div $t0 $t2
	mflo $t0 
	div $t1 $t2
	mflo $t1 
	sll $t0 $t0 2
	sll $t1 $t1 2
	
# teste de resolucao	
	addi $at $0 0
	beq $at $0 continue
	
	add $t3 $0 $t0 # w
	add $t4 $0 $t1 # h
	addi $t5 $0 0x10010000
	addi $t6 $0 0x000000
	
s1: 	
	beq $t3 $0 fims1
s2:	
	beq $t4 $0 fims2 
	sw $t6 0($t5)
	addi $t4 $t4 -1
	addi $t5 $t5 4
	j s2
fims2:	
	addi $t3 $t3 -1
	add $t4 $0 $t1
	andi $t7 $t3 1
	bne $t7 $0 imp
	addi $t6 $t6 0x010101
imp:
	j s1
fims1:
	addi $t5 $t5 -4
	add $t6 $0 0xff0000
	sw $t6 0($t5)
	j end
	
continue:	
	
	
# parametros da funcao circ1
	lui $a0 0x1001 # endereco inicial do centro

	addi $t3 $0 150 # x (deslocamento no eixo x a partir do inicio)
	addi $t4 $0 20 # y (deslocamento no eixo y a partir do inicio)
	sll $t5 $t3 2 # x * 4 (x memorias) 
	add $a0 $a0 $t5 # deslocamento do inicio por x
	mul $t5 $t4 $t0 # y * width
	add $a0 $a0 $t5 # deslocamento do inicio por y

	addi $a1 $0 0xff0000 # cor do circulo
	addi $a2 $0 50 # raio do circulo

	jal elip # chama funcao circ

# parametros da funcao circ2
	lui $a0 0x1001 # endereco inicial do centro

	addi $t3 $0 100 # x (deslocamento no eixo x a partir do inicio)
	addi $t4 $0 100 # y (deslocamento no eixo y a partir do inicio)
	sll $t5 $t3 2 # x * 4 (x memorias) 
	add $a0 $a0 $t5 # deslocamento do inicio por x
	mul $t5 $t4 $t0 # y * width
	add $a0 $a0 $t5 # deslocamento do inicio por y

	addi $a1 $0 0x00ff00 # cor do circulo
	addi $a2 $0 16 # raio do circulo

	jal elip # chama funcao circ

# parametros da funcao circ3
	lui $a0 0x1001 # endereco inicial do centro

	addi $t3 $0 25 # x (deslocamento no eixo x a partir do inicio)
	addi $t4 $0 15 # y (deslocamento no eixo y a partir do inicio)
	sll $t5 $t3 2 # x * 4 (x memorias) 
	add $a0 $a0 $t5 # deslocamento do inicio por x
	mul $t5 $t4 $t0 # y * width
	add $a0 $a0 $t5 # deslocamento do inicio por y

	addi $a1 $0 0x0000ff # cor do circulo
	addi $a2 $0 25 # raio do circulo

	jal elip # chama funcao circ

	j end

# funcao para desenhar circulo
elip:
	sw $ra 0($sp) # guarda retorno na pilha
	addi $sp $sp -4 # aponta para proximo na pilha
	add $s0 $0 $a0 # endereco inicial
	add $t5 $0 $a2 # r = raio
	addi $t6 $0 -1 # i = 1

q4:
	slt $t7 $0 $t5 # r < 0? 0:1
	beq $t7 $0 fimq4 # while r >=0
	addi $s1 $0 4 # orientacao da linha 

	jal linha # chama funcao linha


	add $t5 $t5 $t6 # r-= i
	addi $t6 $t6 -2 # i += 2
	add $s0 $s0 $t0 # prx linha
	j q4
fimq4:
	add $s0 $0 $a0 # endereco inicial
	add $t5 $0 $a2 # r = raio
	addi $t6 $0 1 # i = 1
	sub $s0 $s0 $t0 # linha ant

q1:
	slt $t7 $0 $t5 # r < 0? 0:1
	beq $t7 $0 fimq1 # while r >=0 
	addi $s1 $0 4 # orientacao da linha 

	jal linha # chama funcao linha

	add $t5 $t5 $t6 # r-= i
	addi $t6 $t6 -2 # i += 2
	sub $s0 $s0 $t0 # linha ant
	j q1
fimq1:
	add $s0 $0 $a0 # endereco inicial
	add $t5 $0 $a2 # r = raio
	addi $t6 $0 1 # i = 1
	sub $s0 $s0 $t0 # linha ant

q2:
	slt $t7 $0 $t5 # r < 0? 0:1
	beq $t7 $0 fimq2 # while r >=0 
	addi $s1 $0 -4 # orientacao da linha 

	jal linha # chama funcao linha

	add $t5 $t5 $t6 # r-= i
	addi $t6 $t6 -2 # i += 2
	sub $s0 $s0 $t0 # linha ant

	j q2
fimq2:
	add $s0 $0 $a0 # endereco inicial
	add $t5 $0 $a2 # r = raio
	addi $t6 $0 1 # i = 1
	sub $s0 $s0 $t0 # linha ant
	#sub $s0 $s0 $t0 # linha ant

q3:
	slt $t7 $0 $t5 # r < 0? 0:1
	beq $t7 $0 fimq3 # while r >=0 
	addi $s1 $0 -4 # orientacao da linha  

	jal linha # chama funcao linha

	add $t5 $t5 $t6 # r-= i
	addi $t6 $t6 -2 # i += 2
	add $s0 $s0 $t0 # linha ant

	j q3
fimq3:

	addi $sp $sp 4 # apaga topo da pilha
	lw $ra 0($sp) # carrega topo da pilha
	jr $ra # retorna para end no topo pilha


# funcao desenha linha
linha:
	sw $ra 0($sp) # guarda retorno na pilha
	addi $sp $sp -4 # aponta para proximo na pilha
	add $t8 $0 $t5 # l = tamanho linha
	add $t9 $0 $s0 # endereco inicial
	add $s1 $0 $s1 # orientacao
	
l:
	beq $t8 $0 fiml # while l > 0
	sw $a1 0($t9) # 'pinta' pixel
#addi $a1 $a1 4 # gradiente de cores
	add $t9 $t9 $s1 # endereco += orientacao
	addi $t8 $t8 -1 # l--
	j l
fiml:
	addi $sp $sp 4 # apaga topo da pilha
	lw $ra 0($sp) # carrega topo da pilha
	jr $ra # retorna para o end no topo da pilha

end:
	addi $v0 $0 10
	syscall
