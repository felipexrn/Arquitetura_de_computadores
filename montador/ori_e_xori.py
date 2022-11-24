import limpar, linhas
print("Escreva o nome do arquivo a ser lido.")
programa = open(input())
instrucoes = []

while(True):
  linha = programa.readline().rstrip()
  linha = linhas.contar(linha, intrucoes)
  if linha == "":
    break

programa.close()

while(True):
  linha = programa.readline().rstrip()
  linha = limpar.lixo(linha)
  linha, instrucao = linhas.contar(linha)
  print(linha)
  if linha == "":
    break
programa.close()