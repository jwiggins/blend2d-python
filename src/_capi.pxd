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

from libc.stddef cimport size_t
from libc.stdint cimport (
    intptr_t, uint8_t, uint16_t, uint32_t, uint64_t, uintptr_t
)
from libcpp cimport bool

cdef extern from "blend2d.h":
    ctypedef uint32_t BLResult
    ctypedef uintptr_t BLBitWord
    ctypedef uint32_t BLTag
    ctypedef struct BLRange:
        size_t start
        size_t end

    cdef enum BLCompOp:
        BL_COMP_OP_SRC_OVER
        BL_COMP_OP_SRC_COPY
        BL_COMP_OP_SRC_IN
        BL_COMP_OP_SRC_OUT
        BL_COMP_OP_SRC_ATOP
        BL_COMP_OP_DST_OVER
        BL_COMP_OP_DST_COPY
        BL_COMP_OP_DST_IN
        BL_COMP_OP_DST_OUT
        BL_COMP_OP_DST_ATOP
        BL_COMP_OP_XOR
        BL_COMP_OP_CLEAR
        BL_COMP_OP_PLUS
        BL_COMP_OP_MINUS
        BL_COMP_OP_MODULATE
        BL_COMP_OP_MULTIPLY
        BL_COMP_OP_SCREEN
        BL_COMP_OP_OVERLAY
        BL_COMP_OP_DARKEN
        BL_COMP_OP_LIGHTEN
        BL_COMP_OP_COLOR_DODGE
        BL_COMP_OP_COLOR_BURN
        BL_COMP_OP_LINEAR_BURN
        BL_COMP_OP_LINEAR_LIGHT
        BL_COMP_OP_PIN_LIGHT
        BL_COMP_OP_HARD_LIGHT
        BL_COMP_OP_SOFT_LIGHT
        BL_COMP_OP_DIFFERENCE
        BL_COMP_OP_EXCLUSION

    cdef enum BLExtendMode:
        BL_EXTEND_MODE_PAD
        BL_EXTEND_MODE_REPEAT
        BL_EXTEND_MODE_REFLECT
        BL_EXTEND_MODE_PAD_X_PAD_Y
        BL_EXTEND_MODE_REPEAT_X_REPEAT_Y
        BL_EXTEND_MODE_REFLECT_X_REFLECT_Y
        BL_EXTEND_MODE_PAD_X_REPEAT_Y
        BL_EXTEND_MODE_PAD_X_REFLECT_Y
        BL_EXTEND_MODE_REPEAT_X_PAD_Y
        BL_EXTEND_MODE_REPEAT_X_REFLECT_Y
        BL_EXTEND_MODE_REFLECT_X_PAD_Y
        BL_EXTEND_MODE_REFLECT_X_REPEAT_Y

    cdef enum BLFormat:
        BL_FORMAT_NONE
        BL_FORMAT_PRGB32
        BL_FORMAT_XRGB32
        BL_FORMAT_A8

    cdef enum BLGeometryDirection:
        BL_GEOMETRY_DIRECTION_NONE
        BL_GEOMETRY_DIRECTION_CW
        BL_GEOMETRY_DIRECTION_CCW

    cdef enum BLGeometryType:
        BL_GEOMETRY_TYPE_BOXI
        BL_GEOMETRY_TYPE_BOXD
        BL_GEOMETRY_TYPE_RECTI
        BL_GEOMETRY_TYPE_RECTD
        BL_GEOMETRY_TYPE_CIRCLE
        BL_GEOMETRY_TYPE_ELLIPSE
        BL_GEOMETRY_TYPE_ROUND_RECT
        BL_GEOMETRY_TYPE_ARC
        BL_GEOMETRY_TYPE_CHORD
        BL_GEOMETRY_TYPE_PIE
        BL_GEOMETRY_TYPE_LINE
        BL_GEOMETRY_TYPE_TRIANGLE
        BL_GEOMETRY_TYPE_POLYLINEI
        BL_GEOMETRY_TYPE_POLYLINED
        BL_GEOMETRY_TYPE_POLYGONI
        BL_GEOMETRY_TYPE_POLYGOND
        BL_GEOMETRY_TYPE_ARRAY_VIEW_BOXI
        BL_GEOMETRY_TYPE_ARRAY_VIEW_BOXD
        BL_GEOMETRY_TYPE_ARRAY_VIEW_RECTI
        BL_GEOMETRY_TYPE_ARRAY_VIEW_RECTD
        BL_GEOMETRY_TYPE_PATH
        BL_GEOMETRY_TYPE_REGION

    cdef enum BLGradientType:
        BL_GRADIENT_TYPE_LINEAR
        BL_GRADIENT_TYPE_RADIAL
        BL_GRADIENT_TYPE_CONICAL

    cdef enum BLImplType:
        BL_IMPL_TYPE_ARRAY_I8
        BL_IMPL_TYPE_ARRAY_U8
        BL_IMPL_TYPE_ARRAY_I16
        BL_IMPL_TYPE_ARRAY_U16
        BL_IMPL_TYPE_ARRAY_I32
        BL_IMPL_TYPE_ARRAY_U32
        BL_IMPL_TYPE_ARRAY_I64
        BL_IMPL_TYPE_ARRAY_U64
        BL_IMPL_TYPE_ARRAY_F32
        BL_IMPL_TYPE_ARRAY_F64

    cdef enum BLMatrix2DOp:
        BL_MATRIX2D_OP_RESET
        BL_MATRIX2D_OP_ASSIGN
        BL_MATRIX2D_OP_TRANSLATE
        BL_MATRIX2D_OP_SCALE
        BL_MATRIX2D_OP_SKEW
        BL_MATRIX2D_OP_ROTATE
        BL_MATRIX2D_OP_ROTATE_PT
        BL_MATRIX2D_OP_TRANSFORM
        BL_MATRIX2D_OP_POST_TRANSLATE
        BL_MATRIX2D_OP_POST_SCALE
        BL_MATRIX2D_OP_POST_SKEW
        BL_MATRIX2D_OP_POST_ROTATE
        BL_MATRIX2D_OP_POST_ROTATE_PT
        BL_MATRIX2D_OP_POST_TRANSFORM

    cdef enum BLTextEncoding:
        BL_TEXT_ENCODING_UTF8
        BL_TEXT_ENCODING_UTF16
        BL_TEXT_ENCODING_UTF32
        BL_TEXT_ENCODING_LATIN1

    ctypedef struct BLApproximationOptions:
        pass

    ctypedef struct BLArrayCore:
        pass

    ctypedef struct BLBox:
        pass

    ctypedef struct BLBoxI:
        pass

    ctypedef struct BLContextCookie:
        pass

    ctypedef struct BLContextCore:
        pass

    ctypedef struct BLContextCreateInfo:
        pass

    ctypedef struct BLContextHints:
        pass

    ctypedef struct BLFontCore:
        pass

    ctypedef struct BLFontDataCore:
        pass

    ctypedef struct BLFontDesignMetrics:
        pass

    ctypedef struct BLFontFaceCore:
        pass

    ctypedef struct BLFontFaceInfo:
        pass

    ctypedef struct BLFontManagerCore:
        pass

    ctypedef struct BLFontMatrix:
        pass

    ctypedef struct BLFontMetrics:
        pass

    ctypedef struct BLFontQueryProperties:
        pass

    ctypedef struct BLFontTable:
        pass

    ctypedef struct BLFontUnicodeCoverage:
        pass

    ctypedef struct BLFormatInfo:
        pass

    ctypedef struct BLGlyphBufferCore:
        pass

    ctypedef struct BLGlyphInfo:
        pass

    ctypedef struct BLGlyphMappingState:
        pass

    ctypedef struct BLGlyphPlacement:
        pass

    ctypedef struct BLGlyphRun:
        pass

    ctypedef struct BLGradientCore:
        pass

    ctypedef struct BLGradientStop:
        pass

    ctypedef struct BLImageCore:
        pass

    ctypedef struct BLImageData:
        pass

    ctypedef struct BLImageScaleOptions:
        pass

    ctypedef struct BLMatrix2D:
        pass

    ctypedef struct BLPathCore:
        pass

    ctypedef struct BLPatternCore:
        pass

    ctypedef struct BLPixelConverterCore:
        pass

    ctypedef struct BLPixelConverterOptions:
        pass

    ctypedef struct BLPoint:
        double x
        double y

    ctypedef struct BLPointI:
        pass

    ctypedef struct BLRect:
        double x
        double y
        double w
        double h

    ctypedef struct BLRectI:
        int x
        int y
        int w
        int h

    ctypedef struct BLRegionCore:
        pass

    ctypedef struct BLRgba:
        pass

    ctypedef struct BLSize:
        pass

    ctypedef struct BLSizeI:
        pass

    ctypedef struct BLStrokeOptionsCore:
        pass

    ctypedef struct BLStyleCore:
        pass

    ctypedef struct BLTextMetrics:
        pass

    ctypedef void (* BLDestroyImplFunc)(void* impl, void* destroyData)
    ctypedef BLResult (* BLPathSinkFunc)(BLPathCore* path, const void* info, void* closure)

    # BLArray
    BLResult blArrayInit(BLArrayCore* self, uint32_t arrayTypeId)
    BLResult blArrayDestroy(BLArrayCore* self)
    BLResult blArrayReset(BLArrayCore* self)
    BLResult blArrayCreateFromData(BLArrayCore* self, void* data, size_t size, size_t capacity, uint32_t dataAccessFlags, BLDestroyImplFunc destroyFunc, void* destroyData)
    size_t blArrayGetSize(const BLArrayCore* self)
    size_t blArrayGetCapacity(const BLArrayCore* self)
    const void* blArrayGetData(const BLArrayCore* self)
    BLResult blArrayClear(BLArrayCore* self)
    BLResult blArrayShrink(BLArrayCore* self)
    BLResult blArrayReserve(BLArrayCore* self, size_t n)
    BLResult blArrayResize(BLArrayCore* self, size_t n, const void* fill)
    BLResult blArrayMakeMutable(BLArrayCore* self, void** dataOut)
    BLResult blArrayModifyOp(BLArrayCore* self, uint32_t op, size_t n, void** dataOut)
    BLResult blArrayInsertOp(BLArrayCore* self, size_t index, size_t n, void** dataOut)
    BLResult blArrayAssignMove(BLArrayCore* self, BLArrayCore* other)
    BLResult blArrayAssignWeak(BLArrayCore* self, const BLArrayCore* other)
    BLResult blArrayAssignDeep(BLArrayCore* self, const BLArrayCore* other)
    BLResult blArrayAssignView(BLArrayCore* self, const void* items, size_t n)
    BLResult blArrayAppendU8(BLArrayCore* self, uint8_t value)
    BLResult blArrayAppendU16(BLArrayCore* self, uint16_t value)
    BLResult blArrayAppendU32(BLArrayCore* self, uint32_t value)
    BLResult blArrayAppendU64(BLArrayCore* self, uint64_t value)
    BLResult blArrayAppendF32(BLArrayCore* self, float value)
    BLResult blArrayAppendF64(BLArrayCore* self, double value)
    BLResult blArrayAppendItem(BLArrayCore* self, const void* item)
    BLResult blArrayAppendView(BLArrayCore* self, const void* items, size_t n)
    BLResult blArrayInsertU8(BLArrayCore* self, size_t index, uint8_t value)
    BLResult blArrayInsertU16(BLArrayCore* self, size_t index, uint16_t value)
    BLResult blArrayInsertU32(BLArrayCore* self, size_t index, uint32_t value)
    BLResult blArrayInsertU64(BLArrayCore* self, size_t index, uint64_t value)
    BLResult blArrayInsertF32(BLArrayCore* self, size_t index, float value)
    BLResult blArrayInsertF64(BLArrayCore* self, size_t index, double value)
    BLResult blArrayInsertItem(BLArrayCore* self, size_t index, const void* item)
    BLResult blArrayInsertView(BLArrayCore* self, size_t index, const void* items, size_t n)
    BLResult blArrayReplaceU8(BLArrayCore* self, size_t index, uint8_t value)
    BLResult blArrayReplaceU16(BLArrayCore* self, size_t index, uint16_t value)
    BLResult blArrayReplaceU32(BLArrayCore* self, size_t index, uint32_t value)
    BLResult blArrayReplaceU64(BLArrayCore* self, size_t index, uint64_t value)
    BLResult blArrayReplaceF32(BLArrayCore* self, size_t index, float value)
    BLResult blArrayReplaceF64(BLArrayCore* self, size_t index, double value)
    BLResult blArrayReplaceItem(BLArrayCore* self, size_t index, const void* item)
    BLResult blArrayReplaceView(BLArrayCore* self, size_t rStart, size_t rEnd, const void* items, size_t n)
    BLResult blArrayRemoveIndex(BLArrayCore* self, size_t index)
    BLResult blArrayRemoveRange(BLArrayCore* self, size_t rStart, size_t rEnd)
    bool blArrayEquals(const BLArrayCore* a, const BLArrayCore* b)

    # BLContext
    BLResult blContextInit(BLContextCore* self)
    BLResult blContextInitAs(BLContextCore* self, BLImageCore* image, const BLContextCreateInfo* options)
    BLResult blContextDestroy(BLContextCore* self)
    BLResult blContextReset(BLContextCore* self)
    BLResult blContextAssignMove(BLContextCore* self, BLContextCore* other)
    BLResult blContextAssignWeak(BLContextCore* self, const BLContextCore* other)
    uint32_t blContextGetType(const BLContextCore* self)
    BLResult blContextGetTargetSize(const BLContextCore* self, BLSize* targetSizeOut)
    BLImageCore* blContextGetTargetImage(const BLContextCore* self)
    BLResult blContextBegin(BLContextCore* self, BLImageCore* image, const BLContextCreateInfo* options)
    BLResult blContextEnd(BLContextCore* self)
    BLResult blContextFlush(BLContextCore* self, uint32_t flags)
    BLResult blContextQueryProperty(const BLContextCore* self, uint32_t propertyId, void* valueOut)
    BLResult blContextSave(BLContextCore* self, BLContextCookie* cookie)
    BLResult blContextRestore(BLContextCore* self, const BLContextCookie* cookie)
    BLResult blContextGetMetaMatrix(const BLContextCore* self, BLMatrix2D* m)
    BLResult blContextGetUserMatrix(const BLContextCore* self, BLMatrix2D* m)
    BLResult blContextUserToMeta(BLContextCore* self)
    BLResult blContextMatrixOp(BLContextCore* self, uint32_t opType, const void* opData)
    BLResult blContextSetHint(BLContextCore* self, uint32_t hintType, uint32_t value)
    BLResult blContextSetHints(BLContextCore* self, const BLContextHints* hints)
    BLResult blContextSetFlattenMode(BLContextCore* self, uint32_t mode)
    BLResult blContextSetFlattenTolerance(BLContextCore* self, double tolerance)
    BLResult blContextSetApproximationOptions(BLContextCore* self, const BLApproximationOptions* options)
    BLResult blContextSetCompOp(BLContextCore* self, uint32_t compOp)
    BLResult blContextSetGlobalAlpha(BLContextCore* self, double alpha)
    BLResult blContextSetFillAlpha(BLContextCore* self, double alpha)
    BLResult blContextGetFillStyle(const BLContextCore* self, BLStyleCore* styleOut)
    BLResult blContextSetFillStyle(BLContextCore* self, const BLStyleCore* style)
    BLResult blContextSetFillStyleRgba(BLContextCore* self, const BLRgba* rgba)
    BLResult blContextSetFillStyleRgba32(BLContextCore* self, uint32_t rgba32)
    BLResult blContextSetFillStyleRgba64(BLContextCore* self, uint64_t rgba64)
    BLResult blContextSetFillStyleObject(BLContextCore* self, const void* object)
    BLResult blContextSetFillRule(BLContextCore* self, uint32_t fillRule)
    BLResult blContextSetStrokeAlpha(BLContextCore* self, double alpha)
    BLResult blContextGetStrokeStyle(const BLContextCore* self, BLStyleCore* styleOut)
    BLResult blContextSetStrokeStyle(BLContextCore* self, const BLStyleCore* style)
    BLResult blContextSetStrokeStyleRgba(BLContextCore* self, const BLRgba* rgba)
    BLResult blContextSetStrokeStyleRgba32(BLContextCore* self, uint32_t rgba32)
    BLResult blContextSetStrokeStyleRgba64(BLContextCore* self, uint64_t rgba64)
    BLResult blContextSetStrokeStyleObject(BLContextCore* self, const void* object)
    BLResult blContextSetStrokeWidth(BLContextCore* self, double width)
    BLResult blContextSetStrokeMiterLimit(BLContextCore* self, double miterLimit)
    BLResult blContextSetStrokeCap(BLContextCore* self, uint32_t position, uint32_t strokeCap)
    BLResult blContextSetStrokeCaps(BLContextCore* self, uint32_t strokeCap)
    BLResult blContextSetStrokeJoin(BLContextCore* self, uint32_t strokeJoin)
    BLResult blContextSetStrokeDashOffset(BLContextCore* self, double dashOffset)
    BLResult blContextSetStrokeDashArray(BLContextCore* self, const BLArrayCore* dashArray)
    BLResult blContextSetStrokeTransformOrder(BLContextCore* self, uint32_t transformOrder)
    BLResult blContextGetStrokeOptions(const BLContextCore* self, BLStrokeOptionsCore* options)
    BLResult blContextSetStrokeOptions(BLContextCore* self, const BLStrokeOptionsCore* options)
    BLResult blContextClipToRectI(BLContextCore* self, const BLRectI* rect)
    BLResult blContextClipToRectD(BLContextCore* self, const BLRect* rect)
    BLResult blContextRestoreClipping(BLContextCore* self)
    BLResult blContextClearAll(BLContextCore* self)
    BLResult blContextClearRectI(BLContextCore* self, const BLRectI* rect)
    BLResult blContextClearRectD(BLContextCore* self, const BLRect* rect)
    BLResult blContextFillAll(BLContextCore* self)
    BLResult blContextFillRectI(BLContextCore* self, const BLRectI* rect)
    BLResult blContextFillRectD(BLContextCore* self, const BLRect* rect)
    BLResult blContextFillPathD(BLContextCore* self, const BLPathCore* path)
    BLResult blContextFillGeometry(BLContextCore* self, uint32_t geometryType, const void* geometryData)
    BLResult blContextFillTextI(BLContextCore* self, const BLPointI* pt, const BLFontCore* font, const void* text, size_t size, uint32_t encoding)
    BLResult blContextFillTextD(BLContextCore* self, const BLPoint* pt, const BLFontCore* font, const void* text, size_t size, uint32_t encoding)
    BLResult blContextFillGlyphRunI(BLContextCore* self, const BLPointI* pt, const BLFontCore* font, const BLGlyphRun* glyphRun)
    BLResult blContextFillGlyphRunD(BLContextCore* self, const BLPoint* pt, const BLFontCore* font, const BLGlyphRun* glyphRun)
    BLResult blContextStrokeRectI(BLContextCore* self, const BLRectI* rect)
    BLResult blContextStrokeRectD(BLContextCore* self, const BLRect* rect)
    BLResult blContextStrokePathD(BLContextCore* self, const BLPathCore* path)
    BLResult blContextStrokeGeometry(BLContextCore* self, uint32_t geometryType, const void* geometryData)
    BLResult blContextStrokeTextI(BLContextCore* self, const BLPointI* pt, const BLFontCore* font, const void* text, size_t size, uint32_t encoding)
    BLResult blContextStrokeTextD(BLContextCore* self, const BLPoint* pt, const BLFontCore* font, const void* text, size_t size, uint32_t encoding)
    BLResult blContextStrokeGlyphRunI(BLContextCore* self, const BLPointI* pt, const BLFontCore* font, const BLGlyphRun* glyphRun)
    BLResult blContextStrokeGlyphRunD(BLContextCore* self, const BLPoint* pt, const BLFontCore* font, const BLGlyphRun* glyphRun)
    BLResult blContextBlitImageI(BLContextCore* self, const BLPointI* pt, const BLImageCore* img, const BLRectI* imgArea)
    BLResult blContextBlitImageD(BLContextCore* self, const BLPoint* pt, const BLImageCore* img, const BLRectI* imgArea)
    BLResult blContextBlitScaledImageI(BLContextCore* self, const BLRectI* rect, const BLImageCore* img, const BLRectI* imgArea)
    BLResult blContextBlitScaledImageD(BLContextCore* self, const BLRect* rect, const BLImageCore* img, const BLRectI* imgArea)

    # BLFont
    BLResult blFontInit(BLFontCore* self)
    BLResult blFontDestroy(BLFontCore* self)
    BLResult blFontReset(BLFontCore* self)
    BLResult blFontAssignMove(BLFontCore* self, BLFontCore* other)
    BLResult blFontAssignWeak(BLFontCore* self, const BLFontCore* other)
    bool blFontEquals(const BLFontCore* a, const BLFontCore* b)
    BLResult blFontCreateFromFace(BLFontCore* self, const BLFontFaceCore* face, float size)
    BLResult blFontShape(const BLFontCore* self, BLGlyphBufferCore* gb)
    BLResult blFontMapTextToGlyphs(const BLFontCore* self, BLGlyphBufferCore* gb, BLGlyphMappingState* stateOut)
    BLResult blFontPositionGlyphs(const BLFontCore* self, BLGlyphBufferCore* gb, uint32_t positioningFlags)
    BLResult blFontApplyKerning(const BLFontCore* self, BLGlyphBufferCore* gb)
    BLResult blFontApplyGSub(const BLFontCore* self, BLGlyphBufferCore* gb, size_t index, BLBitWord lookups)
    BLResult blFontApplyGPos(const BLFontCore* self, BLGlyphBufferCore* gb, size_t index, BLBitWord lookups)
    BLResult blFontGetMatrix(const BLFontCore* self, BLFontMatrix* out)
    BLResult blFontGetMetrics(const BLFontCore* self, BLFontMetrics* out)
    BLResult blFontGetDesignMetrics(const BLFontCore* self, BLFontDesignMetrics* out)
    BLResult blFontGetTextMetrics(const BLFontCore* self, BLGlyphBufferCore* gb, BLTextMetrics* out)
    BLResult blFontGetGlyphBounds(const BLFontCore* self, const uint32_t* glyphData, intptr_t glyphAdvance, BLBoxI* out, size_t count)
    BLResult blFontGetGlyphAdvances(const BLFontCore* self, const uint32_t* glyphData, intptr_t glyphAdvance, BLGlyphPlacement* out, size_t count)
    BLResult blFontGetGlyphOutlines(const BLFontCore* self, uint32_t glyphId, const BLMatrix2D* userMatrix, BLPathCore* out, BLPathSinkFunc sink, void* closure)
    BLResult blFontGetGlyphRunOutlines(const BLFontCore* self, const BLGlyphRun* glyphRun, const BLMatrix2D* userMatrix, BLPathCore* out, BLPathSinkFunc sink, void* closure)

    # BLFontData
    BLResult blFontDataInit(BLFontDataCore* self)
    BLResult blFontDataDestroy(BLFontDataCore* self)
    BLResult blFontDataReset(BLFontDataCore* self)
    BLResult blFontDataAssignMove(BLFontDataCore* self, BLFontDataCore* other)
    BLResult blFontDataAssignWeak(BLFontDataCore* self, const BLFontDataCore* other)
    BLResult blFontDataCreateFromFile(BLFontDataCore* self, const char* fileName, uint32_t readFlags)
    BLResult blFontDataCreateFromDataArray(BLFontDataCore* self, const BLArrayCore* dataArray)
    BLResult blFontDataCreateFromData(BLFontDataCore* self, const void* data, size_t dataSize, BLDestroyImplFunc destroyFunc, void* destroyData)
    bool blFontDataEquals(const BLFontDataCore* a, const BLFontDataCore* b)
    BLResult blFontDataListTags(const BLFontDataCore* self, uint32_t faceIndex, BLArrayCore* dst)
    size_t blFontDataQueryTables(const BLFontDataCore* self, uint32_t faceIndex, BLFontTable* dst, const BLTag* tags, size_t count)

    # BLFontFace
    BLResult blFontFaceInit(BLFontFaceCore* self)
    BLResult blFontFaceDestroy(BLFontFaceCore* self)
    BLResult blFontFaceReset(BLFontFaceCore* self)
    BLResult blFontFaceAssignMove(BLFontFaceCore* self, BLFontFaceCore* other)
    BLResult blFontFaceAssignWeak(BLFontFaceCore* self, const BLFontFaceCore* other)
    bool blFontFaceEquals(const BLFontFaceCore* a, const BLFontFaceCore* b)
    BLResult blFontFaceCreateFromFile(BLFontFaceCore* self, const char* fileName, uint32_t readFlags)
    BLResult blFontFaceCreateFromData(BLFontFaceCore* self, const BLFontDataCore* fontData, uint32_t faceIndex)
    BLResult blFontFaceGetFaceInfo(const BLFontFaceCore* self, BLFontFaceInfo* out)
    BLResult blFontFaceGetDesignMetrics(const BLFontFaceCore* self, BLFontDesignMetrics* out)
    BLResult blFontFaceGetUnicodeCoverage(const BLFontFaceCore* self, BLFontUnicodeCoverage* out)

    # BLFontManager
    BLResult blFontManagerInit(BLFontManagerCore* self)
    BLResult blFontManagerInitNew(BLFontManagerCore* self)
    BLResult blFontManagerDestroy(BLFontManagerCore* self)
    BLResult blFontManagerReset(BLFontManagerCore* self)
    BLResult blFontManagerAssignMove(BLFontManagerCore* self, BLFontManagerCore* other)
    BLResult blFontManagerAssignWeak(BLFontManagerCore* self, const BLFontManagerCore* other)
    BLResult blFontManagerCreate(BLFontManagerCore* self)
    size_t blFontManagerGetFaceCount(const BLFontManagerCore* self)
    size_t blFontManagerGetFamilyCount(const BLFontManagerCore* self)
    bool blFontManagerHasFace(const BLFontManagerCore* self, const BLFontFaceCore* face)
    BLResult blFontManagerAddFace(BLFontManagerCore* self, const BLFontFaceCore* face)
    BLResult blFontManagerQueryFace(const BLFontManagerCore* self, const char* name, size_t nameSize, const BLFontQueryProperties* properties, BLFontFaceCore* out)
    BLResult blFontManagerQueryFacesByFamilyName(const BLFontManagerCore* self, const char* name, size_t nameSize, BLArrayCore* out)
    bool blFontManagerEquals(const BLFontManagerCore* a, const BLFontManagerCore* b)

    # BLFormat
    BLResult blFormatInfoSanitize(BLFormatInfo* self)

    # BLGlyphBuffer
    BLResult blGlyphBufferInit(BLGlyphBufferCore* self)
    BLResult blGlyphBufferInitMove(BLGlyphBufferCore* self, BLGlyphBufferCore* other)
    BLResult blGlyphBufferDestroy(BLGlyphBufferCore* self)
    BLResult blGlyphBufferReset(BLGlyphBufferCore* self)
    BLResult blGlyphBufferClear(BLGlyphBufferCore* self)
    size_t blGlyphBufferGetSize(const BLGlyphBufferCore* self)
    uint32_t blGlyphBufferGetFlags(const BLGlyphBufferCore* self)
    const BLGlyphRun* blGlyphBufferGetGlyphRun(const BLGlyphBufferCore* self)
    const uint32_t* blGlyphBufferGetContent(const BLGlyphBufferCore* self)
    const BLGlyphInfo* blGlyphBufferGetInfoData(const BLGlyphBufferCore* self)
    const BLGlyphPlacement* blGlyphBufferGetPlacementData(const BLGlyphBufferCore* self)
    BLResult blGlyphBufferSetText(BLGlyphBufferCore* self, const void* textData, size_t size, uint32_t encoding)
    BLResult blGlyphBufferSetGlyphs(BLGlyphBufferCore* self, const uint32_t* glyphData, size_t size)
    BLResult blGlyphBufferSetGlyphsFromStruct(BLGlyphBufferCore* self, const void* glyphData, size_t size, size_t glyphIdSize, intptr_t glyphIdAdvance)

    # BLGradient
    BLResult blGradientInit(BLGradientCore* self)
    BLResult blGradientInitAs(BLGradientCore* self, uint32_t type, const void* values, uint32_t extendMode, const BLGradientStop* stops, size_t n, const BLMatrix2D* m)
    BLResult blGradientDestroy(BLGradientCore* self)
    BLResult blGradientReset(BLGradientCore* self)
    BLResult blGradientAssignMove(BLGradientCore* self, BLGradientCore* other)
    BLResult blGradientAssignWeak(BLGradientCore* self, const BLGradientCore* other)
    BLResult blGradientCreate(BLGradientCore* self, uint32_t type, const void* values, uint32_t extendMode, const BLGradientStop* stops, size_t n, const BLMatrix2D* m)
    BLResult blGradientShrink(BLGradientCore* self)
    BLResult blGradientReserve(BLGradientCore* self, size_t n)
    uint32_t blGradientGetType(const BLGradientCore* self)
    BLResult blGradientSetType(BLGradientCore* self, uint32_t type)
    double blGradientGetValue(const BLGradientCore* self, size_t index)
    BLResult blGradientSetValue(BLGradientCore* self, size_t index, double value)
    BLResult blGradientSetValues(BLGradientCore* self, size_t index, const double* values, size_t n)
    uint32_t blGradientGetExtendMode(BLGradientCore* self)
    BLResult blGradientSetExtendMode(BLGradientCore* self, uint32_t extendMode)
    size_t blGradientGetSize(const BLGradientCore* self)
    size_t blGradientGetCapacity(const BLGradientCore* self)
    const BLGradientStop* blGradientGetStops(const BLGradientCore* self)
    BLResult blGradientResetStops(BLGradientCore* self)
    BLResult blGradientAssignStops(BLGradientCore* self, const BLGradientStop* stops, size_t n)
    BLResult blGradientAddStopRgba32(BLGradientCore* self, double offset, uint32_t argb32)
    BLResult blGradientAddStopRgba64(BLGradientCore* self, double offset, uint64_t argb64)
    BLResult blGradientRemoveStop(BLGradientCore* self, size_t index)
    BLResult blGradientRemoveStopByOffset(BLGradientCore* self, double offset, uint32_t all)
    BLResult blGradientRemoveStops(BLGradientCore* self, size_t rStart, size_t rEnd)
    BLResult blGradientRemoveStopsFromTo(BLGradientCore* self, double offsetMin, double offsetMax)
    BLResult blGradientReplaceStopRgba32(BLGradientCore* self, size_t index, double offset, uint32_t rgba32)
    BLResult blGradientReplaceStopRgba64(BLGradientCore* self, size_t index, double offset, uint64_t rgba64)
    size_t blGradientIndexOfStop(const BLGradientCore* self, double offset)
    BLResult blGradientApplyMatrixOp(BLGradientCore* self, uint32_t opType, const void* opData)
    bool blGradientEquals(const BLGradientCore* a, const BLGradientCore* b)

    # BLImage
    BLResult blImageInit(BLImageCore* self)
    BLResult blImageInitAs(BLImageCore* self, int w, int h, uint32_t format)
    BLResult blImageInitAsFromData(BLImageCore* self, int w, int h, uint32_t format, void* pixelData, intptr_t stride, BLDestroyImplFunc destroyFunc, void* destroyData)
    BLResult blImageDestroy(BLImageCore* self)
    BLResult blImageReset(BLImageCore* self)
    BLResult blImageAssignMove(BLImageCore* self, BLImageCore* other)
    BLResult blImageAssignWeak(BLImageCore* self, const BLImageCore* other)
    BLResult blImageAssignDeep(BLImageCore* self, const BLImageCore* other)
    BLResult blImageCreate(BLImageCore* self, int w, int h, uint32_t format)
    BLResult blImageCreateFromData(BLImageCore* self, int w, int h, uint32_t format, void* pixelData, intptr_t stride, BLDestroyImplFunc destroyFunc, void* destroyData)
    BLResult blImageGetData(const BLImageCore* self, BLImageData* dataOut)
    BLResult blImageMakeMutable(BLImageCore* self, BLImageData* dataOut)
    BLResult blImageConvert(BLImageCore* self, uint32_t format)
    bool blImageEquals(const BLImageCore* a, const BLImageCore* b)
    BLResult blImageScale(BLImageCore* dst, const BLImageCore* src, const BLSizeI* size, uint32_t filter, const BLImageScaleOptions* options)

    # BLMatrix2D
    BLResult blMatrix2DSetIdentity(BLMatrix2D* self)
    BLResult blMatrix2DSetTranslation(BLMatrix2D* self, double x, double y)
    BLResult blMatrix2DSetScaling(BLMatrix2D* self, double x, double y)
    BLResult blMatrix2DSetSkewing(BLMatrix2D* self, double x, double y)
    BLResult blMatrix2DSetRotation(BLMatrix2D* self, double angle, double cx, double cy)
    BLResult blMatrix2DApplyOp(BLMatrix2D* self, uint32_t opType, const void* opData)
    BLResult blMatrix2DInvert(BLMatrix2D* dst, const BLMatrix2D* src)
    uint32_t blMatrix2DGetType(const BLMatrix2D* self)
    BLResult blMatrix2DMapPointDArray(const BLMatrix2D* self, BLPoint* dst, const BLPoint* src, size_t count)

    # BLPath
    BLResult blPathInit(BLPathCore* self)
    BLResult blPathDestroy(BLPathCore* self)
    BLResult blPathReset(BLPathCore* self)
    size_t blPathGetSize(const BLPathCore* self)
    size_t blPathGetCapacity(const BLPathCore* self)
    const uint8_t* blPathGetCommandData(const BLPathCore* self)
    const BLPoint* blPathGetVertexData(const BLPathCore* self)
    BLResult blPathClear(BLPathCore* self)
    BLResult blPathShrink(BLPathCore* self)
    BLResult blPathReserve(BLPathCore* self, size_t n)
    BLResult blPathModifyOp(BLPathCore* self, uint32_t op, size_t n, uint8_t** cmdDataOut, BLPoint** vtxDataOut)
    BLResult blPathAssignMove(BLPathCore* self, BLPathCore* other)
    BLResult blPathAssignWeak(BLPathCore* self, const BLPathCore* other)
    BLResult blPathAssignDeep(BLPathCore* self, const BLPathCore* other)
    BLResult blPathSetVertexAt(BLPathCore* self, size_t index, uint32_t cmd, double x, double y)
    BLResult blPathMoveTo(BLPathCore* self, double x0, double y0)
    BLResult blPathLineTo(BLPathCore* self, double x1, double y1)
    BLResult blPathPolyTo(BLPathCore* self, const BLPoint* poly, size_t count)
    BLResult blPathQuadTo(BLPathCore* self, double x1, double y1, double x2, double y2)
    BLResult blPathCubicTo(BLPathCore* self, double x1, double y1, double x2, double y2, double x3, double y3)
    BLResult blPathSmoothQuadTo(BLPathCore* self, double x2, double y2)
    BLResult blPathSmoothCubicTo(BLPathCore* self, double x2, double y2, double x3, double y3)
    BLResult blPathArcTo(BLPathCore* self, double x, double y, double rx, double ry, double start, double sweep, bool forceMoveTo)
    BLResult blPathArcQuadrantTo(BLPathCore* self, double x1, double y1, double x2, double y2)
    BLResult blPathEllipticArcTo(BLPathCore* self, double rx, double ry, double xAxisRotation, bool largeArcFlag, bool sweepFlag, double x1, double y1)
    BLResult blPathClose(BLPathCore* self)
    BLResult blPathAddGeometry(BLPathCore* self, uint32_t geometryType, const void* geometryData, const BLMatrix2D* m, uint32_t dir)
    BLResult blPathAddBoxI(BLPathCore* self, const BLBoxI* box, uint32_t dir)
    BLResult blPathAddBoxD(BLPathCore* self, const BLBox* box, uint32_t dir)
    BLResult blPathAddRectI(BLPathCore* self, const BLRectI* rect, uint32_t dir)
    BLResult blPathAddRectD(BLPathCore* self, const BLRect* rect, uint32_t dir)
    BLResult blPathAddPath(BLPathCore* self, const BLPathCore* other, const BLRange* range)
    BLResult blPathAddTranslatedPath(BLPathCore* self, const BLPathCore* other, const BLRange* range, const BLPoint* p)
    BLResult blPathAddTransformedPath(BLPathCore* self, const BLPathCore* other, const BLRange* range, const BLMatrix2D* m)
    BLResult blPathAddReversedPath(BLPathCore* self, const BLPathCore* other, const BLRange* range, uint32_t reverseMode)
    BLResult blPathAddStrokedPath(BLPathCore* self, const BLPathCore* other, const BLRange* range, const BLStrokeOptionsCore* options, const BLApproximationOptions* approx)
    BLResult blPathRemoveRange(BLPathCore* self, const BLRange* range)
    BLResult blPathTranslate(BLPathCore* self, const BLRange* range, const BLPoint* p)
    BLResult blPathTransform(BLPathCore* self, const BLRange* range, const BLMatrix2D* m)
    BLResult blPathFitTo(BLPathCore* self, const BLRange* range, const BLRect* rect, uint32_t fitFlags)
    bool blPathEquals(const BLPathCore* a, const BLPathCore* b)
    BLResult blPathGetInfoFlags(const BLPathCore* self, uint32_t* flagsOut)
    BLResult blPathGetControlBox(const BLPathCore* self, BLBox* boxOut)
    BLResult blPathGetBoundingBox(const BLPathCore* self, BLBox* boxOut)
    BLResult blPathGetFigureRange(const BLPathCore* self, size_t index, BLRange* rangeOut)
    BLResult blPathGetLastVertex(const BLPathCore* self, BLPoint* vtxOut)
    BLResult blPathGetClosestVertex(const BLPathCore* self, const BLPoint* p, double maxDistance, size_t* indexOut, double* distanceOut)
    uint32_t blPathHitTest(const BLPathCore* self, const BLPoint* p, uint32_t fillRule)

    # BLPattern
    BLResult blPatternInit(BLPatternCore* self)
    BLResult blPatternInitAs(BLPatternCore* self, const BLImageCore* image, const BLRectI* area, uint32_t extendMode, const BLMatrix2D* m)
    BLResult blPatternDestroy(BLPatternCore* self)
    BLResult blPatternReset(BLPatternCore* self)
    BLResult blPatternAssignMove(BLPatternCore* self, BLPatternCore* other)
    BLResult blPatternAssignWeak(BLPatternCore* self, const BLPatternCore* other)
    BLResult blPatternAssignDeep(BLPatternCore* self, const BLPatternCore* other)
    BLResult blPatternCreate(BLPatternCore* self, const BLImageCore* image, const BLRectI* area, uint32_t extendMode, const BLMatrix2D* m)
    BLResult blPatternSetImage(BLPatternCore* self, const BLImageCore* image, const BLRectI* area)
    BLResult blPatternSetArea(BLPatternCore* self, const BLRectI* area)
    BLResult blPatternSetExtendMode(BLPatternCore* self, uint32_t extendMode)
    BLResult blPatternApplyMatrixOp(BLPatternCore* self, uint32_t opType, const void* opData)
    bool blPatternEquals(const BLPatternCore* a, const BLPatternCore* b)

    # BLPixelConverter
    BLResult blPixelConverterInit(BLPixelConverterCore* self)
    BLResult blPixelConverterInitWeak(BLPixelConverterCore* self, const BLPixelConverterCore* other)
    BLResult blPixelConverterDestroy(BLPixelConverterCore* self)
    BLResult blPixelConverterReset(BLPixelConverterCore* self)
    BLResult blPixelConverterAssign(BLPixelConverterCore* self, const BLPixelConverterCore* other)
    BLResult blPixelConverterCreate(BLPixelConverterCore* self, const BLFormatInfo* dstInfo, const BLFormatInfo* srcInfo, uint32_t createFlags)
    BLResult blPixelConverterConvert(const BLPixelConverterCore* self, void* dstData, intptr_t dstStride, const void* srcData, intptr_t srcStride, uint32_t w, uint32_t h, const BLPixelConverterOptions* options)

    # BLRegion
    BLResult blRegionInit(BLRegionCore* self)
    BLResult blRegionDestroy(BLRegionCore* self)
    BLResult blRegionReset(BLRegionCore* self)
    size_t blRegionGetSize(const BLRegionCore* self)
    size_t blRegionGetCapacity(const BLRegionCore* self)
    const BLBoxI* blRegionGetData(const BLRegionCore* self)
    BLResult blRegionClear(BLRegionCore* self)
    BLResult blRegionShrink(BLRegionCore* self)
    BLResult blRegionReserve(BLRegionCore* self, size_t n)
    BLResult blRegionAssignMove(BLRegionCore* self, BLRegionCore* other)
    BLResult blRegionAssignWeak(BLRegionCore* self, const BLRegionCore* other)
    BLResult blRegionAssignDeep(BLRegionCore* self, const BLRegionCore* other)
    BLResult blRegionAssignBoxI(BLRegionCore* self, const BLBoxI* src)
    BLResult blRegionAssignBoxIArray(BLRegionCore* self, const BLBoxI* data, size_t n)
    BLResult blRegionAssignRectI(BLRegionCore* self, const BLRectI* rect)
    BLResult blRegionAssignRectIArray(BLRegionCore* self, const BLRectI* data, size_t n)
    BLResult blRegionCombine(BLRegionCore* self, const BLRegionCore* a, const BLRegionCore* b, uint32_t booleanOp)
    BLResult blRegionCombineRB(BLRegionCore* self, const BLRegionCore* a, const BLBoxI* b, uint32_t booleanOp)
    BLResult blRegionCombineBR(BLRegionCore* self, const BLBoxI* a, const BLRegionCore* b, uint32_t booleanOp)
    BLResult blRegionCombineBB(BLRegionCore* self, const BLBoxI* a, const BLBoxI* b, uint32_t booleanOp)
    BLResult blRegionTranslate(BLRegionCore* self, const BLRegionCore* r, const BLPointI* pt)
    BLResult blRegionTranslateAndClip(BLRegionCore* self, const BLRegionCore* r, const BLPointI* pt, const BLBoxI* clipBox)
    BLResult blRegionIntersectAndClip(BLRegionCore* self, const BLRegionCore* a, const BLRegionCore* b, const BLBoxI* clipBox)
    bool blRegionEquals(const BLRegionCore* a, const BLRegionCore* b)
    uint32_t blRegionGetType(const BLRegionCore* self)
    uint32_t blRegionHitTest(const BLRegionCore* self, const BLPointI* pt)
    uint32_t blRegionHitTestBoxI(const BLRegionCore* self, const BLBoxI* box)

    # BLRuntime
    BLResult blRuntimeInit()
    BLResult blRuntimeShutdown()
    BLResult blRuntimeCleanup(uint32_t cleanupFlags)
    BLResult blRuntimeQueryInfo(uint32_t infoType, void* infoOut)
    # BLResult blRuntimeMessageOut(const char* msg)
    # BLResult blRuntimeMessageFmt(const char* fmt, ...)
    # BLResult blRuntimeMessageVFmt(const char* fmt, va_list ap)
    # void blRuntimeAssertionFailure(const char* file, int line, const char* msg)

    # IF _WIN32:
    #     BLResult blResultFromWinError(uint32_t e)
    # ELSE:
    #     BLResult blResultFromPosixError(int e)

    # BLStrokeOptions
    BLResult blStrokeOptionsInit(BLStrokeOptionsCore* self)
    BLResult blStrokeOptionsInitMove(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other)
    BLResult blStrokeOptionsInitWeak(BLStrokeOptionsCore* self, const BLStrokeOptionsCore* other)
    BLResult blStrokeOptionsReset(BLStrokeOptionsCore* self)
    BLResult blStrokeOptionsAssignMove(BLStrokeOptionsCore* self, BLStrokeOptionsCore* other)
    BLResult blStrokeOptionsAssignWeak(BLStrokeOptionsCore* self, const BLStrokeOptionsCore* other)

    # BLVariant
    BLResult blVariantInit(void* self)
    BLResult blVariantInitMove(void* self, void* other)
    BLResult blVariantInitWeak(void* self, const void* other)
    BLResult blVariantDestroy(void* self)
    BLResult blVariantReset(void* self)
    uint32_t blVariantGetImplType(const void* self)
    BLResult blVariantAssignMove(void* self, void* other)
    BLResult blVariantAssignWeak(void* self, const void* other)
    bool blVariantEquals(const void* a, const void* b)
