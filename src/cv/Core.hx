package cv;

import #if cpp cpp #else neko #end.Lib;
import cv.core.*;
import cv.core.Scalar.Scalar_;
import cv.core.Scalar.RGB;

import cv.Macros;

typedef Arr = NativeBinding; // Image|Mat|Seq?

typedef Font = NativeBinding;

class Core implements CvConsts implements CvProcs {
    @:allow(cv.core)
    static inline function load(n:String, p:Int=0):Dynamic
        return Lib.load("opencv", "hx_cv_core_"+n, p);

    @:CvConst var CV_TERMCRIT_ITER;
    @:CvConst var CV_TERMCRIT_NUMBER;
    @:CvConst var CV_TERMCRIT_EPS;

    @:CvConst var CV_8U;
    @:CvConst var CV_8UC1;
    @:CvConst var CV_8UC2;
    @:CvConst var CV_8UC3;
    @:CvConst var CV_8UC4;

    @:CvConst var CV_8S;
    @:CvConst var CV_8SC1;
    @:CvConst var CV_8SC2;
    @:CvConst var CV_8SC3;
    @:CvConst var CV_8SC4;

    @:CvConst var CV_16U;
    @:CvConst var CV_16UC1;
    @:CvConst var CV_16UC2;
    @:CvConst var CV_16UC3;
    @:CvConst var CV_16UC4;

    @:CvConst var CV_16S;
    @:CvConst var CV_16SC1;
    @:CvConst var CV_16SC2;
    @:CvConst var CV_16SC3;
    @:CvConst var CV_16SC4;

    @:CvConst var CV_32S;
    @:CvConst var CV_32SC1;
    @:CvConst var CV_32SC2;
    @:CvConst var CV_32SC3;
    @:CvConst var CV_32SC4;

    @:CvConst var CV_32F;
    @:CvConst var CV_32FC1;
    @:CvConst var CV_32FC2;
    @:CvConst var CV_32FC3;
    @:CvConst var CV_32FC4;

    @:CvConst var CV_64F;
    @:CvConst var CV_64FC1;
    @:CvConst var CV_64FC2;
    @:CvConst var CV_64FC3;
    @:CvConst var CV_64FC4;

    @:CvProc function CV_8UC (N:Int) return [CV_8UC1,  CV_8UC2,  CV_8UC3,  CV_8UC4 ][N-1];
    @:CvProc function CV_8SC (N:Int) return [CV_8SC1,  CV_8SC2,  CV_8SC3,  CV_8SC4 ][N-1];
    @:CvProc function CV_16UC(N:Int) return [CV_16UC1, CV_16UC2, CV_16UC3, CV_16UC4][N-1];
    @:CvProc function CV_16SC(N:Int) return [CV_16SC1, CV_16SC2, CV_16SC3, CV_16SC4][N-1];
    @:CvProc function CV_32SC(N:Int) return [CV_32SC1, CV_32SC2, CV_32SC3, CV_32SC4][N-1];
    @:CvProc function CV_32FC(N:Int) return [CV_32FC1, CV_32FC2, CV_32FC3, CV_32FC4][N-1];
    @:CvProc function CV_64FC(N:Int) return [CV_64FC1, CV_64FC2, CV_64FC3, CV_64FC4][N-1];


    @:CvConst var IPL_DEPTH_8U;
    @:CvConst var IPL_DEPTH_8S;
    @:CvConst var IPL_DEPTH_16U;
    @:CvConst var IPL_DEPTH_16S;
    @:CvConst var IPL_DEPTH_32S;
    @:CvConst var IPL_DEPTH_32F;
    @:CvConst var IPL_DEPTH_64F;

    @:CvConst var CV_CMP_EQ;
    @:CvConst var CV_CMP_GT;
    @:CvConst var CV_CMP_GE;
    @:CvConst var CV_CMP_LT;
    @:CvConst var CV_CMP_LE;
    @:CvConst var CV_CMP_NE;


    @:CvConst var CV_DXT_FORWARD;
    @:CvConst var CV_DXT_INVERSE;
    @:CvConst var CV_DXT_SCALE;
    @:CvConst var CV_DXT_ROWS;
    @:CvConst var CV_DXT_INVERSE_SCALE;


    @:CvConst var CV_AA;
    @:CvConst var CV_FILLED;


    @:CvConst var CV_FONT_HERSHEY_SIMPLEX;
    @:CvConst var CV_FONT_HERSHEY_PLAIN;
    @:CvConst var CV_FONT_HERSHEY_DUPLEX;
    @:CvConst var CV_FONT_HERSHEY_COMPLEX;
    @:CvConst var CV_FONT_HERSHEY_TRIPLEX;
    @:CvConst var CV_FONT_HERSHEY_COMPLEX_SMALL;
    @:CvConst var CV_FONT_HERSHEY_SCRIPT_SIMPLEX;
    @:CvConst var CV_FONT_HERSHEY_SCRIPT_COMPLEX;
    @:CvConst var CV_FONT_ITALIC;


    @:CvProc function absDiff(src1:Arr, src2:Arr, dst:Arr)
        load("absDiff", 3)(src1.nativeObject, src2.nativeObject, dst.nativeObject);
    @:CvProc function absDiffS(src:Arr, value:Scalar, dst:Arr) {
        var _value:Scalar_ = value;
        load("absDiffS", 3)(src.nativeObject, _value.nativeObject, dst.nativeObject);
    }
    @:CvProc function add(src1:Arr, src2:Arr, dst:Arr, ?mask:Null<Arr>)
        load("add", 4)(src1.nativeObject, src2.nativeObject, dst.nativeObject, NativeBinding.native(mask));
    @:CvProc function addS(src:Arr, value:Scalar, dst:Arr, ?mask:Null<Arr>) {
        var _value:Scalar_ = value;
        load("addS", 4)(src.nativeObject, _value.nativeObject, dst.nativeObject, NativeBinding.native(mask));
    }
    @:CvProc function addWeighted(src1:Arr, alpha:Float, src2:Arr, beta:Float, gamma:Float, dst:Arr)
        load("addWeighted", 6)(src1.nativeObject, alpha, src2.nativeObject, beta, gamma, dst.nativeObject);
    @:CvProc function and(src1:Arr, src2:Arr, dst:Arr, ?mask:Null<Arr>)
        load("and", 4)(src1.nativeObject, src2.nativeObject, dst.nativeObject, NativeBinding.native(mask));
    @:CvProc function andS(src:Arr, value:Scalar, dst:Arr, ?mask:Null<Arr>) {
        var _value:Scalar_ = value;
        load("andS", 4)(src.nativeObject, _value.nativeObject, dst.nativeObject, NativeBinding.native(mask));
    }
    @:CvProc function avg(arr:Arr, ?mask:Null<Arr>):Scalar
        return Scalar.cvt(load("avg", 2)(arr.nativeObject, NativeBinding.native(mask)));
    @:CvProc function avgSdv(arr:Arr, mean:Scalar, stdDev:Scalar, ?mask:Null<Arr>) {
        var _mean  :Scalar_ = mean;
        var _stdDev:Scalar_ = stdDev;
        load("avgSdv", 4)(arr.nativeObject, _mean.nativeObject, _stdDev.nativeObject, NativeBinding.native(mask));
    }
    @:CvProc function cloneImage(image:Image):Image
        return new Image(Core.load("cloneImage", 1)(image.nativeObject));
    @:CvProc function cloneMat(mat:Mat):Mat
        return new Mat(Core.load("cloneMat", 1)(mat.nativeObject));
    @:CvProc function cmp(src1:Arr, src2:Arr, dst:Arr, cmpOp:Int)
        load("cmp", 4)(src1.nativeObject, src2.nativeObject, dst.nativeObject, cmpOp);
    @:CvProc function cmpS(src:Arr, value:Float, dst:Arr, cmpOp:Int)
        load("cmpS", 4)(src.nativeObject, value, dst.nativeObject, cmpOp);
    @:CvProc function convertScale(src:Arr, dst:Arr, scale:Float=1, shift:Float=0)
        load("convertScale", 4)(src.nativeObject, dst.nativeObject, scale, shift);
    @:CvProc function convert(src:Arr, dst:Arr)
        convertScale(src, dst);
    @:CvProc function convertScaleAbs(src:Arr, dst:Arr, scale:Float=1, shift:Float=0)
        load("convertScaleAbs", 4)(src.nativeObject, dst.nativeObject, scale, shift);
    @:CvProc function copy(src:Arr, dst:Arr)
        load("copy", 2)(src.nativeObject, dst.nativeObject);
    @:CvProc function countNonZero(arr:Arr)
        load("countNonZero", 1)(arr.nativeObject);
    @:CvProc function createData(arr:Arr)
        load("createData", 1)(arr.nativeObject);
    @:CvProc function createImage(size:Size, depth:Int, channels:Int):Image
        return new Image(Core.load("createImage", 3)(size.nativeObject, depth, channels));
    @:CvProc function createImageHeader(size:Size, depth:Int, channels:Int):Image
        return new Image(Core.load("createImageHeader", 3)(size.nativeObject, depth, channels));
    @:CvProc function createMat(rows:Int, cols:Int, type:Int):Mat
        return new Mat(Core.load("createMat", 3)(rows, cols, type));
    @:CvProc function createMatHeader(rows:Int, cols:Int, type:Int):Mat
        return new Mat(Core.load("createMatHeader", 3)(rows, cols, type));
    @:CvProc function DCT(src:Arr, dst:Arr, flags:Int)
        load("DCT", 3)(src.nativeObject, dst.nativeObject, flags);
    @:CvProc function DFT(src:Arr, dst:Arr, flags:Int, nonzeroRows:Int=0)
        load("DFT", 4)(src.nativeObject, dst.nativeObject, flags, nonzeroRows);
    @:CvProc function det(mat:Arr):Float
        return load("det", 1)(mat.nativeObject);
    @:CvProc function div(src1:Arr, src2:Arr, dst:Arr, scale:Float=1.0)
        load("div", 4)(src1.nativeObject, src2.nativeObject, dst.nativeObject, scale);
    @:CvProc function dotProduct(src1:Arr, src2:Arr):Float
        return load("dotProduct", 2)(src1.nativeObject, src2.nativeObject);
    @:CvProc function get1D(arr:Arr, idx0:Int):Scalar
        return Scalar.cvt(load("get1D", 2)(arr.nativeObject, idx0));
    @:CvProc function get2D(arr:Arr, idx0:Int, idx1:Int):Scalar
        return Scalar.cvt(load("get2D", 3)(arr.nativeObject, idx0, idx1));
    @:CvProc function get3D(arr:Arr, idx0:Int, idx1:Int, idx2:Int):Scalar
        return Scalar.cvt(load("get3D", 4)(arr.nativeObject, idx0, idx1, idx2));
    @:CvProc function getND(arr:Arr, idx:Array<Int>):Scalar
        return Scalar.cvt(load("getND", 2)(arr.nativeObject, idx));
    @:CvProc function getCols(arr:Arr, submat:Mat, startCol:Int, endCol:Int):Mat
        return Mat.cvt(load("getCols", 4)(arr.nativeObject, NativeBinding.native(submat), startCol, endCol));
    @:CvProc function getCol(arr:Arr, submat:Mat, col:Int):Mat
        return Mat.cvt(getCols(arr, submat, col, col+1));
    @:CvProc function getDiag(arr:Arr, submat:Mat, diag:Int):Mat
        return Mat.cvt(load("getDiag", 3)(arr.nativeObject, NativeBinding.native(submat), diag));
    @:CvProc function getElemType(arr:Arr):Int
        return load("getElemType", 1)(arr.nativeObject);
    @:CvProc function getReal1D(arr:Arr, idx0:Int):Float
        return load("getReal1D", 2)(arr.nativeObject, idx0);
    @:CvProc function getReal2D(arr:Arr, idx0:Int, idx1:Int):Float
        return load("getReal2D", 3)(arr.nativeObject, idx0, idx1);
    @:CvProc function getReal3D(arr:Arr, idx0:Int, idx1:Int, idx2:Int):Float
        return load("getReal3D", 4)(arr.nativeObject, idx0, idx1, idx2);
    @:CvProc function getRealND(arr:Arr, idx:Array<Int>):Float
        return load("getRealND", 2)(arr.nativeObject, idx);
    @:CvProc function getRows(arr:Arr, submat:Mat, startRow:Int, endRow:Int, deltaRow:Int=1):Mat
        return Mat.cvt(load("getRows", 5)(arr.nativeObject, NativeBinding.native(submat), startRow, endRow, deltaRow));
    @:CvProc function getRow(arr:Arr, submat:Mat, col:Int):Mat
        return getRows(arr, submat, col, col+1, 1);
    @:CvProc function point(x:Int=0, y:Int=0):Point
        return new Point(Core.load("Point", 2)(x, y));
    @:CvProc function point2D32f(x:Float=0, y:Float=0):Point2D32f
        return new Point2D32f(Core.load("Point2D32f", 2)(x, y));
    @:CvProc function point2D64f(x:Float=0, y:Float=0):Point2D64f
        return new Point2D64f(Core.load("Point2D64f", 2)(x, y));
    @:CvProc function point3D32f(x:Float=0, y:Float=0, z:Float=0):Point3D32f
        return new Point3D32f(Core.load("Point3D32f", 3)(x, y, z));
    @:CvProc function point3D64f(x:Float=0, y:Float=0, z:Float=0):Point3D64f
        return new Point3D64f(Core.load("Point3D64f", 3)(x, y, z));
    @:CvProc function rect(x:Int=0, y:Int=0, width:Int=0, height:Int=0):Rect
        return new Rect(Core.load("Rect", 4)(x, y, width, height));
    @:CvProc function scalar(v0:Float=0, v1:Float=0, v2:Float=0, v3:Float=0):Scalar
        return new Scalar(Core.load("Scalar", 4)(v0, v1, v2, v3));
    @:CvProc function scaleAll(v0123:Float):Scalar
        return scalar(v0123, v0123, v0123, v0123);
    @:CvProc function size(width:Int=0, height:Int=0):Size
        return new Size(Core.load("Size", 2)(width, height));
    @:CvProc function size2D32f(width:Float=0, height:Float=0):Size2D32f
        return new Size2D32f(Core.load("Size2D32f", 2)(width, height));
    @:CvProc function termCriteria(type:Int, max_iter:Int, epsilon:Float):TermCriteria
        return new TermCriteria(Core.load("TermCriteria", 3)(type, max_iter, epsilon));
    @:CvProc function checkTermCriteria(criteria:TermCriteria, default_eps:Float, default_max_iters:Int):TermCriteria
        return new TermCriteria(Core.load("checkTermCriteria")(criteria.nativeObject, default_eps, default_max_iters));
    @:CvProc function realScalar(v:Float):Scalar
        return scalar(v, 0, 0, 0);
    @:CvProc function getSize(arr:Arr):Size
        return Size.cvt(load("getSize", 1)(arr.nativeObject));
    @:CvProc function getSubRect(arr:Arr, submat:Mat, rect:Rect):Mat
        return Mat.cvt(load("getSubRect", 3)(arr.nativeObject, NativeBinding.native(submat), rect.nativeObject));
    @:CvProc function mGet(mat:Mat, i:Int, j:Int):Float
        return Core.load("mGet", 3)(mat.nativeObject, i, j);
    @:CvProc function mSet(mat:Mat, i:Int, j:Int, value:Float):Float
        return Core.load("mSet", 4)(mat.nativeObject, i, j, value);


    @:CvProc function circle(img:Arr, center:Point, radius:Int, color:RGB, thickness:Int=1, lineType:Int=8, shift:Int=0) {
        var _color:Scalar_ = color;
        Core.load("circle", 7)(img.nativeObject, center.nativeObject, radius, _color.nativeObject, thickness, lineType, shift);
    }
    @:CvProc function line(img:Arr, pt1:Point, pt2:Point, color:RGB, thickness:Int=1, lineType:Int=8, shift:Int=0) {
        var _color:Scalar_ = color;
        Core.load("line", 7)(img.nativeObject, pt1.nativeObject, pt2.nativeObject, _color.nativeObject, thickness, lineType, shift);
    }
    @:CvProc function rectangle(img:Arr, pt1:Point, pt2:Point, color:RGB, thickness:Int=1, lineType:Int=8, shift:Int=0) {
        var _color:Scalar_ = color;
        Core.load("rectangle", 7)(img.nativeObject, pt1.nativeObject, pt2.nativeObject, _color.nativeObject, thickness, lineType, shift);
    }
    @:CvProc function rgb(r:Int=0, g:Int=0, b:Int=0):RGB
        return scalar(b, g, r);
    @:CvProc function createFont(fontFace:Int, hscale:Float=1, vscale:Float=1, shear:Float=0, thickness:Int=1, lineType:Int=8):Font
        return NativeBinding.generic(Core.load("createFont", 6)(fontFace, hscale, vscale, shear, thickness, lineType));
    @:CvProc function putText(img:Arr, text:String, org:Point, font:Font, color:RGB) {
        var _color:Scalar_ = color;
        Core.load("putText", 5)(img.nativeObject, text, org.nativeObject, font.nativeObject, _color.nativeObject);
    }
}
