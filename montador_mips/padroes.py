def get_padrao(nome_instrucao):
  _add = {
    "nome": "add",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0,
    "function": 32,
    "padrao": "R"
  }
  _addi = {
    "nome": "addi",
    "op_code": 8,
    "rs": "$",
    "rt": "$",
    "rd": 0,
    "sa": 0,
    "function": "imediato",
    "padrao": "I"
  }
  _addiu = {
    "nome": "addiu",
    "op_code": 9,
    "rs": "$",
    "rt": "$",
    "rd": 0,
    "sa": 0,
    "function": "imediato",
    "padrao": "I"
  }
  _addu = {
    "nome": "addu",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0,
    "function": 33,
    "padrao": "R"
  }
  _and = {
    "nome": "and",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0,
    "function": 36,
    "padrao": "R"
  }
  _andi = {
    "nome": "andi",
    "op_code": 12,
    "rs": "$",
    "rt": "$",
    "rd": 0,
    "sa": 0,
    "function": "imediato",
    "padrao": "I"
  }
  _div = {
    "nome": "div",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": 0,
    "sa": 0,
    "function": 26,
    "padrao": "Dupla"
  }
  _divu = {
    "nome": "divu",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": 0,
    "sa": 0,
    "function": 27,
    "padrao": "Dupla"
  }
  _mul = {
    "nome": "mul",
    "op_code": 28,
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0,
    "function": 2,
    "padrao": "R"
  }
  _mult = {
    "nome": "mult",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": 0,
    "sa": 0,
    "function": 24,
    "padrao": "Dupla"
  }
  _multu = {
    "nome": "multu",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": 0,
    "sa": 0,
    "function": 25,
    "padrao": "Dupla"
  }
  _nop = {
    "nome": "nop",
    "op_code": 0,
    "rs": 0,
    "rt": 0,
    "rd": 0,
    "sa": 0,
    "function": 0,
    "padrao": "R"
  }
  _nor = {
    "nome": "nor",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0,
    "function": 39,
    "padrao": "R"
  }
  _or = {
    "nome": "or",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0,
    "function": 37,
    "padrao": "R"
  }
  _ori = {
    "nome": "ori",
    "op_code": 13,
    "rs": "$",
    "rt": "$",
    "rd": 0,
    "sa": 0,
    "function": "imediato",
    "padrao": "I"
  }
  _sll = {
    "nome": "sll",
    "op_code": 0,
    "rs": 0,
    "rt": "$",
    "rd": "$",
    "sa": "numero",
    "function": 0,
    "padrao": "Sa"
  }
  _slt = {
    "nome": "slt",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0,
    "function": 42,
    "padrao": "R"
  }
  _slti = {
    "nome": "slti",
    "op_code": 10,
    "rs": "$",
    "rt": "$",
    "rd": 0,
    "sa": 0,
    "function": "imediato",
    "padrao": "I"
  }
  _sltiu = {
    "nome": "sltiu",
    "op_code": 11,
    "rs": "$",
    "rt": "$",
    "rd": 0,
    "sa": 0,
    "function": "imediato",
    "padrao": "I"
  }
  _sltu = {
    "nome": "sltu",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0,
    "function": 43,
    "padrao": "R"
  }
  _sra = {
    "nome": "sra",
    "op_code": 0,
    "rs": 0,
    "rt": "$",
    "rd": "$",
    "sa": "numero",
    "function": 3,
    "padrao": "Sa"
  }
  _srl = {
    "nome": "srl",
    "op_code": 0,
    "rs": 0,
    "rt": "$",
    "rd": "$",
    "sa": "numero",
    "function": 2,
    "padrao": "Sa"
  }
  _sub = {
    "nome": "sub",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0,
    "function": 34,
    "padrao": "R"
  }
  _subu = {
    "nome": "subu",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0,
    "function": 35,
    "padrao": "R"
  }
  _syscall = {
    "nome": "syscall",
    "op_code": 0,
    "rs": 0,
    "rt": 0,
    "rd": 0,
    "sa": 0,
    "function": 12,
    "padrao": "R"
  }
  _xor = {
    "nome": "xor",
    "op_code": 0,
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0,
    "function": 38,
    "padrao": "R"
  }
  _xori = {
    "nome": "xori",
    "op_code": 14,
    "rs": "$",
    "rt": "$",
    "rd": 0,
    "sa": 0,
    "function": "imediato",
    "padrao": "I"
  }

  instrucao = [_add, _addi, _addiu, _addu, _and, _andi, _div, _divu, _mul, _mult, _multu, _nop, _nor, _or, _ori, _sll, _slt, _slti, _sltiu, _sltu, _sra, _srl, _sub, _subu, _syscall, _xor, _xori]
  
  id = 0
  for i in range(len(instrucao)):
    if instrucao[i]["nome"] == nome_instrucao:
      id = i
      break
  no = instrucao[id]["nome"]
  op = instrucao[id]["op_code"]
  rs = instrucao[id]["rs"]
  rt = instrucao[id]["rt"]
  rd = instrucao[id]["rd"]
  sa = instrucao[id]["sa"]
  fu = instrucao[id]["function"]
  pa = instrucao[id]["padrao"] # R, I, Dupla, Sa
  
  return no, op, rs, rt, rd, sa, fu, pa

