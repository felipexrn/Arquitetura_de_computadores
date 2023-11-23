        .data
fin:    .asciiz "hex.txt"      # arquivo a ser lido
value:  .word 0x00991345
buffer: .asciiz ""
        .text
leia:        
  ###############################################################
  # abre arquivo
  li   $v0, 13       # codigo syscall para abrir aequivo
  la   $a0, fin      # arquivo a ser lido
  li   $a1, 0        # configura o que fazer (0: ler, 1: escrever)
  li   $a2, 0        # ignora 
  syscall            # abre o arquivo (retorna descitor do arquivo em $v0)
  move $s6, $v0      # salva o descritor do arquivo
  ###############################################################
  # le arquivo aberto
  li   $v0, 14       # codigo syscall para ler arquivo
  move $a0, $s6      # descritor do arquivo 
  la   $a1, buffer   # endereço do buffer onde será gravada a leitura
  li   $a2, 19       # maximo de caracteres a serem lidos
  syscall            # le o arquivo
  ###############################################################
  # fecha arquivo 
  li   $v0, 16       # scodigo syscall para fechar o arquivo
  move $a0, $s6      # descritor do arquivo a ser fechado
  syscall            # fecha o arquivo
  ###############################################################

print:
  li $v0, 4          # codigo syscall para printar string
  la $a0, buffer     # aponta para o começo do buffer a ser lido até o valor 0 
  syscall            # printa string
