# padrões encontrados nas 27 instruções da primeira etapa do projeto 
# 11 instruções R [6,rs,rt,rd,5,6] ok
# 7 instruções I [6,rs,rt,16] ok
# 1 instrução nop 0 [6,5,5,5,5,6] ok
# 1 instrução syscall [6,20,01100] ok
# 4 instruções [6,rs,rt,10,6] ok
# 3 instruções [6,5,rt,rd,sa,6] ok
def dec_bin(op, rs, rt, rd, sa, fu, imediato):
  if imediato:
    binario = "{:06b}".format(op)
    binario += "{:05b}".format(rs)
    binario += "{:05b}".format(rt)
    binario += "{:016b}".format(fu)
  else:
    binario = "{:06b}".format(op)
    binario += "{:05b}".format(rs)
    binario += "{:05b}".format(rt)
    binario += "{:05b}".format(rd)
    binario += "{:05b}".format(sa)
    binario += "{:06b}".format(fu)
  return binario
def bin_hex(binario):
  hexadecimal = ""
  bin = binario
  for i in range(8):
    dec = 0
    quatro_bits = bin[:4]
    p = 0
    for j in range(4):
      dec += int(quatro_bits[3 - j]) * (2**p)
      p += 1
    hexadecimal += "{:x}".format(dec)
    bin = bin[4:]
  return hexadecimal
def monta_executavel(instrucao):
  nome = ["add", "addi", "addiu", "addu", "and", "andi", "div", "divu", "mul", "mult", "multu", "nop", "nor", "or", "ori", "sll", "slt", "slti", "sltiu", "sltu", "sra", "srl", "sub", "subu", "syscall", "xor", "xori"]
  op_code = [0, 8, 9, 0, 0, 12, 0, 0, 28, 0, 0, 0, 0, 0, 13, 0, 0, 10, 11, 0, 0, 0, 0, 0, 0, 0, 14]
  function = [32,"imediato", "imediato", 33, 36, "imediato", 26, 27, 2, 24, 25, 0, 39, 37, "imediato", 0, 42, "imediato", "imediato", 43, 3, 2, 34, 35, 12, 38, "imediato"]
  id_nome = nome.index(instrucao[0])
  imediato = False
  try:
    tem_i = instrucao[0].index('i') > 0
  except:
    tem_i = False
  if instrucao[0] == nome[6] or instrucao[0] == nome[7] or instrucao[0] == nome[9] or instrucao[0] == nome[10]: # duplas
    instrucao[1] = int(instrucao[1][1:])
    instrucao[2] = int(instrucao[2][1:])
    no = nome[id_nome]
    op = op_code[id_nome]
    rs = instrucao[1]
    rt = instrucao[2]
    rd = 0
    sa = 0
    fu = function[id_nome]
  elif instrucao[0] == nome[11]: # nop
    no = nome[id_nome]
    op = 0
    rs = 0
    rt = 0
    rd = 0
    sa = 0
    fu = 0
  elif instrucao[0] == nome[24]: # syscall
    no = nome[id_nome]
    op = op_code[id_nome]
    rs = 0
    rt = 0
    rd = 0
    sa = 0
    fu = function[id_nome]
  elif instrucao[0] == nome[21] or instrucao[0] == nome[20] or instrucao[0] == nome[15]: # sa
    instrucao[1] = int(instrucao[1][1:])
    instrucao[2] = int(instrucao[2][1:])
    no = nome[id_nome]
    op = op_code[id_nome]
    rs = 0
    rt = instrucao[2]
    rd = instrucao[1]
    sa = int(instrucao[3])
    fu = function[id_nome]
  elif instrucao[0][0] != 'd' and tem_i: # padrão I
    imediato = True
    instrucao[1] = int(instrucao[1][1:])
    instrucao[2] = int(instrucao[2][1:])
    no = nome[id_nome]
    op = op_code[id_nome]
    rs = instrucao[2]
    rt = instrucao[1]
    rd = 0
    sa = 0
    fu = int(instrucao[3])    
  else: # padrão R
    instrucao[1] = int(instrucao[1][1:])
    instrucao[2] = int(instrucao[2][1:])
    instrucao[3] = int(instrucao[3][1:])
    no = nome[id_nome]
    op = op_code[id_nome]
    rs = instrucao[2]
    rt = instrucao[3]
    rd = instrucao[1]
    sa = 0
    fu = function[id_nome]
  return no, op, rs, rt, rd, sa, fu, imediato
while(True):
  no = op = rs = rt = rd = sa = fu = 0
  try:
    instrucao = list(input().split())
    no, op, rs, rt, rd, sa, fu, imediato = monta_executavel(instrucao)
    binario = dec_bin(op, rs, rt, rd, sa, fu, imediato)
    hexadecimal = bin_hex(binario)
    print(hexadecimal)
  except:
    break