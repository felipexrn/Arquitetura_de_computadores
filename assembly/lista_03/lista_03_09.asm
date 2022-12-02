# Faca um programa leia certa quantidade de numeros
# e imprima o maior deles e quantas vezes o maior número foi lido.
# A quantidade de números a serem lidos eh fornecida pelo usuario.
.text
main:	nop # $t0 = contador de maior, $t1 = maior
	
qtd:	addi $v0 $0 5
	syscall
	add $t2 $0 $v0 # Quantidade de numeros
	
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0 # inicia maior
	addi $t0 $0 1 # inicia contador
	addi $t2 $t2 -1 # atualiza qtd numeros
	
for:	beq $t2 $0 prn # $0 = 0; $t2 > $0; $t2--
	addi $t2 $t2 -1
	
	addi $v0 $0 5 # le $t2 numeros
	syscall
	
menor:	slt $t3 $t1 $v0 # $t1 < $v0? 1:0
	beq $t3 $0 igual
	add $t1 $0 $v0 # atualiza maior
	
igual:	beq $t1 $v0 contM
	addi $t0 $0 1 # reinicia contador
	j for
	
contM:	addi $t0 $t0 1 # incrementa contador	
	j for

prn:	add $a0 $0 $t1 # mostra maior
	addi $v0 $0 1
	syscall
	
	addi $a0 $0 '\n'
	addi $v0 $0 11
	syscall
	
	add $a0 $0 $t0 # mostra qtd vezes maior lido
	addi $v0 $0 1
	syscall

end:	addi $v0 $0 10
	syscall