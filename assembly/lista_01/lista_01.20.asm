.text
# lê ano e imprime data da páscoa conforme algoritmo de Meeus/Jones/Butcher
# \ = divisão inteira, MOD = resto da divisão
main: addi $2, $0, 5 # lê inteiro
	syscall
ANO:	add $8, $0, $2 # ANO
	addi $2, $0, 19 
	div $8, $2 
A:	mfhi $9 #  a = ANO MOD 19
	addi $2, $0, 100
	div $8, $2
B:	mflo $10 # b = ANO \ 100
	addi $2, $0, 100
	div $8, $2
C:	mfhi $11 # c = ANO MOD 100
	addi $2, $0, 4
	div $10, $2
D:	mflo $12 # d = b \ 4
	addi $2, $0, 4
	div $10, $2
E:	mfhi $13 # e = b MOD 4
	addi $14, $10, 8
	addi $2, $0, 25	
	div $14, $2
F:	mflo $14 # f = (b + 8) \ 25
	sub $15, $10, $14
	addi $15, $15, 1
	addi $2, $0, 3
	div $15, $2
G:	mflo $15 # g = (b - f + 1) \ 3
	addi $2, $0, 19
	mul $14, $9, $2
	add $14, $14, $10 
	sub $14, $14, $12
	sub $14, $14, $15
	addi $14, $14, 15
	addi $2, $0, 30
	div $14, $2
H:	mfhi $14 # h = (19 * a + b - d - g + 15) MOD 30
	addi $2, $0, 4
	add $24, $0, $11
	div $24, $2
I:	mflo $24 # i = c \ 4
	add $25, $0, $11
	div $25, $2
K:	mfhi $25 # k = c MOD 4
	addi $2, $0, 2
	mul $10, $2, $13
	mul $4, $2, $24
	addi $10, $10, 32
	add $10, $10, $4
	sub $10, $10, $14
	sub $10, $10, $25
	addi $2, $0, 7
	div $10, $2
L:	mfhi $10 # L = (32 + 2 * e + 2 * i - h - k) MOD 7
	addi $11, $0, 11
	mul $11, $11, $14
	addi $4, $0, 22
	mul $4, $4, $10
	add $11, $11, $9
	add $11, $11, $4
	addi $2, $0, 451
	div $11, $2
M:	mflo $11 # m = (a + 11 * h + 22 × L) \ 451
	addi $9, $0, 7
	mul $9, $9, $11
	sub $9, $14, $9
	add $9, $9, $10
	addi $9, $9, 114
	add $10, $0, $9
	addi $2, $0, 31
	div $9, $2	
MES:	mflo $9 # MÊS = (h + L - 7 * m + 114) \ 31
	addi $10, $10, 1
	div $10, $2
DIA:	mfhi $10 # DIA = 1+ (h + L - 7 × m + 114)MOD 31			
print:	add $4, $0, $10 # armazena DIA em $4
	addi $2, $0, 1 # imprime $4
	syscall
	add $4, $0, '/'
	addi $2, $0, 11 # imprime $4 como caracter
	syscall
	add $4, $0, $9 # armazena MES em $4
	addi $2, $0, 10
	div $9, $2
	mflo $4
	addi $2, $0, 1 # imprime $4
	syscall
	mfhi $4
	addi $2, $0, 1 # imprime $4
	syscall
	add $4, $0, '/'
	addi $2, $0, 11 # imprime $4 como caracter
	syscall
	add $4, $0, $8 # armazena ANO em $4
	addi $2, $0, 10
	div $8, $2
	mflo $4
	addi $2, $0, 1 # imprime $4
	syscall
	mfhi $4
	addi $2, $0, 1 # imprime $4
	syscall
fim:	addi $2, $0, 10 # encerra programa
	syscall
