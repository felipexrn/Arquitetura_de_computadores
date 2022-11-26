from programa import get_index_rotulo

def montar(instrucao, padrao, linha):
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
    if instrucao[0] == "bne" or instrucao[0] == "beq":
      if get_index_rotulo(instrucao[3]) == "inexistente":
        print(f"{instrucao[3]} inexistente")
        return exit(0)
      padrao["function"] = get_index_rotulo(instrucao[3]) - linha[-1] - 1
    else:
      padrao["function"] = int(instrucao[3])    
  elif padrao["padrao"] == "R": # padrão R
    padrao["rs"] = int(instrucao[2])
    padrao["rt"] = int(instrucao[3])
    padrao["rd"] = int(instrucao[1])
  elif padrao["padrao"] == "J": # padrão J
    if get_index_rotulo(instrucao[1]) == "inexistente":
        print(f"{instrucao[1]} inexistente")
        return exit(0)
    padrao["function"] = (0x00400000 + get_index_rotulo(instrucao[1]) * 4) >> 2
  return padrao