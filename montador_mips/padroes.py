no = op = rs = rt = rd = sa = fu = 0
add = {
  "nome": "add",
  "op_code": 0,
  "rs": -1,
  "rt": -1,
  "rd": -1,
  "sa": 0,
  "function": 32
}
instrucao = [add]
no = instrucao[0]["nome"]
op = instrucao[0]["op_code"]
rs = instrucao[0]["rs"]
rt = instrucao[0]["rt"]
rd = instrucao[0]["rd"]
sa = instrucao[0]["sa"]
fu = instrucao[0]["function"]
print(no, op, rs, rt, rd, sa, fu)