# Congruência de Zeller para encontrar dia da semana no calendário Juliano e Gregoriano

dia = int(input())
mes = int(input())
ano = int(input())

def dia_semana(h) :
  return {
    0 : "Sábado",
    1 : "Domingo",
    2 : "Segunda-feira",
    3 : "Terça-feira",
    4 : "Quarta-feira",
    5 : "Quinta-feira",
    6 : "Sexta-feira",
  }[h]
  
if (mes == 1):
    mes = 13
    ano = ano - 1
if (mes == 2):
    mes = 14
    ano = ano - 1
  
a = ano % 100
b = ano // 100
c = mes + 1
d = c * 13
e = d // 5
f = a // 4
g = b // 4
h = b * 5
i = dia + e
i += a 
i += f
i += g
i += h
k = i % 7

print(dia_semana(k))