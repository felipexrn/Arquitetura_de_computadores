image = open("./img.txt")
stream = image.read()
hex = ""
width = 128
height = 64
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

#for i in hex:
#  print(i)

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
  
print(map)

image.close()