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

# BLGradient
# BLResult blGradientInit(BLGradientCore* self)
# BLResult blGradientInitAs(BLGradientCore* self, uint32_t type, const void* values, uint32_t extendMode, const BLGradientStop* stops, size_t n, const BLMatrix2D* m)
# BLResult blGradientReset(BLGradientCore* self)
# BLResult blGradientAssignMove(BLGradientCore* self, BLGradientCore* other)
# BLResult blGradientAssignWeak(BLGradientCore* self, const BLGradientCore* other)
# BLResult blGradientCreate(BLGradientCore* self, uint32_t type, const void* values, uint32_t extendMode, const BLGradientStop* stops, size_t n, const BLMatrix2D* m)
# BLResult blGradientShrink(BLGradientCore* self)
# BLResult blGradientReserve(BLGradientCore* self, size_t n)
# uint32_t blGradientGetType(const BLGradientCore* self)
# BLResult blGradientSetType(BLGradientCore* self, uint32_t type)
# double blGradientGetValue(const BLGradientCore* self, size_t index)
# BLResult blGradientSetValue(BLGradientCore* self, size_t index, double value)
# BLResult blGradientSetValues(BLGradientCore* self, size_t index, const double* values, size_t n)
# uint32_t blGradientGetExtendMode(BLGradientCore* self)
# BLResult blGradientSetExtendMode(BLGradientCore* self, uint32_t extendMode)
# const BLGradientStop* blGradientGetStops(const BLGradientCore* self)
# size_t blGradientGetSize(const BLGradientCore* self)
# size_t blGradientGetCapacity(const BLGradientCore* self)
# BLResult blGradientResetStops(BLGradientCore* self)
# BLResult blGradientAssignStops(BLGradientCore* self, const BLGradientStop* stops, size_t n)
# BLResult blGradientAddStopRgba32(BLGradientCore* self, double offset, uint32_t argb32)
# BLResult blGradientAddStopRgba64(BLGradientCore* self, double offset, uint64_t argb64)
# BLResult blGradientRemoveStop(BLGradientCore* self, size_t index)
# BLResult blGradientRemoveStopByOffset(BLGradientCore* self, double offset, uint32_t all)
# BLResult blGradientRemoveStops(BLGradientCore* self, const BLRange* range)
# BLResult blGradientRemoveStopsFromTo(BLGradientCore* self, double offsetMin, double offsetMax)
# BLResult blGradientReplaceStopRgba32(BLGradientCore* self, size_t index, double offset, uint32_t rgba32)
# BLResult blGradientReplaceStopRgba64(BLGradientCore* self, size_t index, double offset, uint64_t rgba64)
# size_t blGradientIndexOfStop(const BLGradientCore* self, double offset)
# BLResult blGradientApplyMatrixOp(BLGradientCore* self, uint32_t opType, const void* opData)
# bool blGradientEquals(const BLGradientCore* a, const BLGradientCore* b)

cdef class Gradient:
    cdef _capi.BLGradientCore _self

    def __cinit__(self):
        _capi.blGradientInit(&self._self)

    def __dealloc__(self):
        _capi.blGradientReset(&self._self)

    property type:
        def __get__(self):
            return GradientType(_capi.blGradientGetType(&self._self))

        def __set__(self, GradientType value):
            _capi.blGradientSetType(&self._self, value)

    property extend_mode:
        def __get__(self):
            return ExtendMode(_capi.blGradientGetExtendMode(&self._self))

        def __set__(self, ExtendMode value):
            _capi.blGradientSetExtendMode(&self._self, value)

    def add_stop(self, float offset, color):
        cdef uint32_t packed = _get_rgba32_value(color)
        _capi.blGradientAddStopRgba32(&self._self, offset, packed)
