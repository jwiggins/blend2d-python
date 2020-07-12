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

# BLMatrix2D
# BLResult blMatrix2DSetIdentity(BLMatrix2D* self)
# BLResult blMatrix2DSetTranslation(BLMatrix2D* self, double x, double y)
# BLResult blMatrix2DSetScaling(BLMatrix2D* self, double x, double y)
# BLResult blMatrix2DSetSkewing(BLMatrix2D* self, double x, double y)
# BLResult blMatrix2DSetRotation(BLMatrix2D* self, double angle, double cx, double cy)
# BLResult blMatrix2DApplyOp(BLMatrix2D* self, uint32_t opType, const void* opData)
# BLResult blMatrix2DInvert(BLMatrix2D* dst, const BLMatrix2D* src)
# uint32_t blMatrix2DGetType(const BLMatrix2D* self)
# BLResult blMatrix2DMapPointDArray(const BLMatrix2D* self, BLPoint* dst, const BLPoint* src, size_t count)

# BLRegion
# BLResult blRegionInit(BLRegionCore* self)
# BLResult blRegionDestroy(BLRegionCore* self)
# BLResult blRegionReset(BLRegionCore* self)
# size_t blRegionGetSize(const BLRegionCore* self)
# size_t blRegionGetCapacity(const BLRegionCore* self)
# const BLBoxI* blRegionGetData(const BLRegionCore* self)
# BLResult blRegionClear(BLRegionCore* self)
# BLResult blRegionShrink(BLRegionCore* self)
# BLResult blRegionReserve(BLRegionCore* self, size_t n)
# BLResult blRegionAssignMove(BLRegionCore* self, BLRegionCore* other)
# BLResult blRegionAssignWeak(BLRegionCore* self, const BLRegionCore* other)
# BLResult blRegionAssignDeep(BLRegionCore* self, const BLRegionCore* other)
# BLResult blRegionAssignBoxI(BLRegionCore* self, const BLBoxI* src)
# BLResult blRegionAssignBoxIArray(BLRegionCore* self, const BLBoxI* data, size_t n)
# BLResult blRegionAssignRectI(BLRegionCore* self, const BLRectI* rect)
# BLResult blRegionAssignRectIArray(BLRegionCore* self, const BLRectI* data, size_t n)
# BLResult blRegionCombine(BLRegionCore* self, const BLRegionCore* a, const BLRegionCore* b, uint32_t booleanOp)
# BLResult blRegionCombineRB(BLRegionCore* self, const BLRegionCore* a, const BLBoxI* b, uint32_t booleanOp)
# BLResult blRegionCombineBR(BLRegionCore* self, const BLBoxI* a, const BLRegionCore* b, uint32_t booleanOp)
# BLResult blRegionCombineBB(BLRegionCore* self, const BLBoxI* a, const BLBoxI* b, uint32_t booleanOp)
# BLResult blRegionTranslate(BLRegionCore* self, const BLRegionCore* r, const BLPointI* pt)
# BLResult blRegionTranslateAndClip(BLRegionCore* self, const BLRegionCore* r, const BLPointI* pt, const BLBoxI* clipBox)
# BLResult blRegionIntersectAndClip(BLRegionCore* self, const BLRegionCore* a, const BLRegionCore* b, const BLBoxI* clipBox)
# bool blRegionEquals(const BLRegionCore* a, const BLRegionCore* b)
# uint32_t blRegionGetType(const BLRegionCore* self)
# uint32_t blRegionHitTest(const BLRegionCore* self, const BLPointI* pt)
# uint32_t blRegionHitTestBoxI(const BLRegionCore* self, const BLBoxI* box)


cdef class Matrix2D:
    cdef _capi.BLMatrix2D _self

    def __cinit__(self):
        _capi.blMatrix2DSetIdentity(&self._self)

    def rotate(self, double cx, double cy, double angle):
        _capi.blMatrix2DSetRotation(&self._self, angle, cx, cy)

    def scale(self, double x, double y):
        _capi.blMatrix2DSetScaling(&self._self, x, y)

    def translate(self, double x, double y):
        _capi.blMatrix2DSetTranslation(&self._self, x, y)


cdef class Rect:
    cdef _capi.BLRect _self

    def __cinit__(self, float x, float y, float w, float h):
        self._self.x = x
        self._self.y = y
        self._self.w = w
        self._self.h = h


cdef class RectI:
    cdef _capi.BLRectI _self

    def __cinit__(self, int x, int y, int w, int h):
        self._self.x = x
        self._self.y = y
        self._self.w = w
        self._self.h = h


cdef class Region:
    cdef _capi.BLRegionCore _self

    def __cinit__(self):
        _capi.blRegionInit(&self._self)

    def __dealloc__(self):
        _capi.blRegionDestroy(&self._self)
