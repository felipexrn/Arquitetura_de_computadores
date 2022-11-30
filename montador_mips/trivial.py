from limpar import limpar
import programa
from padroes import padrao
from montar import montar
from converter import get_bin
from converter import bin_to_hex
from linhas import linhas
from programa import get_linha
from programa import get_index_rotulo
from programa import get_programa

dicionario = open("./montador_mips/dic_linhas.py", "w")

instrucoes = linhas() # limpa linhas
for linha in instrucoes:
  padrao_mips = padrao(linha[1][0]) # retorna padrão mips da istrução
  if "inválida" in padrao_mips:
    print(padrao_mips)
    exit(0) # encerra programa se houver istrução inválida
  else: 
    dicionario.write(str(get_linha(linha[-1]))+"\n") # escreve arquivo de banco de dados
    instrucao = montar(linha[1], padrao_mips, linha) # monta instrução 
    binario = get_bin(instrucao) # converte para binário 32 bits
    hexadecimal = bin_to_hex(binario) # converte para hex 8 bits
    print(hexadecimal)
    
dicionario.close()