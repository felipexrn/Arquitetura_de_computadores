from limpar import limpar
from limpar import remove_dois_pontos
from programa import add_linha

def linhas():
  arquivo = "./montador_mips/instrucoes_base.txt" # arquivo a ser lido
  programa = open(arquivo, 'r') # abre arquivo 
  linhas = programa.read().split("\n") # list com separador \n 

  for i in range(len(linhas)):
    linhas[i] = limpar(linhas[i]) # limpa linha exceto ":"
  
  linhas = [linha for linha in linhas if linha != []]

  tamanho = len(linhas)
  indice = 0
  while(tamanho > 0):
    if len(linhas[indice]) == 1:
      if linhas[indice][0].count(":") > 0:
        linhas[indice] += linhas[indice + 1]
        del linhas[indice + 1]
        indice -= 1
    indice += 1
    tamanho -= 1
  
  for i in range(len(linhas)):
    if linhas[i][0] != "":
      if linhas[i][0].count(":") == 0:
        linhas[i] = [""] + linhas[i]
        
    if linhas[i][0].count(":") > 0:
      linhas[i][0] = remove_dois_pontos(linhas[i][0])
      
    linhas[i] = [linhas[i][0]] + [linhas[i][1:]]
    linhas[i].append(i)

    add_linha(linhas[i])

  programa.close()
  
  return linhas
