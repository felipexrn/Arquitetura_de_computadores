linha = 0
correto = 0
mips = open("./montador_mips/traducao_mars.txt")
montador = open("./montador_mips/traducao_montador.txt")
while (True):
  base = mips.readline().rstrip()
  teste = montador.readline().rstrip()
  if base == "" and teste == "":
    break
  else:
    linha += 1
  if linha < 10:
    zero = "0"
  else:
    zero = ""      
  if base == teste:
    print(f"Linha {zero}{linha} está correta: {teste}")
    correto += 1
  else:
    print(f"Linha {linha} está ERRADA: {teste} != {base}")
mips.close()
montador.close()
print(str(int(correto/linha*100))+"% de acerto")
