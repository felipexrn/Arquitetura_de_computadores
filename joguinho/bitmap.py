input_file = input("imagem a converter: ./nome do arquivo.eps\n")

image = open(input_file, encoding = 'latin-1')
stream = image.read()

image_data = "%ImageData:"
index_img_data = stream.find(image_data)
index_img_data += len(image_data)
line_img_data = stream[index_img_data:]
char = line_img_data[0]
index_img_data = 0

while char != "\n":
  char = line_img_data[index_img_data]
  index_img_data += 1
line_img_data = line_img_data[:index_img_data]
line_img_data = line_img_data.split()

begin_binary = "beginimage\n"
index_begin_binary = stream.find(begin_binary)
index_begin_binary += len(begin_binary)

end_binary = "\n\n%%EndBinary"
index_end_binary = stream.find(end_binary)
stream = stream[index_begin_binary:index_end_binary]


hex = ""
width = int(line_img_data[0])
height = int(line_img_data[1])
count = 0

for i in range(len(stream)):
  if stream[i] != "\n":
    hex += stream[i]
    count += 1
  if count == width * 2:
    hex += "\n"
    count = 0

hex = hex.split("\n")
line = 3
length = height * 4
index = 0

while length > 0: 
  if line == 0:
    del hex[index]
    line = 4
    index -= 1
  line -= 1
  length -= 1
  index += 1
del hex[-1]

map = ""
map_line = ""
prefix = " 0x"

for i in range(height * 3):
  if i % 3 == 0:
    map_line = ".word"
    for j in range(width * 2):
      if j % 2 == 0:
        map_line += prefix
        map_line += hex[i][j] + hex[i][j+1]
        map_line += hex[i+1][j] + hex[i+1][j+1]
        map_line += hex[i+2][j] + hex[i+2][j+1]
    map += map_line + "\n"

output_file = input("arquivo de saída: ./node do arquivo.txt\n")
bitmap = open(output_file, 'w')
bitmap.write(map)
bitmap.close()
image.close()