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
main:
nop 
		
ceu:
addi $a0 $0 0x10010000 # endereco
addi $a1 $0 0x78d4e7 # RGB 0x ff ff ff
addi $a2 $0 128 # b
addi $a3 $0 64 # h
addi $t0 $0 0 # x
addi $t1 $0 0 # y
	
jal ret

# desenha o chao
	
addi $a0 $0 0x10010000 # endereco
addi $a1 $0 0xe7c278 # RGB 0x ff ff ff
addi $a2 $0 55 # b
addi $a3 $0 5 # h
addi $t0 $0 0 # x
addi $t1 $0 59 # y
	
jal chao

addi $a0 $0 0x10010000 # endereco
addi $a1 $0 0xe7c278 # RGB 0x ff ff ff
addi $a2 $0 55 # b
addi $a3 $0 5 # h
addi $t0 $0 65 # x
addi $t1 $0 59 # y
	
jal chao
	
addi $a0 $0 0x10010000 # endereco
addi $a1 $0 0xe7c278 # RGB 0x ff ff ff
addi $a2 $0 10 # b
addi $a3 $0 5 # h
addi $t0 $0 0 # x
addi $t1 $0 54 # y
	
jal chao

j nuvem

chao:	
sw $ra 0($sp)
addi $sp $sp -4
	
add $t2 $0 $a2 # b grama
add $t4 $0 $t0 # x grama
add $t5 $0 $t1 # y grama
	
jal ret
	
addi $a0 $0 0x10010000 # endereco
addi $a1 $0 0x42d690 # RGB 0x ff ff ff
add $a2 $0 $t2 # b
addi $a3 $0 1 # h
add $t0 $0 $t4 # x
add $t1 $0 $t5 # y
	
jal ret	

addi $sp $sp 4
lw $ra 0($sp)
jr $ra

# desenha nuvem com funcao
nuvem:

addi $a0 $0 0x10010000 # endereco
addi $t0 $0 50 # x
addi $t1 $0 10 # y
addi $a1 $0 0xffffff # cor
addi $a2 $0 6 # b
add $a3 $0 3 # h
	
jal ret

addi $a0 $0 0x10010000 # endereco
addi $t0 $0 45 # x
addi $t1 $0 8 # y
addi $a1 $0 0xffffff # cor
addi $a2 $0 10 # b
add $a3 $0 4 # h
	
jal ret

addi $a0 $0 0x10010000 # endereco
addi $t0 $0 52 # x
addi $t1 $0 9 # y
addi $a1 $0 0xffffff # cor
addi $a2 $0 8 # b
add $a3 $0 3 # h
	
jal ret

addi $a0 $0 0x10010000 # endereco
addi $t0 $0 48 # x
addi $t1 $0 7 # y
addi $a1 $0 0xffffff # cor
addi $a2 $0 4 # b
add $a3 $0 4 # h
	
jal ret

addi $a0 $0 0x10010000 # endereco
addi $t0 $0 40 # x
addi $t1 $0 9 # y
addi $a1 $0 0xffffff # cor
addi $a2 $0 7 # b
add $a3 $0 2 # h
	
jal ret
	
j end

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
addi $t0 $t0 512 # proxima linha 
sll $t7 $a2 2 # x * 4 (endereco de mem)
sub $t0 $t0 $t7 # volta para inicio
add $t2 $0 $a2 # x = b
addi $t3 $t3 -1 # y--
j laco1

fimret:	 
jr $ra # retorno da funcao

end:	
addi $v0 $0 10
syscall