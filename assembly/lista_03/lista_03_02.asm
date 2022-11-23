# Faça um programa que solicite ao usuário um número para ser a referência
# e outro para ser a quantidade de valores a ser impresso no caso do programa da Q1.
# Para a mesma resposta, por exemplo, o usuário forneceria a referência 3 e a quantidade 10.
.text
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	addi $v0 $0 5	# referencia
	syscall
	add $t1 $0 $v0	
	addi $t1 $t1 1	# quantidade
	addi $t2 $0 1	# contador
	
prn:	mul $a0 $t0 $t2
	addi $v0 $0 1
	syscall
	addi $a0 $0 '\n'
	addi $v0 $0 11
	syscall
	add $t2 $t2 1
	beq $t1 $t2 end
	j prn
	
end:	addi $v0 $0 10
	syscall
