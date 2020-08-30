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
    pattern_image = blend2d.Image(np.empty((256, 256, 4), dtype=np.uint8))
    pattern_context = blend2d.Context(pattern_image)
    random_lines(pattern_context, 256, 256)

    array = np.empty((512, 512, 4), dtype=np.uint8)
    image = blend2d.Image(array)
    context = blend2d.Context(image)
    context.clear()

    area = blend2d.RectI(0, 0, 256, 256)
    matrix = blend2d.Matrix2D()
    matrix.rotate(128.0, 128.0, 45.0)
    matrix.scale(0.25, 0.25)
    pattern = blend2d.Pattern(
        pattern_image, area, blend2d.ExtendMode.REPEAT, matrix
    )
    context.set_fill_style(pattern)

    circle = blend2d.Path()
    circle.ellipse(256, 256, 200, 200)
    context.fill_path(circle)

    imsave('pattern.png', array)
