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

# BLPattern
# BLResult blPatternInit(BLPatternCore* self)
# BLResult blPatternInitAs(BLPatternCore* self, const BLImageCore* image, const BLRectI* area, uint32_t extendMode, const BLMatrix2D* m)
# BLResult blPatternDestroy(BLPatternCore* self)
# BLResult blPatternReset(BLPatternCore* self)
# BLResult blPatternAssignMove(BLPatternCore* self, BLPatternCore* other)
# BLResult blPatternAssignWeak(BLPatternCore* self, const BLPatternCore* other)
# BLResult blPatternAssignDeep(BLPatternCore* self, const BLPatternCore* other)
# BLResult blPatternCreate(BLPatternCore* self, const BLImageCore* image, const BLRectI* area, uint32_t extendMode, const BLMatrix2D* m)
# BLResult blPatternSetImage(BLPatternCore* self, const BLImageCore* image, const BLRectI* area)
# BLResult blPatternSetArea(BLPatternCore* self, const BLRectI* area)
# BLResult blPatternSetExtendMode(BLPatternCore* self, uint32_t extendMode)
# BLResult blPatternApplyMatrixOp(BLPatternCore* self, uint32_t opType, const void* opData)
# bool blPatternEquals(const BLPatternCore* a, const BLPatternCore* b)

cdef class Pattern:
    cdef _capi.BLPatternCore _self
    cdef object _image_ref

    def __cinit__(self, Image image, RectI area, ExtendMode mode, Matrix2D m):
        _capi.blPatternInitAs(
            &self._self, &image._self,
            &area._self, mode, &m._self
        )
        self._image_ref = image

    def __dealloc__(self):
        _capi.blPatternDestroy(&self._self)
        self._image_ref = None
