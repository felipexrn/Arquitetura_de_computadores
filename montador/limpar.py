def lixo(linha):
  linha = linha.replace(",", " ")
  linha = linha.replace("  ", " ")
  comentario = linha.count('#')
  if comentario > 0:
    linha = linha[:linha.index('#')] + " "
  ponto = linha.count('.')
  if ponto > 0:
    try:
      linha = linha.replace(".text", " ")
    except:
      pass
    try:
      linha = linha.replace(".data", " ")
    except:
      pass
  return linha