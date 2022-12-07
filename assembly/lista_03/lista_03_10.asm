# Fa�a um programa para calcular o MDC de dois n�meros fornecidos pelo usu�rio,
# usando o algoritmo de Euclides.
# O algoritmo de Euclides � baseado no princ�pio de que o MDC n�o muda se o menor n�mero for subtra�do ao maior.
# Por exemplo, 21 � o MDC de 252 e 105 (252 = 21 � 12; 105 = 21 � 5); j� que 252 ? 105 = 147,
# o MDC de 147 e 105 � tamb�m 21. Como o maior dos dois n�meros � reduzido,
# a repeti��o deste processo ir� gerar sucessivamente n�meros menores, at� convergir em zero.
# Nesse momento, o MDC � o outro n�mero inteiro, maior que zero.
# 252 - 105 = 147
# 147 - 105 = 42
# 105 - 42 = 63
# 63 - 42 = 21
# 42 - 21 = 21
# 21 - 21 = 0
.text
main:	addi $v0 $0 5
	syscall
	add $t0 $0 $v0 # numero A
	
	addi $v0 $0 5
	syscall
	add $t1 $0 $v0 # numero B
	
mdc:	