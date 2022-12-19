# google pesquisar: seletor de cores
# estudem funcoes e lacos
# este programa desenha um ceu, um chao e retangulos 

.text
# desenha o ceu
main:	lui $t0 0x1001 # endereço inicial
	addi $t1 $0 0x78d4e7 # RGB     0x ff ff ff
	sw $t1 0($t0) 
	addi $t2 $0 8192 # tamamnho da tela 
		
tela:	beq $t2 $0 chao
	sw $t1 0($t0)
	addi $t0 $t0 4
	addi $t2 $t2 -1
	j tela	

# desenha o chao
chao:	addi $t1 $0 0xe7c278 # RGB     0x ff ff ff
	addi $t3 $0 -512
	addi $t4 $0 5
	mul $t5 $t3 $t4 # -2560 / 4 = -640 espacos de memoria
	add $t0 $t0 $t5
	addi $t6 $0 -1
	mul $t5 $t5 $t6
	srl $t5 $t5 2
	
c:	beq $t5 $0 retangulo
	sw $t1 0($t0)
	addi $t0 $t0 4
	addi $t5 $t5 -1
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
	
	sw $t1 0($t0)
	addi $t0 $t0 4

	addi $t2 $t2 -1
	j laco2
fimlaco2:
	addi $t0 $t0 512
	sll $t7 $a2 2
	sub $t0 $t0 $t7
	add $t2 $0 $a2	
	addi $t3 $t3 -1
	j laco1

fimret:	 jr $ra
