# para ver o display grafico no mars:
# acesse o menu tools e escolha bitmap display

# para um bom resultado este programa deve usar:
# resolucao 512 x 256
# proporcao 4x4

# este programa desenha um ceu, um chao e retangulos variados com a funcao ret
# a funcao ret recebe os seguintes parametros:
# endereco inicial em $a0
# cordenada x em $t0
# coorndenada y em $t1
# cor em $a1
# tamanho da base em $a2
# tamanho da altura em $a3

# para encontrar cores busque por seletor de cores no google
# estudem funcoes e lacos

.text
# desenha o ceu com laco e acesso a memoria
main:	lui $t0 0x1001 # endereço inicial
	addi $t1 $0 0x78d4e7 # RGB     0x ff ff ff
	sw $t1 0($t0) # 'pinta' pixel
	addi $t2 $0 8192 # t (tamanho da tela) 
		
tela:	beq $t2 $0 chao # while t > 0
	sw $t1 0($t0) # 'pinta' pixel
	addi $t0 $t0 4 # proximo endereco de memoria
	addi $t2 $t2 -1 # t--
	j tela	

# desenha o chao
chao:	addi $t1 $0 0xe7c278 # RGB 0x ff ff ff
	addi $t3 $0 -512 # volta para comeco da linha
	addi $t4 $0 5 # hc (altura do chao)
	mul $t5 $t3 $t4 # -2560 pixels
	add $t0 $t0 $t5 # volta 5 linhas acima da última linha da tela
	addi $t6 $0 -1 
	mul $t5 $t5 $t6 # inverte valor
	srl $t5 $t5 2 # t = 2560 / 4 = 640 espacos de memoria
	
c:	beq $t5 $0 retangulo # while t < 0
	sw $t1 0($t0) # 'pinta' pixel
	addi $t0 $t0 4 # proximo endereco de memoria
	addi $t5 $t5 -1 # t--
	j c	


# desenha os retangulos com funcao
retangulo:
# retangulo 1
	lui $a0 0x1001 # endereco
	addi $t0 $0 50 # x
	sll $t0 $t0 2 
	add $a0 $a0 $t0 # inicio + x
	
	addi $t0 $0 10 # y
	sll $t0 $t0 8
	add $a0 $a0 $t0 # inicio + y
		
	addi $a1 $0 0 # cor
	addi $a2 $0 6 # b
	add $a3 $0 3 # h
	
	jal ret

# retangulo 2
	lui $a0 0x1001 # endereco
	addi $t0 $0 100 # x
	sll $t0 $t0 2 
	add $a0 $a0 $t0 # inicio + x
	
	addi $t0 $0 23 # y
	sll $t0 $t0 8
	add $a0 $a0 $t0 # inicio + y
		
	addi $a1 $0 0xff0000 # cor
	addi $a2 $0 10 # b
	add $a3 $0 5 # h
	
	jal ret
	
	
end:	addi $v0 $0 10
	syscall

# funcao para desenhar retangulos
ret:	add $t0 $0 $a0 # endereco
	add $t1 $0 $a1 # cor
	add $t2 $0 $a2 # b
	add $t3 $0 $a3 # h

laco1:	beq $t3 $0 fimret
laco2:	beq $t2 $0 fimlaco2
	
	sw $t1 0($t0) # 'pinta' pixel
	addi $t0 $t0 4 # proximo endereco de memoria

	addi $t2 $t2 -1 # x--
	j laco2
fimlaco2:
	addi $t0 $t0 512 # proxima linha 
	sll $t7 $a2 2 # x * 4 (endereco de mem)
	sub $t0 $t0 $t7 # volta para inicio
	add $t2 $0 $a2 # x = b
	addi $t3 $t3 -1 # y--
	j laco1

fimret:	 jr $ra # retorno da funcao