# 11 instruções R [6,rs,rt,rd,5,6] 
# 7 instruções I [6,rs,rt,16]
# 1 instrução nop 0 [6,5,5,5,5,6]
# 1 instrução syscall [6,20,01100]
# 4 instruções [6,rs,rt,10,6]
# 3 instruções [6,5,rt,rd,sa,6] 

class Instrucao: 
  def __init__(self, nome, op_code, rs, rt, rd, sa, function):
    self.nome = nome
    self.op_code = op_code
    self.rs = rs
    self.rt = rt
    self.rd = rd
    self.sa = sa
    self.function = function
    
nop = Instrucao("nop",0,0,0,0,0,0)
    
def verifica_istrucao(instrucao):
  
  instrucoes = ["add", "addi", "addiu", "addu", "and", "andi", "div", "divu", "mul", "mult", "multu", "nop", "nor", "or", "ori", "sll", "slt", "slti", "sltiu", "sltu", "sra", "srl", "sub", "subu", "syscall", "xor", "xori"]
  op_code = [0, 8, 9, 0, 0, 12, 0, 0, 28, 0, 0, 0, 0, 0, 13, 0, 0, 10, 11, 0, 0, 0, 0, 0, 0, 0, 14]
  func = [32,instrucao, instrucao, 33, 36, instrucao, 26, 27, 2, 24, 25, 0, 39, 37, instrucao, 0, 42, instrucao, instrucao, 43, 3, 2, 34, 35, 12, 38, instrucao]
  if(instrucao[0] == instrucoes[6] or instrucao[0] == instrucoes[7] or instrucao[0] == instrucoes[9] or instrucao[0] == instrucoes[10]):
    duplo = Instrucao(instrucao[0], op_code[instrucoes.index(instrucao[0])], rs, rt, rd,sa, function)
    duplo + 0
  
  for i in range(len(instrucoes)):
    if instrucao == instrucoes[i]:
      return [op_code[i], func[i]]
  
while(True):
  try:
    instrucao = list(input().split())
    inst = verifica_istrucao(instrucao)
    print(*inst)
  except:
    break
  
