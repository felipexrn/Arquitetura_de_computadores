linha = 0
correto = 0
errado = 0
mips = open("traducao_mips.txt")
montador = open("traducao_montador.txt")
while (linha <= 27):
  try:
    linha += 1
    base = mips.readline().rstrip()
    teste = montador.readline().rstrip()
    if linha < 10:
      zero = "0"
    else:
      zero = ""      
    if base == teste:
      print(f"Linha {zero}{linha} está correta: {base}")
      correto += 1
    else:
      print(f"Linha {linha} está ERRADA: {base} != {teste}")
  except:
    break
mips.close()
montador.close()
print(str(int(correto/linha*100))+"% de acerto")
