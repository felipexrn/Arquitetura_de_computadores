# programa com funcao para desenhar circulos
.text
main:
# propriedades graficas
addi $t0 $0 512 # width tela
addi $t1 $0 256 # height tela
addi $t2 $0 4 # proporcao pixels

# parametros da funcao circ
lui $a0 0x1001 # endereco inicial do centro

addi $t3 $0 63 # x (deslocamento no eixo x a partir do inicio)
addi $t4 $0 31 # y (deslocamento no eixo y a partir do inicio)
sll $t5 $t3 2 # x * 4 (x memorias) 
add $a0 $a0 $t5 # deslocamento do inicio por x
mul $t5 $t4 $t0 # y * width (512)
add $a0 $a0 $t5 # deslocamento do inicio por y

addi $a1 $0 0xffffff # cor do circulo
addi $a2 $0 16 # raio do circulo

jal circ # chama funcao circ

# parametros da funcao circ
lui $a0 0x1001 # endereco inicial do centro

addi $t3 $0 4 # x (deslocamento no eixo x a partir do inicio)
addi $t4 $0 4 # y (deslocamento no eixo y a partir do inicio)
sll $t5 $t3 2 # x * 4 (x memorias) 
add $a0 $a0 $t5 # deslocamento do inicio por x
mul $t5 $t4 $t0 # y * width (512)
add $a0 $a0 $t5 # deslocamento do inicio por y

addi $a1 $0 0x00ffff # cor do circulo
addi $a2 $0 5 # raio do circulo

jal circ # chama funcao circ

j end

# funcao para desenhar circulo
circ:
sw $ra 0($sp) # guarda retorno na pilha
addi $sp $sp -4 # aponta para proximo na pilha
add $s0 $0 $a0 # endereco inicial
add $t5 $0 $a2 # r = raio
addi $t6 $0 -1 # i = 1
c:
slt $t7 $0 $t5 # r < 0? 0:1
beq $t7 $0 fimc # while r >=0 
jal linha # chama funcao linha

prn:
add $a0 $0 $t5
addi $v0 $0 1
syscall
add $a0 $0 '\n'
addi $v0 $0 11
syscall

add $t5 $t5 $t6 # r-= i
addi $t6 $t6 -2 # i += 2
add $s0 $s0 $t0 # prx linha
j c
fimc:
addi $sp $sp 4 # apaga topo da pilha
lw $ra 0($sp) # carrega topo da pilha
jr $ra # retorna para end no topo pilha

# funcao desenha linha
linha:
sw $ra 0($sp) # guarda retorno na pilha
addi $sp $sp -4 # aponta para proximo na pilha
add $t8 $0 $t5 # l = tamanho linha
add $t9 $0 $s0 # endereco inicial
l:
beq $t8 $0 fiml # while l > 0
sw $a1 0($t9) # 'pinta' pixel
# addi $a1 $a1 -4 # gradiente de cores
addi $t9 $t9 4 # endereço += 4
addi $t8 $t8 -1 # l--
j l
fiml:
addi $sp $sp 4 # apaga topo da pilha
lw $ra 0($sp) # carrega topo da pilha
jr $ra # retorna para o end no topo da pilha

end:
addi $v0 $0 10
syscall
