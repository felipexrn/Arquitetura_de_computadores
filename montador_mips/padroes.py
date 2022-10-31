no = op = rs = rt = rd = sa = fu = 0
_add = {
  "nome": "add",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 32
}
_addi = {
  "nome": "addi",
  "op_code": 8,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": "imediato"
}
_addiu = {
  "nome": "addiu",
  "op_code": 9,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": "imediato"
}
_addu = {
  "nome": "addu",
  "op_code": 9,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 33
}
_and = {
  "nome": "and",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 36
}
_andi = {
  "nome": "andi",
  "op_code": 12,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": "imediato"
}
_div = {
  "nome": "div",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": 26
}
_divu = {
  "nome": "divu",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": 27
}
_mul = {
  "nome": "mul",
  "op_code": 28,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 2
}
_mult = {
  "nome": "mult",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": 24
}
_multu = {
  "nome": "multu",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": 25
}
_nop = {
  "nome": "multu",
  "op_code": 0,
  "rs": 0,
  "rt": 0,
  "rd": 0,
  "sa": 0,
  "function": 0
}
_nor = {
  "nome": "nor",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 39
}
_or = {
  "nome": "or",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 37
}
_ori = {
  "nome": "ori",
  "op_code": 13,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": "imediato"
}
_sll = {
  "nome": "sll",
  "op_code": 0,
  "rs": 0,
  "rt": "$",
  "rd": "$",
  "sa": "numero",
  "function": 0
}
_slt = {
  "nome": "slt",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 42
}
_slti = {
  "nome": "slti",
  "op_code": 10,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": "imediato"
}
_sltiu = {
  "nome": "sltiu",
  "op_code": 11,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": "imediato"
}
_sltu = {
  "nome": "sltu",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 43
}
_sra = {
  "nome": "sra",
  "op_code": 0,
  "rs": 0,
  "rt": "$",
  "rd": "$",
  "sa": "numero",
  "function": 3
}
_srl = {
  "nome": "srl",
  "op_code": 0,
  "rs": 0,
  "rt": "$",
  "rd": "$",
  "sa": "numero",
  "function": 2
}
_sub = {
  "nome": "sub",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 34
}
_subu = {
  "nome": "subu",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 35
}
_syscall = {
  "nome": "syscall",
  "op_code": 0,
  "rs": 0,
  "rt": 0,
  "rd": 0,
  "sa": 0,
  "function": 12
}
_xor = {
  "nome": "xor",
  "op_code": 0,
  "rs": "$",
  "rt": "$",
  "rd": "$",
  "sa": 0,
  "function": 38
}
_xori = {
  "nome": "xori",
  "op_code": 14,
  "rs": "$",
  "rt": "$",
  "rd": 0,
  "sa": 0,
  "function": "imediato"
}
instrucao = [_add, _addi, _addiu, _addu, _and, _andi, _div, _divu, _mul, _mult, _multu, _nop, _nor, _or, _ori, _sll, _slt, _slti, _sltiu, _sltu, _sra, _srl, _sub, _subu, _syscall, _xor, _xori]

i = 0
no = instrucao[i]["nome"]
op = instrucao[i]["op_code"]
rs = instrucao[i]["rs"]
rt = instrucao[i]["rt"]
rd = instrucao[i]["rd"]
sa = instrucao[i]["sa"]
fu = instrucao[i]["function"]


print(no, op, rs, rt, rd, sa, fu)

