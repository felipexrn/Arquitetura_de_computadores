import padroes
def get_instrucao(instrucao, padrao):
  if padrao["padrao"] == "D": # padrão D
    padrao["rs"] = int(instrucao[1])
    padrao["rt"] = int(instrucao[2])
  elif padrao["padrao"] == "N": # nop e syscall
    pass
  elif padrao["padrao"] == "S": # padrão S
    padrao["rt"] = int(instrucao[2])
    padrao["rd"] = int(instrucao[1])
    padrao["sa"] = int(instrucao[3])
  elif padrao["padrao"] == "I": # padrão I
    padrao["rs"] = int(instrucao[2])
    padrao["rt"] = int(instrucao[1])
    padrao["function"] = int(instrucao[3])    
  elif padrao["padrao"] == "R": # padrão R
    padrao["rs"] = int(instrucao[2])
    padrao["rt"] = int(instrucao[3])
    padrao["rd"] = int(instrucao[1])
  elif padrao["padrao"] == "J": # padrão J
    padrao["function"] = int(instrucao[1]) 
  return padrao