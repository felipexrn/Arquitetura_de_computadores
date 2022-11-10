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
  
if (mes == 1) :
    mes = 13
    ano = ano - 1
if (mes == 2):
    mes = 14
    ano = ano - 1
  
q = dia
m = mes
k = ano % 100;
j = ano // 100;
h = q + 13 * (m + 1) // 5 + k + k // 4 + j // 4 + 5 * j
h = h % 7

print(dia_semana(h))