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

# BLArray
# BLResult blArrayInit(BLArrayCore* self, uint32_t arrayTypeId)
# BLResult blArrayDestroy(BLArrayCore* self)
# BLResult blArrayReset(BLArrayCore* self)
# BLResult blArrayCreateFromData(BLArrayCore* self, void* data, size_t size, size_t capacity, uint32_t dataAccessFlags, BLDestroyImplFunc destroyFunc, void* destroyData)
# size_t blArrayGetSize(const BLArrayCore* self)
# size_t blArrayGetCapacity(const BLArrayCore* self)
# const void* blArrayGetData(const BLArrayCore* self)
# BLResult blArrayClear(BLArrayCore* self)
# BLResult blArrayShrink(BLArrayCore* self)
# BLResult blArrayReserve(BLArrayCore* self, size_t n)
# BLResult blArrayResize(BLArrayCore* self, size_t n, const void* fill)
# BLResult blArrayMakeMutable(BLArrayCore* self, void** dataOut)
# BLResult blArrayModifyOp(BLArrayCore* self, uint32_t op, size_t n, void** dataOut)
# BLResult blArrayInsertOp(BLArrayCore* self, size_t index, size_t n, void** dataOut)
# BLResult blArrayAssignMove(BLArrayCore* self, BLArrayCore* other)
# BLResult blArrayAssignWeak(BLArrayCore* self, const BLArrayCore* other)
# BLResult blArrayAssignDeep(BLArrayCore* self, const BLArrayCore* other)
# BLResult blArrayAssignView(BLArrayCore* self, const void* items, size_t n)
# BLResult blArrayAppendU8(BLArrayCore* self, uint8_t value)
# BLResult blArrayAppendU16(BLArrayCore* self, uint16_t value)
# BLResult blArrayAppendU32(BLArrayCore* self, uint32_t value)
# BLResult blArrayAppendU64(BLArrayCore* self, uint64_t value)
# BLResult blArrayAppendF32(BLArrayCore* self, float value)
# BLResult blArrayAppendF64(BLArrayCore* self, double value)
# BLResult blArrayAppendItem(BLArrayCore* self, const void* item)
# BLResult blArrayAppendView(BLArrayCore* self, const void* items, size_t n)
# BLResult blArrayInsertU8(BLArrayCore* self, size_t index, uint8_t value)
# BLResult blArrayInsertU16(BLArrayCore* self, size_t index, uint16_t value)
# BLResult blArrayInsertU32(BLArrayCore* self, size_t index, uint32_t value)
# BLResult blArrayInsertU64(BLArrayCore* self, size_t index, uint64_t value)
# BLResult blArrayInsertF32(BLArrayCore* self, size_t index, float value)
# BLResult blArrayInsertF64(BLArrayCore* self, size_t index, double value)
# BLResult blArrayInsertItem(BLArrayCore* self, size_t index, const void* item)
# BLResult blArrayInsertView(BLArrayCore* self, size_t index, const void* items, size_t n)
# BLResult blArrayReplaceU8(BLArrayCore* self, size_t index, uint8_t value)
# BLResult blArrayReplaceU16(BLArrayCore* self, size_t index, uint16_t value)
# BLResult blArrayReplaceU32(BLArrayCore* self, size_t index, uint32_t value)
# BLResult blArrayReplaceU64(BLArrayCore* self, size_t index, uint64_t value)
# BLResult blArrayReplaceF32(BLArrayCore* self, size_t index, float value)
# BLResult blArrayReplaceF64(BLArrayCore* self, size_t index, double value)
# BLResult blArrayReplaceItem(BLArrayCore* self, size_t index, const void* item)
# BLResult blArrayReplaceView(BLArrayCore* self, size_t rStart, size_t rEnd, const void* items, size_t n)
# BLResult blArrayRemoveIndex(BLArrayCore* self, size_t index)
# BLResult blArrayRemoveRange(BLArrayCore* self, size_t rStart, size_t rEnd)
# bool blArrayEquals(const BLArrayCore* a, const BLArrayCore* b)

from libc.stddef cimport size_t


_DTYPE_MAP = {
    'i1': _capi.BL_IMPL_TYPE_ARRAY_I8,
    'u1': _capi.BL_IMPL_TYPE_ARRAY_U8,
    'i2': _capi.BL_IMPL_TYPE_ARRAY_I16,
    'u2': _capi.BL_IMPL_TYPE_ARRAY_U16,
    'i4': _capi.BL_IMPL_TYPE_ARRAY_I32,
    'u4': _capi.BL_IMPL_TYPE_ARRAY_U32,
    'i8': _capi.BL_IMPL_TYPE_ARRAY_I64,
    'u8': _capi.BL_IMPL_TYPE_ARRAY_U64,
    'f4': _capi.BL_IMPL_TYPE_ARRAY_F32,
    'f8': _capi.BL_IMPL_TYPE_ARRAY_F64,
}

cdef class Array:
    cdef _capi.BLArrayCore _self
    cdef bint _initialized

    def __cinit__(self, array):
        cdef:
            uint32_t _type
            size_t n_items

        self._initialized = False

        _type_str = array.dtype.str[1:]
        if _type_str not in _DTYPE_MAP:
            raise ValueError('Array type not supported')
        _type = _DTYPE_MAP[_type_str]

        if array.ndim > 1:
            raise ValueError('Only 1D arrays supported')
        n_items = array.shape[0]

        _capi.blArrayInit(&self._self, _type)
        _capi.blArrayReserve(&self._self, n_items)
        self._initialized = True

        for i in range(n_items):
            if _type == _capi.BL_IMPL_TYPE_ARRAY_I8 or _type == _capi.BL_IMPL_TYPE_ARRAY_U8:
                _capi.blArrayAppendU8(&self._self, array[i])
            elif _type == _capi.BL_IMPL_TYPE_ARRAY_I16 or _type == _capi.BL_IMPL_TYPE_ARRAY_U16:
                _capi.blArrayAppendU16(&self._self, array[i])
            elif _type == _capi.BL_IMPL_TYPE_ARRAY_I32 or _type == _capi.BL_IMPL_TYPE_ARRAY_U32:
                _capi.blArrayAppendU32(&self._self, array[i])
            elif _type == _capi.BL_IMPL_TYPE_ARRAY_I64 or _type == _capi.BL_IMPL_TYPE_ARRAY_U8:
                _capi.blArrayAppendU64(&self._self, array[i])
            elif _type == _capi.BL_IMPL_TYPE_ARRAY_F32:
                _capi.blArrayAppendF32(&self._self, array[i])
            elif _type == _capi.BL_IMPL_TYPE_ARRAY_F64:
                _capi.blArrayAppendF64(&self._self, array[i])


    def __dealloc__(self):
        if self._initialized:
            _capi.blArrayDestroy(&self._self)
        self._initialized = False