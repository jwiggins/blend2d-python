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

cpdef enum ArrayType:
    ARRAY_I8 = _capi.BL_IMPL_TYPE_ARRAY_I8
    ARRAY_U8 = _capi.BL_IMPL_TYPE_ARRAY_U8
    ARRAY_I16 = _capi.BL_IMPL_TYPE_ARRAY_I16
    ARRAY_U16 = _capi.BL_IMPL_TYPE_ARRAY_U16
    ARRAY_I32 = _capi.BL_IMPL_TYPE_ARRAY_I32
    ARRAY_U32 = _capi.BL_IMPL_TYPE_ARRAY_U32
    ARRAY_I64 = _capi.BL_IMPL_TYPE_ARRAY_I64
    ARRAY_U64 = _capi.BL_IMPL_TYPE_ARRAY_U64
    ARRAY_F32 = _capi.BL_IMPL_TYPE_ARRAY_F32
    ARRAY_F64 = _capi.BL_IMPL_TYPE_ARRAY_F64

cpdef enum ExtendMode:
    PAD = _capi.BL_EXTEND_MODE_PAD
    REPEAT = _capi.BL_EXTEND_MODE_REPEAT
    REFLECT = _capi.BL_EXTEND_MODE_REFLECT
    PAD_X_PAD_Y = _capi.BL_EXTEND_MODE_PAD_X_PAD_Y
    REPEAT_X_REPEAT_Y = _capi.BL_EXTEND_MODE_REPEAT_X_REPEAT_Y
    REFLECT_X_REFLECT_Y = _capi.BL_EXTEND_MODE_REFLECT_X_REFLECT_Y
    PAD_X_REPEAT_Y = _capi.BL_EXTEND_MODE_PAD_X_REPEAT_Y
    PAD_X_REFLECT_Y = _capi.BL_EXTEND_MODE_PAD_X_REFLECT_Y
    REPEAT_X_PAD_Y = _capi.BL_EXTEND_MODE_REPEAT_X_PAD_Y
    REPEAT_X_REFLECT_Y = _capi.BL_EXTEND_MODE_REPEAT_X_REFLECT_Y
    REFLECT_X_PAD_Y = _capi.BL_EXTEND_MODE_REFLECT_X_PAD_Y
    REFLECT_X_REPEAT_Y = _capi.BL_EXTEND_MODE_REFLECT_X_REPEAT_Y

cpdef enum Format:
    NONE = _capi.BL_FORMAT_NONE
    PRGB32 = _capi.BL_FORMAT_PRGB32
    XRGB32 = _capi.BL_FORMAT_XRGB32
    A8 = _capi.BL_FORMAT_A8

cpdef enum GradientType:
    LINEAR = _capi.BL_GRADIENT_TYPE_LINEAR
    RADIAL = _capi.BL_GRADIENT_TYPE_RADIAL
    CONICAL = _capi.BL_GRADIENT_TYPE_CONICAL
