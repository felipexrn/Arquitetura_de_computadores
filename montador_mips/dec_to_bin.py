def get_bin(op, rs, rt, rd, sa, fu, pa):
  
  binario = "{:06b}".format(op)
  binario += "{:05b}".format(rs)
  binario += "{:05b}".format(rt)
  if pa == "I":
    if fu < 0:
      bin = ""
      for i in range(16):
        binario += str(fu >> 15-i & 1)
    else:
      binario += "{:016b}".format(fu)
  else:
    binario += "{:05b}".format(rd)
    binario += "{:05b}".format(sa)
    binario += "{:06b}".format(fu)
  return binario