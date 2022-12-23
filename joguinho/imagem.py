from PIL import Image
  
# Import an image from directory:
input_image = Image.open("avatar.png")
  
# Extracting pixel map:
pixel_map = input_image.load()
  
# Extracting the width and height 
# of the image:
width, height = input_image.size
  
# taking half of the width:
for i in range(width//2):
    for j in range(height):
        
        # getting the RGB pixel value.
        r, g, b, p = input_image.getpixel((i, j))

      
        print(r+g+b)
  
        # setting the pixel value.
        pixel_map[i, j] = (int(grayscale), int(grayscale), int(grayscale))
  
# Saving the final output
# as "grayscale.png":
input_image.save("grayscale", format="png")
  
# use input_image.show() to see the image on the
# output screen.