.text
# lê uma data e mostra a próxima data e a data anterior
main: addi $v0 $0 5
	syscall
	add $t0 $0 $v0
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0
	addi $v0 $0 5
	syscall
	add $t2 $0 $v0
	addi $t3 $0 1 # dia, m�s ou ano menores que 1
	slt $t4 $t0 $t3
	bne $t4 $0 fim
	slt $t4 $t1 $t3
	bne $t4 $0 fim
	slt $t4 $t2 $t3
	bne $t4 $0 fim
	addi $t3 $0 12 # m�s acima de 12
	slt $t4 $t3 $t1
	bne $t4 $0 fim
	addi $t3 $0 31 # dia acima de 31
	slt $t4 $t3 $t0
	bne $t4 $0 fim
	addi $t4 $0 8 # m�s de 30/31 dias
	div $t1 $t4
	mflo $t4
	add $t4 $t4 $t1
	addi $t5 $0 2
	div $t4 $t5
	mfhi $t5
	beq $t5 $0 tri 
	j triu
tri:	slt $t4 $t0 $t3
	beq $t4 $0 fim
	j bsx
triu:	addi $t3 $0 32
	slt $t4 $t3 $t0
	beq $t4 $t0 fim
bsx:	addi $t3 $0 4 # ano bissexto
	div $t2 $t3
	mfhi $t4
	beq $t4 $0 quat
	j nbis
quat:	addi $t3 $0 100
	div $t2 $t3
	mfhi $t4
	bne $t4 $0 bis
	addi $t3 $0 400
	div $t2 $t3
	mfhi $t4
	beq $t4 $0 bis
nbis:	addi $t6 $0 1
	addi $t3 $0 2 # m�s de fevereiro
	bne $t3 $t1 val
	addi $t3 $0 29
	slt $t4 $t0 $t3
	beq $t4 $0 fim 
	j val
bis:	addi $t6 $0 0
	addi $t3 $0 2 
	bne $t3 $t1 val
	addi $t3 $0 30
	slt $t4 $t0 $t3
	beq $t4 $0 fim 
	j val
val:	addi $t3 $0 2 # pr�xima data
	bne $t1 $t3 nf
	beq $t6 $0 bi 
	j nbi
nf:	beq $t5 $0 dtr
	addi $t3 $0 31
	j ad
dtr:	add $t3 $0 30
ad:	beq $t3 $t0 pd
	addi $t7 $t0 1
	add $t8 $0 $t1
	add $t9 $0 $t2
	j pr1
bi:	addi $t3 $0 29
	beq $t3 $t0 pd
	j ad
nbi:	addi $t3 $0 28
	beq $t3 $t0 pd
	j ad
pd:	addi $t7 $0 1 
	addi $t8 $t1 1
	add $t9 $0 $t2
	addi $t4 $0 13
	bne $t4 $t8 pr1 
	addi $t8 $0 1
	addi $t9 $t2 1
pr1:	add $a0 $t7 $0
	addi $v0 $0 1
	syscall
	addi $a0 $0 '/'
	addi $v0 $0 11
	syscall
	add $a0 $t8 $0
	addi $v0 $0 1
	syscall
	addi $a0 $0 '/'
	addi $v0 $0 11
	syscall
	add $a0 $t9 $0
	addi $v0 $0 1
	syscall
	subi $t7 $t0 1 # data anterior
	beq $t7 $0 ma
	add $t8 $0 $t1
	add $t9 $0 $t2 
	j pr2
ma:	sub $t8 $t1 1
	add $t9 $0 $t2
	addi $t4 $0 3
	bne $t4 $t1 nmar
	beq $t6 $0 bs
	j nbs
bs:	addi $t7 $0 29
	j aa
nbs:	addi $t7 $0 28
	j aa
nmar:	beq $t5 $0 pt
	addi $t7 $0 30
	j aa
pt:	addi $t7 $0 31
	j aa
aa:	bne $t8 $0 pr2
	addi $t7 $0 31
	addi $t8 $0 12
	sub $t9 $t2 1
	beq $t9 $0 aec
	j pr2
aec:	sub $t9 $t9 1
pr2:	addi $a0 $0 '\n' 
	addi $v0 $0 11
	syscall
	add $a0 $0 $t7
	addi $v0 $0 1
	syscall
	addi $a0 $0 '/'
	addi $v0 $0 11
	syscall
	add $a0 $0 $t8
	addi $v0 $0 1
	syscall
	addi $a0 $0 '/'
	addi $v0 $0 11
	syscall
	add $a0 $0 $t9
	addi $v0 $0 1
	syscall
fim:	addi $v0 $0 10
	syscall
