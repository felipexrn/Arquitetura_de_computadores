import os
os.system('python ./montador_mips/trivial.py < ./montador_mips/instrucoes_base.txt > ./montador_mips/traducao_montador.txt')
os.system('python ./montador_mips/comparar.py')