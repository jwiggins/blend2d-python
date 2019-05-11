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

# BLFont
# BLResult blFontInit(BLFontCore* self)
# BLResult blFontReset(BLFontCore* self)
# BLResult blFontAssignMove(BLFontCore* self, BLFontCore* other)
# BLResult blFontAssignWeak(BLFontCore* self, const BLFontCore* other)
# bool blFontEquals(const BLFontCore* a, const BLFontCore* b)
# BLResult blFontCreateFromFace(BLFontCore* self, const BLFontFaceCore* face, float size)
# BLResult blFontShape(const BLFontCore* self, BLGlyphBufferCore* buf)
# BLResult blFontMapTextToGlyphs(const BLFontCore* self, BLGlyphBufferCore* buf, BLGlyphMappingState* stateOut)
# BLResult blFontPositionGlyphs(const BLFontCore* self, BLGlyphBufferCore* buf, uint32_t positioningFlags)
# BLResult blFontApplyKerning(const BLFontCore* self, BLGlyphBufferCore* buf)
# BLResult blFontApplyGSub(const BLFontCore* self, BLGlyphBufferCore* buf, size_t index, BLBitWord lookups)
# BLResult blFontApplyGPos(const BLFontCore* self, BLGlyphBufferCore* buf, size_t index, BLBitWord lookups)
# BLResult blFontGetMatrix(const BLFontCore* self, BLFontMatrix* out)
# BLResult blFontGetMetrics(const BLFontCore* self, BLFontMetrics* out)
# BLResult blFontGetDesignMetrics(const BLFontCore* self, BLFontDesignMetrics* out)
# BLResult blFontGetTextMetrics(const BLFontCore* self, BLGlyphBufferCore* buf, BLTextMetrics* out)
# BLResult blFontGetGlyphBounds(const BLFontCore* self, const void* glyphIdData, intptr_t glyphIdAdvance, BLBoxI* out, size_t count)
# BLResult blFontGetGlyphAdvances(const BLFontCore* self, const void* glyphIdData, intptr_t glyphIdAdvance, BLGlyphPlacement* out, size_t count)
# BLResult blFontGetGlyphOutlines(const BLFontCore* self, uint32_t glyphId, const BLMatrix2D* userMatrix, BLPathCore* out, BLPathSinkFunc sink, void* closure)
# BLResult blFontGetGlyphRunOutlines(const BLFontCore* self, const BLGlyphRun* glyphRun, const BLMatrix2D* userMatrix, BLPathCore* out, BLPathSinkFunc sink, void* closure)

# BLFontData
# BLResult blFontDataInit(BLFontDataCore* self)
# BLResult blFontDataReset(BLFontDataCore* self)
# BLResult blFontDataAssignMove(BLFontDataCore* self, BLFontDataCore* other)
# BLResult blFontDataAssignWeak(BLFontDataCore* self, const BLFontDataCore* other)
# bool blFontDataEquals(const BLFontDataCore* a, const BLFontDataCore* b)
# BLResult blFontDataListTags(const BLFontDataCore* self, BLArrayCore* dst)
# size_t blFontDataQueryTables(const BLFontDataCore* self, BLFontTable* dst, const BLTag* tags, size_t count)

# BLFontFace
# BLResult blFontFaceInit(BLFontFaceCore* self)
# BLResult blFontFaceReset(BLFontFaceCore* self)
# BLResult blFontFaceAssignMove(BLFontFaceCore* self, BLFontFaceCore* other)
# BLResult blFontFaceAssignWeak(BLFontFaceCore* self, const BLFontFaceCore* other)
# bool blFontFaceEquals(const BLFontFaceCore* a, const BLFontFaceCore* b)
# BLResult blFontFaceCreateFromFile(BLFontFaceCore* self, const char* fileName, uint32_t readFlags)
# BLResult blFontFaceCreateFromLoader(BLFontFaceCore* self, const BLFontLoaderCore* loader, uint32_t faceIndex)
# BLResult blFontFaceGetFaceInfo(const BLFontFaceCore* self, BLFontFaceInfo* out)
# BLResult blFontFaceGetDesignMetrics(const BLFontFaceCore* self, BLFontDesignMetrics* out)
# BLResult blFontFaceGetUnicodeCoverage(const BLFontFaceCore* self, BLFontUnicodeCoverage* out)

# BLFontLoader
# BLResult blFontLoaderInit(BLFontLoaderCore* self)
# BLResult blFontLoaderReset(BLFontLoaderCore* self)
# BLResult blFontLoaderAssignMove(BLFontLoaderCore* self, BLFontLoaderCore* other)
# BLResult blFontLoaderAssignWeak(BLFontLoaderCore* self, const BLFontLoaderCore* other)
# bool blFontLoaderEquals(const BLFontLoaderCore* a, const BLFontLoaderCore* b)
# BLResult blFontLoaderCreateFromFile(BLFontLoaderCore* self, const char* fileName, uint32_t readFlags)
# BLResult blFontLoaderCreateFromDataArray(BLFontLoaderCore* self, const BLArrayCore* dataArray)
# BLResult blFontLoaderCreateFromData(BLFontLoaderCore* self, const void* data, size_t size, BLDestroyImplFunc destroyFunc, void* destroyData)
# BLFontDataImpl* blFontLoaderDataByFaceIndex(BLFontLoaderCore* self, uint32_t faceIndex)

# BLGlyphBuffer
# BLResult blGlyphBufferInit(BLGlyphBufferCore* self)
# BLResult blGlyphBufferReset(BLGlyphBufferCore* self)
# BLResult blGlyphBufferClear(BLGlyphBufferCore* self)
# BLResult blGlyphBufferSetText(BLGlyphBufferCore* self, const void* data, size_t size, uint32_t encoding)
# BLResult blGlyphBufferSetGlyphIds(BLGlyphBufferCore* self, const void* data, intptr_t advance, size_t size)

cdef class Font:
    cdef _capi.BLFontCore _self
    cdef _capi.BLFontFaceCore _face

    def __cinit__(self, file_name, float size):
        cdef bytes utf8_file_name = _utf8_string(file_name)
        cdef char * c_file_name = utf8_file_name
        _capi.blFontInit(&self._self)
        _capi.blFontFaceInit(&self._face)
        _capi.blFontFaceCreateFromFile(&self._face, c_file_name, 0)
        _capi.blFontCreateFromFace(&self._self, &self._face, size)

    def __dealloc__(self):
        _capi.blFontReset(&self._self)
        _capi.blFontFaceReset(&self._face)
