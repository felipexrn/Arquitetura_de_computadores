def get_hex(binario):
  hexadecimal = ""
  bin = binario
  for i in range(8):
    dec = 0
    quatro_bits = bin[:4]
    p = 0
    for j in range(4):
      dec += int(quatro_bits[3 - j]) * (2**p)
      p += 1
    hexadecimal += "{:x}".format(dec)
    bin = bin[4:]
  return hexadecimal