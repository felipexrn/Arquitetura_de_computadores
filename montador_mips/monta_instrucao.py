import padroes
def get_instrucao(instrucao):
  no, op, rs, rt, rd, sa, fu, pa = padroes.get_padrao(instrucao[0])
  if pa == "Dupla": # Dois registradores
    rs = int(instrucao[1])
    rt = int(instrucao[2])
  elif no == "nop": # nop
    pass
  elif no == "syscall": # syscall
    pass
  elif pa == "Sa": # sa
    rt = int(instrucao[2])
    rd = int(instrucao[1])
    sa = int(instrucao[3])
  elif pa == "I": # padrão I
    rs = int(instrucao[2])
    rt = int(instrucao[1])
    fu = int(instrucao[3])    
  elif pa == "R": # padrão R
    rs = int(instrucao[2])
    rt = int(instrucao[3])
    rd = int(instrucao[1])
  return no, op, rs, rt, rd, sa, fu, pa