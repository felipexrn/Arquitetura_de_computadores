def rotulos():
  rotulos = {
    "zero": 0,
    "at": 1,
    "v0": 2,
    "v1": 3,
    "a0": 4,
    "a1": 5,
    "a2": 6,
    "a3": 7,
    "t0": 8,
    "t1": 9,
    "t2": 10,
    "t3": 11,
    "t4": 12,
    "t5": 13,
    "t6": 14,
    "t7": 15,
    "s0": 16,
    "s1": 17,
    "s2": 18,
    "s3": 19,
    "s4": 20,
    "s5": 21,
    "s6": 22,
    "s7": 23,
    "t8": 24,
    "t9": 25,
    "k0": 26,
    "k1": 27,
    "gp": 28,
    "sp": 29,
    "fp": 30,
    "ra": 31
  }
  return rotulos

def get_padrao(nome_instrucao):
  _add = {
    "nome": "add",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0, #00000
    "function": 32, #100000
    "padrao": "R"
  }
  _addi = {
    "nome": "addi",
    "op_code": 8, #001000
    "rs": "$",
    "rt": "$",
    "rd": 0, #00000
    "sa": 0, #00000
    "function": "imediato",
    "padrao": "I"
  }
  _addiu = {
    "nome": "addiu",
    "op_code": 9, #001001
    "rs": "$",
    "rt": "$",
    "rd": 0, #00000
    "sa": 0, #00000
    "function": "imediato",
    "padrao": "I"
  }
  _addu = {
    "nome": "addu",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0, #00000
    "function": 33, #100001
    "padrao": "R"
  }
  _and = {
    "nome": "and",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0, #00000
    "function": 36, #100100
    "padrao": "R"
  }
  _andi = {
    "nome": "andi",
    "op_code": 12, #001100
    "rs": "$",
    "rt": "$",
    "rd": 0, #00000
    "sa": 0, #00000
    "function": "imediato",
    "padrao": "I"
  }
  _div = {
    "nome": "div",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": 0, #00000
    "sa": 0, #00000
    "function": 26, #011010
    "padrao": "Dupla"
  }
  _divu = {
    "nome": "divu",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": 0, #00000
    "sa": 0, #00000
    "function": 27, #011011
    "padrao": "Dupla"
  }
  _mul = {
    "nome": "mul",
    "op_code": 28, #011100
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0, #00000
    "function": 2, #000010
    "padrao": "R"
  }
  _mult = {
    "nome": "mult",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": 0, #00000
    "sa": 0, #00000
    "function": 24, #011000
    "padrao": "Dupla"
  }
  _multu = {
    "nome": "multu",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": 0, #00000
    "sa": 0, #00000
    "function": 25, #011001
    "padrao": "Dupla"
  }
  _nop = {
    "nome": "nop",
    "op_code": 0, #000000
    "rs": 0, #00000
    "rt": 0, #00000
    "rd": 0, #00000
    "sa": 0, #00000
    "function": 0, #000000
    "padrao": "R"
  }
  _nor = {
    "nome": "nor",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0, #00000
    "function": 39, #100111
    "padrao": "R"
  }
  _or = {
    "nome": "or",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0, #00000
    "function": 37, #100101
    "padrao": "R"
  }
  _ori = {
    "nome": "ori",
    "op_code": 13, #001101
    "rs": "$",
    "rt": "$",
    "rd": 0, #00000
    "sa": 0, #00000
    "function": "imediato",
    "padrao": "I"
  }
  _sll = {
    "nome": "sll",
    "op_code": 0, #000000
    "rs": 0, #00000
    "rt": "$",
    "rd": "$",
    "sa": "numero",
    "function": 0, #000000
    "padrao": "Sa"
  }
  _slt = {
    "nome": "slt",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0, #00000
    "function": 42, #101010
    "padrao": "R"
  }
  _slti = {
    "nome": "slti",
    "op_code": 10, #001010
    "rs": "$",
    "rt": "$",
    "rd": 0, #00000
    "sa": 0, #00000
    "function": "imediato",
    "padrao": "I"
  }
  _sltiu = {
    "nome": "sltiu",
    "op_code": 11, #001011
    "rs": "$",
    "rt": "$",
    "rd": 0, #00000
    "sa": 0, #00000
    "function": "imediato",
    "padrao": "I"
  }
  _sltu = {
    "nome": "sltu",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0, #00000
    "function": 43, #101011
    "padrao": "R"
  }
  _sra = {
    "nome": "sra",
    "op_code": 0, #000000
    "rs": 0, #00000
    "rt": "$",
    "rd": "$",
    "sa": "numero",
    "function": 3, #000011
    "padrao": "Sa"
  }
  _srl = {
    "nome": "srl",
    "op_code": 0, #000000
    "rs": 0, #00000
    "rt": "$",
    "rd": "$",
    "sa": "numero",
    "function": 2, #000010
    "padrao": "Sa"
  }
  _sub = {
    "nome": "sub",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0, #00000
    "function": 34, #100010
    "padrao": "R"
  }
  _subu = {
    "nome": "subu",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0, #00000
    "function": 35, #100011
    "padrao": "R"
  }
  _syscall = {
    "nome": "syscall",
    "op_code": 0, #000000
    "rs": 0, #00000
    "rt": 0, #00000
    "rd": 0, #00000
    "sa": 0, #00000
    "function": 12, #001100
    "padrao": "R"
  }
  _xor = {
    "nome": "xor",
    "op_code": 0, #000000
    "rs": "$",
    "rt": "$",
    "rd": "$",
    "sa": 0, #00000
    "function": 38, #100110
    "padrao": "R"
  }
  _xori = {
    "nome": "xori",
    "op_code": 14, #001110
    "rs": "$",
    "rt": "$",
    "rd": 0, #00000
    "sa": 0, #00000
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
