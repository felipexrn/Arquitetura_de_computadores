import os
os.system('python ./montador_mips/trivial.py < ./montador_mips/intrucoes_base.txt > ./montador_mips/taducao_montador.txt')
os.system('python ./montador_mips/comparador.py')