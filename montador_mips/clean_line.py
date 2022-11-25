import padroes
def get_clean_line(linha_suja, linhas):
  linha_limpa = linha_suja
  linha_limpa = linha_limpa.replace("$", " ")
  linha_limpa = linha_limpa.replace(",", " ")
  try:
    id_comentario = linha_limpa.index("#")
    linha_limpa = linha_limpa[:id_comentario] + " "
  except:
    pass
  try:
    if linha_limpa[-1] == "\n":
      linha_limpa = linha_limpa[:-1] = " "
  except:
    pass
  try:
    id_rotulo = linha_limpa.index(":")
    linhas.append(linha_limpa[:id_rotulo]) # é sério que vou ter que ler o arquivo todo pra traduzir beq? 
    linha_limpa = linha_limpa[id_rotulo + 1:] + " "
  except:
    linhas.append(0)
    pass
  try:
    if linha_limpa == ".text" or linha_limpa == ".data":
      linha_limpa = " "
  except:
    pass
  linha_limpa = linha_limpa.split()
  try:
    for key, value in padroes.registradores().items():
      for i in range(len(linha_limpa)):
        if key == linha_limpa[i]:
          linha_limpa[i] = value
  except:
    pass
  return linha_limpa, linhas