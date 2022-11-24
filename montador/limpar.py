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
  dois_pontos = linha.count(':')
  if dois_pontos > 0:
    dois_pontos = linha.index(':')
    linha = linha[dois_pontos + 1:] + " "
  return linha