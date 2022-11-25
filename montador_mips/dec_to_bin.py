def get_bin(padrao):
  binario = "{:06b}".format(padrao["op_code"])
  if padrao["padrao"] == "J":
    binario += "{:026b}".format(padrao["function"])
  else:
    binario += "{:05b}".format(padrao["rs"])
    binario += "{:05b}".format(padrao["rt"])
    if padrao["padrao"] == "I":
      if padrao["function"] < 0:
        for i in range(16):
          binario += str(padrao["function"] >> 15-i & 1)
      else:
        binario += "{:016b}".format(padrao["function"])
    else:
      binario += "{:05b}".format(padrao["rd"])
      binario += "{:05b}".format(padrao["sa"])
      binario += "{:06b}".format(padrao["function"])
  return binario