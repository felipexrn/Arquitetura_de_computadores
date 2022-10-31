no = op = rs = rt = rd = sa = fu = 0
add = {
  "nome": "add",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 32
}
addi = {
  "nome": "addi",
  "op_code": 8,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": "num"
}
addiu = {
  "nome": "addi",
  "op_code": 9,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": "num"
}
instrucao = [add, addi, addiu, "addu", "and", "andi", "div", "divu", "mul", "mult", "multu", "nop", "nor", "or", "ori", "sll", "slt", "slti", "sltiu", "sltu", "sra", "srl", "sub", "subu", "syscall", "xor", "xori"]

i = 0
no = instrucao[i]["nome"]
op = instrucao[i]["op_code"]
rs = instrucao[i]["rs"]
rt = instrucao[i]["rt"]
rd = instrucao[i]["rd"]
sa = instrucao[i]["sa"]
fu = instrucao[i]["function"]


print(no, op, rs, rt, rd, sa, fu)