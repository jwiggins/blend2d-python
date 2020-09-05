import blend2d
import numpy as np
from skimage.io import imsave


def random_lines(context, width, height):
    xs = np.random.randint(0, high=width, size=(100, 2))
    ys = np.random.randint(0, high=height, size=(100, 2))
    colors = np.random.random_sample(size=(100, 3))

    context.set_fill_style((1.0, 1.0, 1.0))
    context.fill_all()

    path = blend2d.Path()
    for (x0, x1), (y0, y1), color in zip(xs, ys, colors):
        context.set_stroke_style(color)
        path.reset()
        path.move_to(x0, y0)
        path.line_to(x1, y1)
        context.stroke_path(path)


if __name__ == '__main__':
    image_array = np.empty((256, 256, 4), dtype=np.uint8)
    image = blend2d.Image(image_array)
    image_context = blend2d.Context(image)
    random_lines(image_context, 256, 256)

    array = np.empty((512, 512, 4), dtype=np.uint8)
    context = blend2d.Context(blend2d.Image(array))
    context.clear()

    src = blend2d.Rect(0, 0, *image_array.shape[:2])
    dst = blend2d.Rect(0, 0, 100, 100)
    context.blit_scaled_image(dst, image, src)

    context.rotate(-np.pi/12)
    context.blit_image((10.0, 100.0), image, src)

    imsave('image.png', array)
