.text
main: nop

addi $t0 $0 10 # raio
add $t1 $0 $t0 
addi $t2 $0 3 # pi
addi $a0 $0 0x10010000 # inicio
addi $t4 $0 10 # x
sll $t4 $t4 2
addi $t5 $0 10 # y
sll $t5 $t5 9
add $a0 $a0 $t4
add $a0 $a0 $t5 
add $t6 $0 $a0 # inicio
addi $a1 $0 0xffff00 # cor

jal circ

addi $t0 $0 7 # raio
add $t1 $0 $t0 
addi $t2 $0 3 # pi
addi $a0 $0 0x10010000 # inicio
addi $t4 $0 25 # x
sll $t4 $t4 2
addi $t5 $0 42 # y
sll $t5 $t5 9
add $a0 $a0 $t4
add $a0 $a0 $t5 
add $t6 $0 $a0 # inicio
addi $a1 $0 0xde53f1 # cor

jal circ

addi $t0 $0 2 # raio
add $t1 $0 $t0 
addi $t2 $0 3 # pi
addi $a0 $0 0x10010000 # inicio
addi $t4 $0 55 # x
sll $t4 $t4 2
addi $t5 $0 61 # y
sll $t5 $t5 9
add $a0 $a0 $t4
add $a0 $a0 $t5 
add $t6 $0 $a0 # inicio
addi $a1 $0 0x249a00 # cor

jal circ

j end

circ:
sw $ra 0($sp)
addi $sp $sp -4

q4: beq $t1 $0 fimq4

sub $t3 $t0 $t1 # A = raio - linha
sll $t3 $t3 1 # B = A * 2
div $t3 $t2 # C = B MOD 3
mflo $t3
mul $t3 $t3 $t3 # D = C**2
srl $t3 $t3 2 # E = D MOD 4

sub $a2 $t0 $t3 # tamanho

jal linhap

addi $t6 $t6 512
sub $a2 $t0 $t3
sll $a2 $a2 2
sub $t6 $t6 $a2
addi $t1 $t1 -1
j q4

fimq4: 
add $t1 $0 $t0
add $t6 $0 $a0 # inicio
q1: beq $t1 $0 fimq1

sub $t3 $t0 $t1 # A = raio - linha
sll $t3 $t3 1 # B = A * 2
div $t3 $t2 # C = B MOD 3
mflo $t3
mul $t3 $t3 $t3 # D = C**2
srl $t3 $t3 2 # E = D MOD 4

sub $a2 $t0 $t3 # tamanho

jal linhap

addi $t6 $t6 -512
sub $a2 $t0 $t3
sll $a2 $a2 2
sub $t6 $t6 $a2
addi $t1 $t1 -1
j q1

fimq1:
add $t1 $0 $t0
add $t6 $0 $a0 # inicio

q2: beq $t1 $0 fimq2

sub $t3 $t0 $t1 # A = raio - linha
sll $t3 $t3 1 # B = A * 2
div $t3 $t2 # C = B MOD 3
mflo $t3
mul $t3 $t3 $t3 # D = C**2
srl $t3 $t3 2 # E = D MOD 4

sub $a2 $t0 $t3 # tamanho

jal linhan

addi $t6 $t6 -512
sub $a2 $t0 $t3
sll $a2 $a2 2
add $t6 $t6 $a2
addi $t1 $t1 -1
j q2

fimq2:
add $t1 $0 $t0
add $t6 $0 $a0 # inicio

q3: beq $t1 $0 fimq3

sub $t3 $t0 $t1 # A = raio - linha
sll $t3 $t3 1 # B = A * 2
div $t3 $t2 # C = B MOD 3
mflo $t3
mul $t3 $t3 $t3 # D = C**2
srl $t3 $t3 2 # E = D MOD 4

sub $a2 $t0 $t3 # tamanho

jal linhan

addi $t6 $t6 512
sub $a2 $t0 $t3
sll $a2 $a2 2
add $t6 $t6 $a2
addi $t1 $t1 -1
j q3

fimq3:
addi $sp $sp 4
lw $ra 0($sp)
jr $ra

linhap:
sw $ra 0($sp)
addi $sp $sp -4
lp:
beq $a2 $0 fimlp
sw $a1 0($t6)
addi $t6 $t6 4
addi $a2 $a2 -1
j lp
fimlp: 
addi $sp $sp 4
lw $ra 0($sp)
jr $ra

linhan:
sw $ra 0($sp)
addi $sp $sp -4
ln:
beq $a2 $0 fimln
sw $a1 0($t6)
addi $t6 $t6 -4
addi $a2 $a2 -1
j ln
fimln: 
addi $sp $sp 4
lw $ra 0($sp)
jr $ra


end:
addi $v0 $0 10
syscall 