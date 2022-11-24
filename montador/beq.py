import linhas
caminho = input()
programa = open(caminho)
instrucoes = []

while(True):
  linha = programa.readline().rstrip()
  linha, instrucoes = linhas.contar(linha, instrucoes)
  if linha == "":
    break

print(instrucoes)

programa.close()