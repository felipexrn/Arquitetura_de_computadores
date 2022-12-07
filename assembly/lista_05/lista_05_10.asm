# *Leia um vetor com 10 números inteiros.
# Escreva os elementos do vetor eliminando
# elementos repetidos.
# Faça a alteração diretamente no vetor original,
# sem uso de vetores auxiliares.
.text
main:	lui $t0 0x1001 # aponta para v[0]
	addi $t1 $0 10 # t = 10
	addi $t2 $0 0 # i = 0

leitura:	beq $t1 $t2 comparar
	addi $v0 $0 5
	syscall
	sw $v0 0($t0) #v[endereço] = entrada
	addi $t0 $t0 4 # endereço += 4
	addi $t2 $t2 1 # i++
	j leitura

comparar:	lui $t0 0x1001 # aponta para v[0]
	add $t4 $t0 4 # aponta para v[1]
	addi $t2 $0 1 # i = 0

for1:	beq $t1 $t2 prn
	lw $t3 0($t0) # Numero base
	lw $t6 0($t4) # Numero comparado
	add $t5 $0 $t2 # j = i+0
	
for2:	beq $t1 $t5 fimfor1
	lw $t6 0($t4) # Numero comparado
	addi $t7 $t5 1 # k = j+1
	add $t8 $0 $t4 # end_k = end_j
	beq $t3 $t6 remover
	j fimfor2
	
remover:	beq $t7 $t1 fimrem
	lw $t9 4($t8) # le v[k]
	sw $t9 0($t8) # guarda v[k]
	addi $t8 $t8 4 # end_k += 4
	addi $t7 $t7 1 # k++
	j remover

fimrem:	addi $t5 $t5 -1 # j--
	addi $t4 $t4 -4 # end_j -= 4
	addi $t1 $t1 -1 # t--
	
fimfor2:	addi $t5 $t5 1 # j++
	addi $t4 $t4 4 # end_j += 4
	j for2

fimfor1:	addi $t2 $t2 1 # i++
	addi $t0 $t0 4 # end_i += 4
	addi $t4 $t0 4 # end_j = end_i + 4
	j for1
	
prn:	lui $t0 0x1001 # aponta para v[0]
	addi $t2 $0 0 # i = 0
	
for3:	beq $t1 $t2 end
	lw $a0 0($t0)
	addi $v0 $0 1
	syscall
	add $a0 $0 ' '
	addi $v0 $0 11
	syscall
	addi $t0 $t0 4 # end_i += 4
	addi $t2 $t2 1 # i++
	j for3
	
end:	addi $v0 $0 10
	syscall
