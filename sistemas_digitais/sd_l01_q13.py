# SD_L01_Q13
tabela6Bits = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
# mensagemOriginal = "SISTEMAS DIGITAIS foi a melhor disciplina do primeiro semestre de TADS"
mensagemBinario = ascii = dec6Bits = mensagemCodificada = codificar = ""

def telaInicial():
  print("Digite 'c' para codificar uma mensagem")
  print("Digite 'd' para decodificar uma mensagem")
  print("Digite qualquer outro caracter para sair")
  return input()

def converteOrdAscii(listaOriginal):
  listaConvertida = ""
  for i in listaOriginal:
    listaConvertida += str(ord(i))
  return listaConvertida
  
def converteBinario(listaOriginal, bits):
  formato = "{:0" + str(bits) + "b}"
  listaConvertida = ""
  for i in listaOriginal:
    listaConvertida += formato.format(ord(i))
  return listaConvertida
  
def converteCanalBits(ListaBinario, bits):
  decBits = mensagemCodificada = ""
  while len(ListaBinario) > 0:
    canal6bits = ListaBinario[:bits]
    ListaBinario = ListaBinario[bits:]
    mensagemCodificada += tabela6Bits[int(canal6bits, 2)]
    decBits += str(int(canal6bits, 2))
  return decBits, mensagemCodificada

codificar = telaInicial()

if codificar == "c":
  print("Escreva uma mesagem para codificá-la")
  mensagemOriginal = input()
  
  print("Mensagem original:")
  print(mensagemOriginal)
  print()

  ascii = converteOrdAscii(mensagemOriginal)

  print("Mensagem original convertida para valores decimais em ascii:")
  print(ascii)
  print()
  
  mensagemBinario = converteBinario(mensagemOriginal, 8)
  
  print("Valores ascci convertidos para Binário de 8 Bits")
  print(mensagemBinario)
  print()
  
  dec6Bits, mensagemCodificada = converteCanalBits(mensagemBinario, 6)
  
  print("Valores em binário de 8 Bits convertido para decimais da tabela de 6 Bits:")
  print(dec6Bits)
  print()
  
  print("Mensagem codificada:")
  print(mensagemCodificada)
  print()

  mensagemBinario = ascii = dec6Bits = mensagemCodificada = codificar = mensagemOriginal = ""
  
  codificar = telaInicial()
    
if codificar == "d":
  print("Escreva uma mesagem para decodificá-la")
  mensagemCodificada = input()
  print("Mensagem Codificada:")
  print(mensagemCodificada)
  print()

  formato = "{:0" + str(6) + "b}"
  for i in mensagemCodificada:
    dec6Bits += str(tabela6Bits.find(i))
    mensagemBinario += formato.format(tabela6Bits.find(i))
  
  print("dec6Btis:")
  print(dec6Bits)
  print()

  print("mensagemBinario:")
  print(mensagemBinario)
  print()

  mensagemOriginal = ""
  
  while len(mensagemBinario) > 0:
    canal8bits = mensagemBinario[:8]
    mensagemBinario = mensagemBinario[8:]
    mensagemOriginal += chr(int(canal8bits, 2))

  print("mensagemOriginal:")
  print(mensagemOriginal)
  print()

  mensagemBinario = ascii = dec6Bits = mensagemCodificada = codificar = mensagemOriginal = ""

  codificar = telaInicial()
  
if codificar != "d" and codificar != "c":
  print("O programa foi encerrado")