def registradores():
  nomes = {
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
  return nomes

def get_padrao(nome):
  instrucoes = {
    "add": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": "$",
      "sa": 0, #00000
      "function": 32, #100000
      "padrao": "R"
    },
    "addi": {
      "op_code": 8, #001000
      "rs": "$",
      "rt": "$",
      "rd": "", 
      "sa": "", 
      "function": "imediato",
      "padrao": "I"
    },
    "addiu": {
      "op_code": 9, #001001
      "rs": "$",
      "rt": "$",
      "rd": "", 
      "sa": "", 
      "function": "imediato",
      "padrao": "I"
    },
    "addu": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": "$",
      "sa": 0, #00000
      "function": 33, #100001
      "padrao": "R"
    },
    "and": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": "$",
      "sa": 0, #00000
      "function": 36, #100100
      "padrao": "R"
    },
    "andi": {
      "op_code": 12, #001100
      "rs": "$",
      "rt": "$",
      "rd": "", 
      "sa": "", 
      "function": "imediato",
      "padrao": "I"
    },
    "div": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": 0, #00000
      "sa": 0, #00000
      "function": 26, #011010
      "padrao": "D"
    },
    "divu": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": 0, #00000
      "sa": 0, #00000
      "function": 27, #011011
      "padrao": "D"
    },
    "mul": {
      "op_code": 28, #011100
      "rs": "$",
      "rt": "$",
      "rd": "$",
      "sa": 0, #00000
      "function": 2, #000010
      "padrao": "R"
    },
    "mult": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": 0, #00000
      "sa": 0, #00000
      "function": 24, #011000
      "padrao": "D"
    },
    "multu": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": 0, #00000
      "sa": 0, #00000
      "function": 25, #011001
      "padrao": "D"
    },
    "nop": {
      "op_code": 0, #000000
      "rs": 0, #00000
      "rt": 0, #00000
      "rd": 0, #00000
      "sa": 0, #00000
      "function": 0, #000000
      "padrao": "N"
    },
    "nor": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": "$",
      "sa": 0, #00000
      "function": 39, #100111
      "padrao": "R"
    },
    "or": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": "$",
      "sa": 0, #00000
      "function": 37, #100101
      "padrao": "R"
    },
    "ori": {
      "op_code": 13, #001101
      "rs": "$",
      "rt": "$",
      "rd": "", 
      "sa": "", 
      "function": "imediato",
      "padrao": "I"
    },
    "sll": {
      "op_code": 0, #000000
      "rs": 0, #00000
      "rt": "$",
      "rd": "$",
      "sa": "numero",
      "function": 0, #000000
      "padrao": "S"
    },
    "slt": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": "$",
      "sa": 0, #00000
      "function": 42, #101010
      "padrao": "R"
    },
    "slti": {
      "op_code": 10, #001010
      "rs": "$",
      "rt": "$",
      "rd": "", 
      "sa": "", 
      "function": "imediato",
      "padrao": "I"
    },
    "sltiu": {
      "op_code": 11, #001011
      "rs": "$",
      "rt": "$",
      "rd": "", 
      "sa": "", 
      "function": "imediato",
      "padrao": "I"
    },
    "sltu": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": "$",
      "sa": 0, #00000
      "function": 43, #101011
      "padrao": "R"
    },
    "sra": {
      "op_code": 0, #000000
      "rs": 0, #00000
      "rt": "$",
      "rd": "$",
      "sa": "numero",
      "function": 3, #000011
      "padrao": "S"
    },
    "srl": {
      "op_code": 0, #000000
      "rs": 0, #00000
      "rt": "$",
      "rd": "$",
      "sa": "numero",
      "function": 2, #000010
      "padrao": "S"
    },
    "sub": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": "$",
      "sa": 0, #00000
      "function": 34, #100010
      "padrao": "R"
    },
    "subu": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": "$",
      "sa": 0, #00000
      "function": 35, #100011
      "padrao": "R"
    },
    "syscall": {
      "op_code": 0, #000000
      "rs": 0, #00000
      "rt": 0, #00000
      "rd": 0, #00000
      "sa": 0, #00000
      "function": 12, #001100
      "padrao": "N"
    },
    "xor": {
      "op_code": 0, #000000
      "rs": "$",
      "rt": "$",
      "rd": "$",
      "sa": 0, #00000
      "function": 38, #100110
      "padrao": "R"
    },
    "xori": {
      "op_code": 14, #001110
      "rs": "$",
      "rt": "$",
      "rd": "", 
      "sa": "", 
      "function": "imediato",
      "padrao": "I"
    },
    "beq": {
      "op_code": 4, #000100
      "rs": "$",
      "rt": "$",
      "rd": "", 
      "sa": "", 
      "function": "imediato",
      "padrao": "I"
    },
    "bne": {
      "op_code": 5, #000101
      "rs": "$",
      "rt": "$",
      "rd": "", 
      "sa": "", 
      "function": "imediato",
      "padrao": "I"
    },
    "j": {
      "op_code": 2, #000010
      "rs": "",
      "rt": "",
      "rd": "", 
      "sa": "", 
      "function": "instr_index",
      "padrao": "J"
    }
  }
  if nome in instrucoes:
    return instrucoes[nome]
  else:
    return f"instrução {nome} inválida"
