import monta_instrucao, dec_to_bin, bin_to_hex, clean_line, padroes
linhas = []
linha = 0

instrucoes = open("instrucoes_base.txt")
lines = []
line  = 1
while True:
  texto = instrucoes.readline().rstrip()
  if texto.count(":") > 0: 
    lines.append(texto[:texto.index(":")])
  else: lines.append(line)
  line += 1
  if texto == "":
    #print(lines)
    break
instrucoes.close()

while(True):
  #try:
    linha_atual, linhas = clean_line.get_clean_line(input(), linhas)
    if len(linha_atual) > 0:
      linha += 1
      instrucao = padroes.get_padrao(linha_atual[0])
      if "inválida" in instrucao:
        print(instrucao)
        exit(0)
      else:

        # tratar beq, bne e j aqui
          
        instrucao = monta_instrucao.get_instrucao(linha_atual, instrucao)
        binario = dec_to_bin.get_bin(instrucao)
        hexadecimal = bin_to_hex.get_hex(binario)
        print(hexadecimal)
  #except:
    #print(linhas)
    #break