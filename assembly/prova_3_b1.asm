# ler um vetor de 20 elementos
# buscar uma sequencia de N elementos
# que resulte na maior (corredor) ou na menor (janela) soma dos elementos
# imprimir:
# tamamnho da sequencia
# soma
# indice inicial
.text
main:	lui $t0 0x1001 # aponta para v[0]
	addi $t1 $0 5 # t = 5
	addi $t2 $0 0 # i = 0
	
leitura:	beq $t1 $t2 comparar # while (i < t)
	addi $v0 $0 5 # entrada
	syscall
	sw $v0 0($t0) # v[i] = entrada
	addi $t0 $t0 4 # aponta para v[i+1]
	addi $t2 $t2 1 # i++
	j leitura
	
comparar:	lui $t0 0x1001 # aponta para v[0]
	addi $t2 $0 1 # i = 1
	addi $t3 $0 1 # tamanho
	addi $t4 $0 0 # soma
	addi $t5 $0 0 # indice inicial
	lw $at 0($t0)
	add $t4 $t4 $at # soma = v[0]
	
		
laco1:	beq $t2 $t1 prn # while (i < t)
	add $t6 $0 $t2 # j = i+0
	addi $t7 $t0 4 # aponta para v[j+1] 
	
laco2:	beq $t6 $t1 fimlaco1
	lw $at 0($t7) # aponta para v[j]
	add $at $t4 $at # $at = soma + v[j]
	slt $t8 $at $t4 # $at < $t4? 1:0
		
menor:	beq $t8 $0 fimlaco2 # sequencia < soma? prox instr: fimlaco2
	sub $t3 $t6 $t5 # tamanho += j
	add $t3 $t3 $t8 
	add $t4 $0 $at # soma = soma + v[j]
	addi $t5 $t5 1 # indice inicial++
	j fimlaco2
		
	# [1, 1, 1, 1, 1] ok
	# [1, 1, -1, 1, 1] ok
	# [-1, -1, 1, 1, 1] ok
	# [1, -1, -1, 1, 1] erro
	# [-1, 1, -1, 1, -1] erro
	# [-1, -1, -1, -1, -1] erro
			
fimlaco2:	addi $t7 $t7 4 # aponta para v[j+1]
	addi $t6 $t6 1 # j++
	j laco2
		
fimlaco1:	addi $t0 $t0 4 # aponta para v[i+1]
	addi $t2 $t2 1 # i++
	j laco1
	
prn:	add $a0 $0 '\n'
	addi $v0 $0 11
	syscall
	add $a0 $0 '\n'
	addi $v0 $0 11
	syscall
	add $a0 $0 $t3 # print tamanho
	addi $v0 $0 1
	syscall
	add $a0 $0 '\n'
	addi $v0 $0 11
	syscall
	add $a0 $0 $t4 # print soma
	addi $v0 $0 1
	syscall
	add $a0 $0 '\n'
	addi $v0 $0 11
	syscall
	add $a0 $0 $t5 # print indice inicial
	addi $v0 $0 1
	syscall
	add $a0 $0 '\n'
	addi $v0 $0 11
	syscall

end:	addi $v0 $0 10
	syscall
