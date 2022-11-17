import monta_instrucao, dec_to_bin, bin_to_hex, clean_line
linhas = []
linha = 0

while(True):
  try:
    linha_atual, linhas = clean_line.get_clean_line(input(), linhas)
    if len(linha_atual) > 0:
      linha += 1
      instrucao = linha_atual
      no, op, rs, rt, rd, sa, fu, pa = monta_instrucao.get_instrucao(instrucao)
      binario = dec_to_bin.get_bin(op, rs, rt, rd, sa, fu, pa)
      hexadecimal = bin_to_hex.get_hex(binario)
      print(hexadecimal)
  except:
    #print(linhas)
    break