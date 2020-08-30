import blend2d
import numpy as np
from skimage.io import imsave

if __name__ == '__main__':
    array = np.empty((500, 500, 4), dtype=np.uint8)
    image = blend2d.Image(array)
    canvas = blend2d.Context(image)

    canvas.clear()
    canvas.set_fill_style((1.0, 1.0, 1.0))

    text = u'Hello World!'
    font = blend2d.Font('/Library/Fonts/Skia.ttf', 50)
    canvas.fill_text((100, 100), font, text)

    imsave('text.png', array)
