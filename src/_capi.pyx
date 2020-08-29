# The MIT License (MIT)
#
# Copyright (c) 2019 John Wiggins
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from cpython.version cimport PY_MAJOR_VERSION
import cython
from libc.stdint cimport uint32_t

cimport _capi

cdef void _destroy_array_data(void* impl, void* destroyData):
    pass

cdef uint32_t _get_rgba32_value(color):
    cdef uint32_t r, g, b, alpha
    r = 255 * color[0]
    g = 255 * color[1]
    b = 255 * color[2]
    if len(color) > 3:
        alpha = 255 * color[4]
    else:
        alpha = 255

    return (alpha << 24) | (r << 16) | (g << 8) | b

cdef bytes _utf8_string(s):
    if type(s) is unicode:
        return <bytes>s.encode('utf-8', 'strict')
    elif PY_MAJOR_VERSION < 3 and isinstance(s, bytes):
        return <bytes>s
    elif isinstance(s, unicode):
        return <bytes>(unicode(s).encode('utf-8', 'strict'))
    else:
        raise TypeError('The input should be a string or bytes object')

include "enums.pxi"

include "array.pxi"
include "font.pxi"
include "geometry.pxi"
include "gradient.pxi"
include "image.pxi"
include "misc.pxi"
include "path.pxi"
include "pattern.pxi"
include "pixel_convert.pxi"

include "context.pxi"
