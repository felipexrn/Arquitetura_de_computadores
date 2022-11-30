# lê e armazena 10 inteiros num vetor,
# 'retira' o maior e menor valor,
# calcula a media aritmetica dos 8 números restantes

.text
	lui $t0 0x1001 # endereco inicial de memoria
	addi $t1 $0 8 # tamanho do vetor
	addi $t2 $0 0 # offset do endereco da memoria (indice do vetor )
	addi $t3 $0 0 # maior
	addi $t4 $0 0 # menor
	
	addi $v0 $0 5 # le primeiro numero
	syscall
	sw $v0 0($t0)
	addi $t0 $t0 4
	add $t3 $0 $v0 
	add $t4 $0 $v0 
	
list:	addi $v0 $0 5 # insere itens lista
	syscall
	sw $v0 0($t0)
	addi $t0 $t0 4
	
	add $a0 $a0 $v0 # acumulo
	slt $t5 $t3 $v0 # $t3 < $v0? 1:0
	beq $t5 $0 rlist # $t5 == 0? ret:linha abaixo
	add $t3 $0 $v0 # atualiza maior
	slt $t5 $v0 $t4 # $v0 < $t4? 1:0
	beq $t5 $0 rlist # $t5 == 0? ret:linha abaixo
	add $t4 $0 $v0 # atualiza menor
	
rlist:	beq $t1 $t2 med
	addi $t2 $t2 1
	j list
	
med:	sub $a0 $a0 $t3
	sub $a0 $a0 $t4
	addi $t5 $0 8
	div $a0 $t5
	mflo $a0
	
prn:	addi $v0 $0 1
	syscall
	
end: 	addi $v0 $0 10
	syscall