O arquivo do montador foi carinhosamente chamado de trivial.py
O arquivo para teste foi chamado de instrucoes_base.txt
O arquivo para comparar os resultados do mars e do montador foi chamado de comparador.py
O arquivo onde se encontram os padrões das instruções foi chamado de padroes.py

# Padrões encontrados nas 27 instruções da primeira etapa do projeto: 
# 11 instruções do tipo R [6,rs,rt,rd,5,6]
# 7 instruções do tipo I [6,rs,rt,16]
# 4 instruções do tipo Dupla [6,rs,rt,5,5,6]
# 3 instruções do tipo Sa [6,5,rt,rd,sa,6]
# 1 instrução nop [6,5,5,5,5,6]
# 1 instrução syscall [6,5,5,5,5,6]

Abaixo se encontram as três listas do meu raciocínio inicial para as 27 instruções da primeira etapa do projeto:

nome = ["add", "addi", "addiu", "addu", "and", "andi", "div", "divu", "mul", "mult", "multu", "nop", "nor", "or", "ori", "sll", "slt", "slti", "sltiu", "sltu", "sra", "srl", "sub", "subu", "syscall", "xor", "xori"]
op_code = [0, 8, 9, 0, 0, 12, 0, 0, 28, 0, 0, 0, 0, 0, 13, 0, 0, 10, 11, 0, 0, 0, 0, 0, 0, 0, 14]
function = [32,"imediato", "imediato", 33, 36, "imediato", 26, 27, 2, 24, 25, 0, 39, 37, "imediato", 0, 42, "imediato", "imediato", 43, 3, 2, 34, 35, 12, 38, "imediato"]

Uma ideia para leitura de arquivos complexos:
# linha = arquivo.readline().replace("$", "")
# try:
#   id_comentario = linha.index("#")
#   linha = linha[:id_comentário]
# except:
#   pass
# try:
#   if linha[-1] == "\n":
#     linha = linha[:-1]
# except:
#   pass
# try:
#   id_rotulo = linha.index(":")
#   rotulo = linha[:id_rotulo] # beq obriga a ler todo o arquivo antes de processá-lo
#   linha = linha[id_rotulo + 1:]
# except:
#   pass
# instrucao = linha.split()
# if istrucao[0] == ".text":
#   del istrucao[0]
# if len(instrucao) > 0:
# ...

Lembrar de limpar valores ascii nas instruções imediatas
verificar se o mars está usando instruções extendidas