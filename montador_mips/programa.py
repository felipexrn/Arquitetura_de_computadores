programa = {} # dicionário onde armazeno as linhas do programa

# lista com [int linha, string rotulo, list instrucao ["add", "$2", "$2", "$2"], int linha, string padrao]

def add_linha(linha): # adiciona linha já tratada ao programa
  programa[linha[2]] = { # int linha
    "rotulo": linha[0], # string rotulo
    "instrucao": linha[1], # list instrucao [str, int, int ,int]
    "linha": linha[2], # int linha
    #"padrao": linha[3] # padrao de instrução
  }
  
def get_programa():
  return programa # dicionário do programa com linhas indexadas

def get_linha(valor): # retorna uma linha pelo éndice
  return programa[valor]

def get_index_rotulo(rotulo): # retorna índice pelo rótulo
  indice = "inexistente"
  for key in programa:
    if programa[key]["rotulo"] == rotulo:
      indice = programa[key]["linha"]
  return indice 
