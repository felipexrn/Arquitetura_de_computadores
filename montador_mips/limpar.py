from padroes import registradores

def limpar(linha): # limpa linha do programa
  if linha.count("#") > 0:
    id_comentario = linha.index("#")
    linha = linha[:id_comentario] # remove comentário
    
  linha = linha.replace("$", " ") # remove sifrão
  linha = linha.replace(",", " ") # remove vírgula
  linha = linha.replace("  ", " ") # remove tabulação horizontal
  linha = linha.replace(".text", "") # remove .text
  linha = linha.replace(".data", "") # remove .data
  
  linha = linha.split() # string list linha 

  for valor in linha:
    valor = registradores(valor) # remove nome dos registradores
  
  return linha # string list linha 

def remove_dois_pontos(rotulo):
  return rotulo.replace(":", "") # remove dois pontos
  