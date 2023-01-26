image = open("./braulio.txt")
bmp = image.read()
hex = ""
width = 106
count = 0

for i in range(len(bmp)):
  if bmp[i] != "\n":
    hex += bmp[i]
    count += 1
  if count == width:
    hex += "\n"
    count = 0

hex = hex.split("\n")
line = 3
length = 212
index = 0

while length > 0: 
  if line == 0:
    del hex[index]
    line = 4
    index -= 1
  line -= 1
  length -= 1
  index += 1

#for i in hex:
#  print(i)

map = ""
map_line = ""
prefix = " 0x"

for i in range(159):
  if i % 3 == 0:
    map_line = ".word"
    for j in range(106):
      if j % 2 == 0:
        map_line += prefix
        map_line += hex[i][j] + hex[i][j+1]
        map_line += hex[i+1][j] + hex[i+1][j+1]
        map_line += hex[i+2][j] + hex[i+2][j+1]
    map += map_line + "\n"
  
print(map)

image.close()