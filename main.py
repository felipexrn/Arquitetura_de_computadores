def dec_to_bin(decimal, bits):
  binario = ""
  for i in range(bits):
    binario += str(decimal >> bits - 1 -i & 1)
  print(binario)

dec_to_bin(4521, 16)