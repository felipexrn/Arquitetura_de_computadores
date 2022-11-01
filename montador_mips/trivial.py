import padroes 
def dec_bin(op, rs, rt, rd, sa, fu, pa):
  binario = "{:06b}".format(op)
  binario += "{:05b}".format(rs)
  binario += "{:05b}".format(rt)
  if pa == "I":
    binario += "{:016b}".format(fu)
  else:
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
  
def monta_instrucao(instrucao):
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

while(True):
  try:
    instrucao = list(input().replace("$", "").split())
    no, op, rs, rt, rd, sa, fu, pa = monta_instrucao(instrucao)
    binario = dec_bin(op, rs, rt, rd, sa, fu, pa)
    hexadecimal = bin_hex(binario)
    print(hexadecimal)
  except:
    break