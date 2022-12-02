# Faca um programa que leia um vetor de 8 posições
#  e, em seguida, leia também dois valores X e Y quaisquer
# correspondentes a duas posições (índices) no vetor.
# Ao final seu programa deverá escrever a soma dos valores
# encontrados nas respectivas posições X e Y.
.text
main:	lui $t0 0x1001 # aponta para V[0]
	addi $t1 $0 8 # t = 8
	
while:	beq $t1 $0 soma # t == 0? soma: prox instr  
	addi $v0 $0 5
	syscall
	sw $v0 0($t0) # V[i] = entrada
	addi $t0 $t0 4 # i+=4
	addi $t1 $t1 -1 # t--
	j while
	
soma:	addi $t2 $0 2 # t = 2
	addi $a0 $0 0 # soma
	
fatores:	beq $t2 $0 prn # t == 0? prn: prox instr
	lui $t0 0x1001 # aponta para V[0]
	
	addi $v0 $0 5
	syscall 
	sll $t1 $v0 2 # le indice * 4
	add $t0 $t0 $t1
	lw $t3 0($t0) # $t3 = V[indice]
	add $a0 $a0 $t3 # acumula fator
	
	addi $t2 $t2 -1
	j fatores
	
prn:	addi $v0 $0 1
	syscall
	
end:	addi $v0 $0 10
	syscall
	