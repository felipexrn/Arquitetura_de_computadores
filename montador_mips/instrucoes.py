programa = {} # dicionário onde armazeno as linhas do programa

# lista com [int linha, string rotulo, list instrucao ["add", "$2", "$2", "$2"], int linha, string padrao]

def add_linha(linha): 
  programa[linha[0]] = {
    "rotulo": linha[1],
    "instrucao": linha[2],
    "linha": linha[3],
    "padrao": linha[4]
  }
  return programa

def get_linha(valor):
  return programa[valor]

def get_ind_rotulo(rotulo):
  indice = "inexistente"
  for key in programa:
    if programa[key]["rotulo"] == rotulo:
      indice = programa[key]["linha"]
  return indice 

add_linha([1,"main",["addi", "$8", "$0", "4"], 1, "I"])
add_linha([2,"",["add", "$3", "$8", "$2"], 2, "R"])
add_linha([3,"prn",["div", "$2", "$2"], 3, "D"])
add_linha([4,"",["sll", "$3", "$2", "31"], 4, "A"])
add_linha([5,"",["nop"], 5, "N"])
add_linha([6,"end",["addi", "$2", "$0", "10"], 6, "I"])
add_linha([7,"",["syscall"], 7, "N"])

print(get_linha(6)["linha"])
print(get_ind_rotulo("prn"))