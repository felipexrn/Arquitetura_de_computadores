# 11 instruções R [6,rs,rt,rd,5,6] 
# 7 instruções I [6,rs,rt,16] ok
# 1 instrução nop 0 [6,5,5,5,5,6] ok
# 1 instrução syscall [6,20,01100] ok
# 4 instruções [6,rs,rt,10,6] ok
# 3 instruções [6,5,rt,rd,sa,6] ok
class Instrucao: 
  def __init__(self, nome, op_code, rs, rt, rd, sa, function):
    self.nome = nome
    self.op_code = op_code # 6 bits 
    self.rs = rs # 5 bits
    self.rt = rt # 5 bits
    self.rd = rd # 5 bits
    self.sa = sa # 5 bitis
    self.function = function # 6 bitis
def bin_hex(binario):
  hex = ""
  bin = binario
  for i in range(8):
    dec = 0
    quatro_bits = bin[:4]
    p = 0
    for j in range(4):
      dec += int(quatro_bits[3 - j]) * (2**p)
      p += 1
    hex += "{:x}".format(dec)
    bin = bin[4:]
  return hex
def monta_executavel(instrucao):
  nome = ["add", "addi", "addiu", "addu", "and", "andi", "div", "divu", "mul", "mult", "multu", "nop", "nor", "or", "ori", "sll", "slt", "slti", "sltiu", "sltu", "sra", "srl", "sub", "subu", "syscall", "xor", "xori"]
  op_code = [0, 8, 9, 0, 0, 12, 0, 0, 28, 0, 0, 0, 0, 0, 13, 0, 0, 10, 11, 0, 0, 0, 0, 0, 0, 0, 14]
  func = [32,"imediato", "imediato", 33, 36, "imediato", 26, 27, 2, 24, 25, 0, 39, 37, "imediato", 0, 42, "imediato", "imediato", 43, 3, 2, 34, 35, 12, 38, "imediato"]
  id_nome = nome.index(instrucao[0])
  imediato = False
  try:
    tem_i = instrucao[0].index('i') > 0
  except:
    tem_i = False
  if instrucao[0] == nome[6] or instrucao[0] == nome[7] or instrucao[0] == nome[9] or instrucao[0] == nome[10]: # duplas
    instrucao[1] = int(instrucao[1][1:])
    instrucao[2] = int(instrucao[2][1:])
    instr_32_bits = Instrucao(nome[id_nome], op_code[id_nome], instrucao[1], instrucao[2], 0,0, func[id_nome]) 
  elif instrucao[0] == nome[11]: # nop
    instr_32_bits = Instrucao(nome[id_nome],0,0,0,0,0,0)
  elif instrucao[0] == nome[24]: # syscall
    instr_32_bits = Instrucao(nome[id_nome], op_code[id_nome],0,0,0,0, func[id_nome])
  elif instrucao[0] == nome[21] or instrucao[0] == nome[20] or instrucao[0] == nome[15]: # sa
    instrucao[1] = int(instrucao[1][1:])
    instrucao[2] = int(instrucao[2][1:])
    instr_32_bits = Instrucao(nome[id_nome], op_code[id_nome],0,instrucao[2], instrucao[1], int(instrucao[3]), func[id_nome])
  elif instrucao[0][0] != 'd' and tem_i: # padrão I
    instrucao[1] = int(instrucao[1][1:])
    instrucao[2] = int(instrucao[2][1:])
    instr_32_bits = Instrucao(nome[id_nome], op_code[id_nome],instrucao[2],instrucao[1],0,0,int(instrucao[3]))
    imediato = True
  else: # padrão R
    instrucao[1] = int(instrucao[1][1:])
    instrucao[2] = int(instrucao[2][1:])
    instrucao[3] = int(instrucao[3][1:])
    instr_32_bits = Instrucao(nome[id_nome], op_code[id_nome],instrucao[2], instrucao[3], instrucao[1], 0, func[id_nome])
  if imediato:
    traducao = "{:06b}".format(instr_32_bits.op_code)
    traducao += "{:05b}".format(instr_32_bits.rs)
    traducao += "{:05b}".format(instr_32_bits.rt)
    traducao += "{:016b}".format(instr_32_bits.function)
  else:
    traducao = "{:06b}".format(instr_32_bits.op_code)
    traducao += "{:05b}".format(instr_32_bits.rs)
    traducao += "{:05b}".format(instr_32_bits.rt)
    traducao += "{:05b}".format(instr_32_bits.rd)
    traducao += "{:05b}".format(instr_32_bits.sa)
    traducao += "{:06b}".format(instr_32_bits.function)
  print(bin_hex(traducao))
while(True):
  try:
    instrucao = list(input().split())
    monta_executavel(instrucao)
  except:
    break