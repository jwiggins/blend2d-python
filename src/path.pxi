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

# BLPath
# BLResult blPathInit(BLPathCore* self)
# BLResult blPathDestroy(BLPathCore* self)
# BLResult blPathReset(BLPathCore* self)
# size_t blPathGetSize(const BLPathCore* self)
# size_t blPathGetCapacity(const BLPathCore* self)
# const uint8_t* blPathGetCommandData(const BLPathCore* self)
# const BLPoint* blPathGetVertexData(const BLPathCore* self)
# BLResult blPathClear(BLPathCore* self)
# BLResult blPathShrink(BLPathCore* self)
# BLResult blPathReserve(BLPathCore* self, size_t n)
# BLResult blPathModifyOp(BLPathCore* self, uint32_t op, size_t n, uint8_t** cmdDataOut, BLPoint** vtxDataOut)
# BLResult blPathAssignMove(BLPathCore* self, BLPathCore* other)
# BLResult blPathAssignWeak(BLPathCore* self, const BLPathCore* other)
# BLResult blPathAssignDeep(BLPathCore* self, const BLPathCore* other)
# BLResult blPathSetVertexAt(BLPathCore* self, size_t index, uint32_t cmd, double x, double y)
# BLResult blPathMoveTo(BLPathCore* self, double x0, double y0)
# BLResult blPathLineTo(BLPathCore* self, double x1, double y1)
# BLResult blPathPolyTo(BLPathCore* self, const BLPoint* poly, size_t count)
# BLResult blPathQuadTo(BLPathCore* self, double x1, double y1, double x2, double y2)
# BLResult blPathCubicTo(BLPathCore* self, double x1, double y1, double x2, double y2, double x3, double y3)
# BLResult blPathSmoothQuadTo(BLPathCore* self, double x2, double y2)
# BLResult blPathSmoothCubicTo(BLPathCore* self, double x2, double y2, double x3, double y3)
# BLResult blPathArcTo(BLPathCore* self, double x, double y, double rx, double ry, double start, double sweep, bool forceMoveTo)
# BLResult blPathArcQuadrantTo(BLPathCore* self, double x1, double y1, double x2, double y2)
# BLResult blPathEllipticArcTo(BLPathCore* self, double rx, double ry, double xAxisRotation, bool largeArcFlag, bool sweepFlag, double x1, double y1)
# BLResult blPathClose(BLPathCore* self)
# BLResult blPathAddGeometry(BLPathCore* self, uint32_t geometryType, const void* geometryData, const BLMatrix2D* m, uint32_t dir)
# BLResult blPathAddBoxI(BLPathCore* self, const BLBoxI* box, uint32_t dir)
# BLResult blPathAddBoxD(BLPathCore* self, const BLBox* box, uint32_t dir)
# BLResult blPathAddRectI(BLPathCore* self, const BLRectI* rect, uint32_t dir)
# BLResult blPathAddRectD(BLPathCore* self, const BLRect* rect, uint32_t dir)
# BLResult blPathAddPath(BLPathCore* self, const BLPathCore* other, const BLRange* range)
# BLResult blPathAddTranslatedPath(BLPathCore* self, const BLPathCore* other, const BLRange* range, const BLPoint* p)
# BLResult blPathAddTransformedPath(BLPathCore* self, const BLPathCore* other, const BLRange* range, const BLMatrix2D* m)
# BLResult blPathAddReversedPath(BLPathCore* self, const BLPathCore* other, const BLRange* range, uint32_t reverseMode)
# BLResult blPathAddStrokedPath(BLPathCore* self, const BLPathCore* other, const BLRange* range, const BLStrokeOptionsCore* options, const BLApproximationOptions* approx)
# BLResult blPathRemoveRange(BLPathCore* self, const BLRange* range)
# BLResult blPathTranslate(BLPathCore* self, const BLRange* range, const BLPoint* p)
# BLResult blPathTransform(BLPathCore* self, const BLRange* range, const BLMatrix2D* m)
# BLResult blPathFitTo(BLPathCore* self, const BLRange* range, const BLRect* rect, uint32_t fitFlags)
# bool blPathEquals(const BLPathCore* a, const BLPathCore* b)
# BLResult blPathGetInfoFlags(const BLPathCore* self, uint32_t* flagsOut)
# BLResult blPathGetControlBox(const BLPathCore* self, BLBox* boxOut)
# BLResult blPathGetBoundingBox(const BLPathCore* self, BLBox* boxOut)
# BLResult blPathGetFigureRange(const BLPathCore* self, size_t index, BLRange* rangeOut)
# BLResult blPathGetLastVertex(const BLPathCore* self, BLPoint* vtxOut)
# BLResult blPathGetClosestVertex(const BLPathCore* self, const BLPoint* p, double maxDistance, size_t* indexOut, double* distanceOut)
# uint32_t blPathHitTest(const BLPathCore* self, const BLPoint* p, uint32_t fillRule)

cdef class Path:
    cdef _capi.BLPathCore _self

    def __cinit__(self):
        _capi.blPathInit(&self._self)

    def __dealloc__(self):
        _capi.blPathDestroy(&self._self)

    def close(self):
        _capi.blPathClose(&self._self)

    def reset(self):
        _capi.blPathClear(&self._self)

    def add_path(self, Path other):
        cdef _capi.BLRange rng
        rng.start = 0
        rng.end = 1  # XXX: What should this be?
        _capi.blPathAddPath(&self._self, &other._self, &rng)

    def move_to(self, double x, double y):
        _capi.blPathMoveTo(&self._self, x, y)

    def line_to(self, double x, double y):
        _capi.blPathLineTo(&self._self, x, y)

    def quadric_to(self, double x_ctrl, double y_ctrl, double x_to, double y_to):
        _capi.blPathQuadTo(&self._self, x_ctrl, y_ctrl, x_to, y_to)

    def cubic_to(self, double x_ctrl1, double y_ctrl1,
                 double x_ctrl2, double y_ctrl2, double x_to, double y_to):
        _capi.blPathCubicTo(&self._self, x_ctrl1, y_ctrl1, x_ctrl2, y_ctrl2, x_to, y_to)

    def ellipse(self, double cx, double cy, double rx, double ry):
        """ellipse(cx, cy, rx, ry)
        Adds an ellipse to the path.

        :param cx: Center X coordinate of the ellipse
        :param cy: Center Y coordinate of the ellipse
        :param rx: Ellipse radii x dimension.
        :param ry: Ellipse radii y dimension.
        """
        # XXX: blPathAddGeometry(..., BL_GEOMETRY_TYPE_ELLIPSE, ...) is broken?
        cdef:
            double BL_MATH_KAPPA = 0.55228474983
            double x0, y0
            double kx, ky

        x0 = cx
        y0 = cy
        kx = rx * BL_MATH_KAPPA
        ky = ry * BL_MATH_KAPPA
        _capi.blPathMoveTo(&self._self, x0 + rx, y0)
        _capi.blPathCubicTo(&self._self, x0 + rx, y0 + ky, x0 + kx, y0 + ry, x0, y0 + ry)
        _capi.blPathCubicTo(&self._self, x0 - kx, y0 + ry, x0 - rx, y0 + ky, x0 - rx, y0)
        _capi.blPathCubicTo(&self._self, x0 - rx, y0 - ky, x0 - kx, y0 - ry, x0, y0 - ry)
        _capi.blPathCubicTo(&self._self, x0 + kx, y0 - ry, x0 + rx, y0 - ky, x0 + rx, y0)
        _capi.blPathClose(&self._self)

    def rect(self, double x, double y, double width, double height):
        """rect(x, y, width, height)
        Adds a rectangle to the path.

        :param x: Rectangle X position
        :param y: Rectangle Y position
        :param width: Rectangle widtht
        :param height: Rectangle height
        """
        cdef _capi.BLRect data
        data.x = x
        data.y = y
        data.w = width
        data.h = height
        _capi.blPathAddGeometry(&self._self, _capi.BL_GEOMETRY_TYPE_RECTD,
                                &data, NULL, _capi.BL_GEOMETRY_DIRECTION_NONE)
