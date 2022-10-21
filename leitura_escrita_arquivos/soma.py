# este programa lê um número inteiro N na primeira linha
# nas N linhas seguintes ele lê dois números inteiros A e B
# O programa imprime a soma de A e B
# para executar este programa em seu computador faça digite o seguinte comando no terminal de comando: python soma.py < entrada > resultado.txt
# certifique que o arquivo entrada.txt esteja na mesma pasta que o arquivo soma.py

n = int(input())
for i in range(n):
  a, b = map(int, input().split())
  print(a + b)