# le e armazena 10 inteiros num vetor,
# 'retira' o maior e menor valor,
# calcula a media aritmetica dos 8 numeros restantes

.text
	lui $t0 0x1001 # endereco inicial de memoria
	addi $t1 $0 8 # tamanho do vetor -1
	addi $t3 $0 0 # maior
	addi $t4 $0 0 # menor
	
	addi $v0 $0 5 # le primeiro numero
	syscall
	sw $v0 0($t0)
	addi $t0 $t0 4 # incrementa 4 ao endereço do vetor
	add $t3 $0 $v0 # guarda maior
	add $t4 $0 $v0 # guarda menor
	add $a0 $a0 $v0 # acumulo
	
list:	addi $v0 $0 5 
	syscall
	sw $v0 0($t0) # insere item lido na lista
	addi $t0 $t0 4
	
	add $a0 $a0 $v0 # acumulo
mai:	slt $t5 $t3 $v0 # $v0 >= $t3? 1:0
	beq $t5 $0 rlist # $t5 == 0? rlist:linha abaixo
	add $t3 $0 $v0 # atualiza maior
men:	slt $t5 $v0 $t4 # $v0 < $t4? 1:0
	beq $t5 $0 rlist # $t5 == 0? rlist:linha abaixo
	add $t4 $0 $v0 # atualiza menor
	
rlist:	beq $t1 $0 med
	addi $t1 $t1 -1
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
