import limpar
print("Escreva o nome do arquivo a ser lido.")
caminho = input()
programa = open(caminho)

while(True):
  linha = programa.readline().rstrip()
  linha = limpar.lixo(linha)
  print(linha)
  if linha == "":
    break
programa.close()