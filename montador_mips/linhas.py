def contar(linha, instrucoes):
  dois_pontos = linha.count(':')
  instrucao = 0
  if dois_pontos > 0:
    dois_pontos = linha.index(':')
    instrucao = linha[:dois_pontos]
    linha = linha[dois_pontos + 1:] + " "
  instrucoes.append(instrucao)
  return linha, instrucoes