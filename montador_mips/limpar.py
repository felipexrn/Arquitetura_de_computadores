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
  if linha.count("'") > 0:
    id_char = linha.index("'")
    linha = linha[:id_char] + linha[id_char + 1:]
    id_aspas = linha.index("'")
    char = linha[id_char:id_aspas]
    linha = linha[:id_char]
    if char == repr("\n"):
      char = "10"
      linha += char
    else:
      linha += str(ord(char))
  
  linha = linha.split() # string list linha 

  for valor in linha:
    valor = registradores(valor) # remove nome dos registradores
  
  return linha # string list linha 

def remove_dois_pontos(rotulo):
  return rotulo.replace(":", "") # remove dois pontos
  