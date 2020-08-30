import cv2
import sys

im = cv2.imread(sys.argv[1])

h, w, _ = im.shape

with open('pov-image.txt', 'w') as outfile:
    outfile.write(str(w) + ', ' + str(h) + ', \n')
    for r in range(h):
        for c in range(w):
            red, green, blue = im[r, c]
            outfile.write('<' + str(red/255) + ', ' + str(green/255) + ', ' + str(blue/255) + '>,\n')

