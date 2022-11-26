def bin_to_hex(binario):
  return format(int(binario, 2), "08x")

def dec_to_bin(numero, bits):
  binario = ""
  for i in range(bits):
    binario += str(numero >> (bits - 1) - i & 1)
  return binario

def get_bin(padrao):
  binario = "{:06b}".format(padrao["op_code"])
  if padrao["padrao"] == "J":
    binario += "{:026b}".format(padrao["function"])
  else:
    binario += "{:05b}".format(padrao["rs"])
    binario += "{:05b}".format(padrao["rt"])
    if padrao["padrao"] == "I":
      binario += dec_to_bin(padrao["function"], 16)
    else:
      binario += "{:05b}".format(padrao["rd"])
      binario += "{:05b}".format(padrao["sa"])
      binario += "{:06b}".format(padrao["function"])
  return binario