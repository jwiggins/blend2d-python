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
# BLResult blFontDestroy(BLFontCore* self)
# BLResult blFontReset(BLFontCore* self)
# BLResult blFontAssignMove(BLFontCore* self, BLFontCore* other)
# BLResult blFontAssignWeak(BLFontCore* self, const BLFontCore* other)
# bool blFontEquals(const BLFontCore* a, const BLFontCore* b)
# BLResult blFontCreateFromFace(BLFontCore* self, const BLFontFaceCore* face, float size)
# BLResult blFontShape(const BLFontCore* self, BLGlyphBufferCore* gb)
# BLResult blFontMapTextToGlyphs(const BLFontCore* self, BLGlyphBufferCore* gb, BLGlyphMappingState* stateOut)
# BLResult blFontPositionGlyphs(const BLFontCore* self, BLGlyphBufferCore* gb, uint32_t positioningFlags)
# BLResult blFontApplyKerning(const BLFontCore* self, BLGlyphBufferCore* gb)
# BLResult blFontApplyGSub(const BLFontCore* self, BLGlyphBufferCore* gb, size_t index, BLBitWord lookups)
# BLResult blFontApplyGPos(const BLFontCore* self, BLGlyphBufferCore* gb, size_t index, BLBitWord lookups)
# BLResult blFontGetMatrix(const BLFontCore* self, BLFontMatrix* out)
# BLResult blFontGetMetrics(const BLFontCore* self, BLFontMetrics* out)
# BLResult blFontGetDesignMetrics(const BLFontCore* self, BLFontDesignMetrics* out)
# BLResult blFontGetTextMetrics(const BLFontCore* self, BLGlyphBufferCore* gb, BLTextMetrics* out)
# BLResult blFontGetGlyphBounds(const BLFontCore* self, const uint32_t* glyphData, intptr_t glyphAdvance, BLBoxI* out, size_t count)
# BLResult blFontGetGlyphAdvances(const BLFontCore* self, const uint32_t* glyphData, intptr_t glyphAdvance, BLGlyphPlacement* out, size_t count)
# BLResult blFontGetGlyphOutlines(const BLFontCore* self, uint32_t glyphId, const BLMatrix2D* userMatrix, BLPathCore* out, BLPathSinkFunc sink, void* closure)
# BLResult blFontGetGlyphRunOutlines(const BLFontCore* self, const BLGlyphRun* glyphRun, const BLMatrix2D* userMatrix, BLPathCore* out, BLPathSinkFunc sink, void* closure)

# BLFontData
# BLResult blFontDataInit(BLFontDataCore* self)
# BLResult blFontDataDestroy(BLFontDataCore* self)
# BLResult blFontDataReset(BLFontDataCore* self)
# BLResult blFontDataAssignMove(BLFontDataCore* self, BLFontDataCore* other)
# BLResult blFontDataAssignWeak(BLFontDataCore* self, const BLFontDataCore* other)
# BLResult blFontDataCreateFromFile(BLFontDataCore* self, const char* fileName, uint32_t readFlags)
# BLResult blFontDataCreateFromDataArray(BLFontDataCore* self, const BLArrayCore* dataArray)
# BLResult blFontDataCreateFromData(BLFontDataCore* self, const void* data, size_t dataSize, BLDestroyImplFunc destroyFunc, void* destroyData)
# bool blFontDataEquals(const BLFontDataCore* a, const BLFontDataCore* b)
# BLResult blFontDataListTags(const BLFontDataCore* self, uint32_t faceIndex, BLArrayCore* dst)
# size_t blFontDataQueryTables(const BLFontDataCore* self, uint32_t faceIndex, BLFontTable* dst, const BLTag* tags, size_t count)

# BLFontFace
# BLResult blFontFaceInit(BLFontFaceCore* self)
# BLResult blFontFaceDestroy(BLFontFaceCore* self)
# BLResult blFontFaceReset(BLFontFaceCore* self)
# BLResult blFontFaceAssignMove(BLFontFaceCore* self, BLFontFaceCore* other)
# BLResult blFontFaceAssignWeak(BLFontFaceCore* self, const BLFontFaceCore* other)
# bool blFontFaceEquals(const BLFontFaceCore* a, const BLFontFaceCore* b)
# BLResult blFontFaceCreateFromFile(BLFontFaceCore* self, const char* fileName, uint32_t readFlags)
# BLResult blFontFaceCreateFromData(BLFontFaceCore* self, const BLFontDataCore* fontData, uint32_t faceIndex)
# BLResult blFontFaceGetFaceInfo(const BLFontFaceCore* self, BLFontFaceInfo* out)
# BLResult blFontFaceGetDesignMetrics(const BLFontFaceCore* self, BLFontDesignMetrics* out)
# BLResult blFontFaceGetUnicodeCoverage(const BLFontFaceCore* self, BLFontUnicodeCoverage* out)

# BLFontManager
# BLResult blFontManagerInit(BLFontManagerCore* self)
# BLResult blFontManagerInitNew(BLFontManagerCore* self)
# BLResult blFontManagerDestroy(BLFontManagerCore* self)
# BLResult blFontManagerReset(BLFontManagerCore* self)
# BLResult blFontManagerAssignMove(BLFontManagerCore* self, BLFontManagerCore* other)
# BLResult blFontManagerAssignWeak(BLFontManagerCore* self, const BLFontManagerCore* other)
# BLResult blFontManagerCreate(BLFontManagerCore* self)
# size_t blFontManagerGetFaceCount(const BLFontManagerCore* self)
# size_t blFontManagerGetFamilyCount(const BLFontManagerCore* self)
# bool blFontManagerHasFace(const BLFontManagerCore* self, const BLFontFaceCore* face)
# BLResult blFontManagerAddFace(BLFontManagerCore* self, const BLFontFaceCore* face)
# BLResult blFontManagerQueryFace(const BLFontManagerCore* self, const char* name, size_t nameSize, const BLFontQueryProperties* properties, BLFontFaceCore* out)
# BLResult blFontManagerQueryFacesByFamilyName(const BLFontManagerCore* self, const char* name, size_t nameSize, BLArrayCore* out)
# bool blFontManagerEquals(const BLFontManagerCore* a, const BLFontManagerCore* b)

# BLGlyphBuffer
# BLResult blGlyphBufferInit(BLGlyphBufferCore* self)
# BLResult blGlyphBufferInitMove(BLGlyphBufferCore* self, BLGlyphBufferCore* other)
# BLResult blGlyphBufferDestroy(BLGlyphBufferCore* self)
# BLResult blGlyphBufferReset(BLGlyphBufferCore* self)
# BLResult blGlyphBufferClear(BLGlyphBufferCore* self)
# size_t blGlyphBufferGetSize(const BLGlyphBufferCore* self)
# uint32_t blGlyphBufferGetFlags(const BLGlyphBufferCore* self)
# const BLGlyphRun* blGlyphBufferGetGlyphRun(const BLGlyphBufferCore* self)
# const uint32_t* blGlyphBufferGetContent(const BLGlyphBufferCore* self)
# const BLGlyphInfo* blGlyphBufferGetInfoData(const BLGlyphBufferCore* self)
# const BLGlyphPlacement* blGlyphBufferGetPlacementData(const BLGlyphBufferCore* self)
# BLResult blGlyphBufferSetText(BLGlyphBufferCore* self, const void* textData, size_t size, uint32_t encoding)
# BLResult blGlyphBufferSetGlyphs(BLGlyphBufferCore* self, const uint32_t* glyphData, size_t size)
# BLResult blGlyphBufferSetGlyphsFromStruct(BLGlyphBufferCore* self, const void* glyphData, size_t size, size_t glyphIdSize, intptr_t glyphIdAdvance)

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
        _capi.blFontDestroy(&self._self)
        _capi.blFontFaceDestroy(&self._face)
