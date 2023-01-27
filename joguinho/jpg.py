input_file = input("imagem a converter: ./nome do arquivo.jpg\n")

image = open(input_file, encoding = 'latin-1')
stream = image.read()

output_file = input("arquivo de saída: ./node do arquivo.txt\n")
bitmap = open(output_file, 'w')
bitmap.write(stream)
bitmap.close()
image.close()