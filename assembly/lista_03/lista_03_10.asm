# Faça um programa para calcular o MDC de dois números fornecidos pelo usuário,
# usando o algoritmo de Euclides.
# O algoritmo de Euclides é baseado no princípio de que o MDC não muda se o menor número for subtraído ao maior.
# Por exemplo, 21 é o MDC de 252 e 105 (252 = 21 × 12; 105 = 21 × 5); já que 252 ? 105 = 147,
# o MDC de 147 e 105 é também 21. Como o maior dos dois números é reduzido,
# a repetição deste processo irá gerar sucessivamente números menores, até convergir em zero.
# Nesse momento, o MDC é o outro número inteiro, maior que zero.
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