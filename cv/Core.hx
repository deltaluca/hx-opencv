package cv;

import #if cpp cpp #else neko #end.Lib;
import cv.core.*;
import cv.core.Scalar.RGB;

import cv.Macros;

typedef Arr = NativeBinding; // Image|Mat|Seq?

class Core implements CvConsts implements CvProcs {
    @:allow(cv.core)
    static inline function load(n:String, p:Int=0):Dynamic
        return Lib.load("opencv", "hx_cv_core_"+n, p);

    // -------------------------
    // Flags for initialisation of TermCriteria object.
    // -------------------------
    @:CvConst var CV_TERMCRIT_ITER;
    @:CvConst var CV_TERMCRIT_NUMBER;
    @:CvConst var CV_TERMCRIT_EPS;

    // -------------------------
    // Type flags for initialisation of Mat object.
    // -------------------------
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

    // -------------------------
    // Type flags for initialised of Image object.
    // -------------------------
    @:CvConst var IPL_DEPTH_8U;
    @:CvConst var IPL_DEPTH_8S;
    @:CvConst var IPL_DEPTH_16U;
    @:CvConst var IPL_DEPTH_16S;
    @:CvConst var IPL_DEPTH_32S;
    @:CvConst var IPL_DEPTH_32F;
    @:CvConst var IPL_DEPTH_64F;

    // -------------------------
    // Operations supported by comparison methods.
    // -------------------------
    @:CvConst var CV_CMP_EQ;
    @:CvConst var CV_CMP_GT;
    @:CvConst var CV_CMP_GE;
    @:CvConst var CV_CMP_LT;
    @:CvConst var CV_CMP_LE;
    @:CvConst var CV_CMP_NE;

    // -------------------------
    // Flags for discrete cosine/fourier transforms.
    // -------------------------
    @:CvConst var CV_DXT_FORWARD;
    @:CvConst var CV_DXT_INVERSE;
    @:CvConst var CV_DXT_SCALE;
    @:CvConst var CV_DXT_ROWS;
    @:CvConst var CV_DXT_INVERSE_SCALE;

    // -------------------------
    // Flags for drawing operations.
    // -------------------------
    @:CvConst var CV_AA;
    @:CvConst var CV_FILLED;

    @:CvConst var DCT_INVERSE;
    @:CvConst var DCT_ROWS;

    @:CvConst var DFT_INVERSE;
    @:CvConst var DFT_SCALE;
    @:CvConst var DFT_ROWS;
    @:CvConst var DFT_COMPLEX_OUTPUT;
    @:CvConst var DFT_REAL_OUTPUT;

    // -------------------------
    // Flags for supported font faces.
    // -------------------------
    @:CvConst var CV_FONT_HERSHEY_SIMPLEX;
    @:CvConst var CV_FONT_HERSHEY_PLAIN;
    @:CvConst var CV_FONT_HERSHEY_DUPLEX;
    @:CvConst var CV_FONT_HERSHEY_COMPLEX;
    @:CvConst var CV_FONT_HERSHEY_TRIPLEX;
    @:CvConst var CV_FONT_HERSHEY_COMPLEX_SMALL;
    @:CvConst var CV_FONT_HERSHEY_SCRIPT_SIMPLEX;
    @:CvConst var CV_FONT_HERSHEY_SCRIPT_COMPLEX;
    @:CvConst var CV_FONT_ITALIC;

    // -------------------------
    // Matrix/Image mixed functions.
    // -------------------------
    @:CvProc function absDiff (src1:Arr, src2:Arr,     dst:Arr):Void;
    @:CvProc function absDiffS(src :Arr, value:Scalar, dst:Arr):Void;

    @:CvProc function add        (src1:Arr, src2:Arr,     dst:Arr,  ?mask:Null<Arr>):Void;
    @:CvProc function addS       (src :Arr, value:Scalar, dst:Arr,  ?mask:Null<Arr>):Void;
    @:CvProc function addWeighted(src1:Arr, alpha:Float,  src2:Arr, beta:Float, gamma:Float, dst:Arr):Void;
    @:CvProc function scaleAdd   (src1:Arr, scale:Scalar, src2:Arr, dst:Arr):Void;

    @:CvProc function and (src1:Arr, src2:Arr,     dst:Arr, ?mask:Null<Arr>):Void;
    @:CvProc function andS(src :Arr, value:Scalar, dst:Arr, ?mask:Null<Arr>):Void;

    @:CvProc function avg   (arr:Arr, ?mask:Null<Arr>):Scalar;
    @:CvProc function avgSdv(arr:Arr, mean:Scalar, stdDev:Scalar, ?mask:Null<Arr>):Void;

    @:CvProc function cartToPolar(x:Arr, y:Arr, magnitude:Null<Arr>, angle:Null<Arr>, angleInDegrees:Bool=false):Void;

    @:CvProc function cmp (src1:Arr, src2:Arr,    dst:Arr, cmpOp:Int):Void;
    @:CvProc function cmpS(src :Arr, value:Float, dst:Arr, cmpOp:Int):Void;

    @:CvProc function convert        (src:Arr, dst:Arr):Void convertScale(src, dst);
    @:CvProc function convertScale   (src:Arr, dst:Arr, scale:Float=1, shift:Float=0):Void;
    @:CvProc function convertScaleAbs(src:Arr, dst:Arr, scale:Float=1, shift:Float=0):Void;

    @:CvProc function copy(src:Arr, dst:Arr, ?mask:Null<Arr>):Void;

    @:CvProc function countNonZero(arr:Arr):Int;

    @:CvProc function DCT(src:Arr, dst:Arr, flags:Int):Void;
    @:CvProc function DFT(src:Arr, dst:Arr, flags:Int, nonzeroRows:Int=0):Void;

    @:CvProc function det(mat:Arr):Float;

    @:CvProc function mul(src1:Arr, src2:Arr, dst:Arr, scale:Float=1):Void;
    @:CvProc function div(src1:Arr, src2:Arr, dst:Arr, scale:Float=1):Void;

    @:CvProc function dotProduct(src1:Arr, src2:Arr):Float;

    @:CvProc function get1D(arr:Arr, idx0:Int):Scalar;
    @:CvProc function get2D(arr:Arr, idx0:Int, idx1:Int):Scalar;
    @:CvProc function get3D(arr:Arr, idx0:Int, idx1:Int, idx2:Int):Scalar;
    @:CvProc function getND(arr:Arr, idx:Array<Int>):Scalar;

    @:CvProc function getCols   (arr:Arr, submat:Mat, startCol:Int, endCol:Int):Mat;
    @:CvProc function getRows   (arr:Arr, submat:Mat, startRow:Int, endRow:Int, deltaRow:Int=1):Mat;
    @:CvProc function getDiag   (arr:Arr, submat:Mat, diag:Int ):Mat;
    @:CvProc function getSubRect(arr:Arr, submat:Mat, rect:Rect):Mat;

    @:CvProc function getElemType(arr:Arr):Int;
    @:CvProc function getSize    (arr:Arr):Size;

    @:CvProc function getReal1D(arr:Arr, idx0:Int):Float;
    @:CvProc function getReal2D(arr:Arr, idx0:Int, idx1:Int):Float;
    @:CvProc function getReal3D(arr:Arr, idx0:Int, idx1:Int, idx2:Int):Float;
    @:CvProc function getRealND(arr:Arr, idx:Array<Int>):Float;

    @:CvProc function magnitude(x:Arr, y:Arr, mag:Arr):Void;
    @:CvProc function merge(mv:Array<Arr>, dst:Arr):Void {
        load("merge", 2)(NativeBinding.mapNative(mv), dst.nativeObject);
    }

    @:CvProc function set(arr:Arr, value:Scalar, ?mask:Null<Arr>):Void;

    @:CvProc function split(src:Arr, mv:Array<Arr>):Void {
        load("split", 2)(src.nativeObject, NativeBinding.mapNative(mv));
    }
    @:CvProc function phase(x:Arr, y:Arr, angle:Arr, angleInDegrees:Bool=false):Void;
    @:CvProc function polarToCart(angle:Arr, phase:Arr, x:Arr, y:Arr, angleInDegrees:Bool=false):Void;

    // -------------------------
    // Image specific functions.
    // -------------------------
    @:CvProc function cloneImage(image:Image):Image;

    // -------------------------
    // Matrix specific functions.
    // -------------------------
    @:CvProc function mGet(mat:Mat, i:Int, j:Int):Float;
    @:CvProc function mSet(mat:Mat, i:Int, j:Int, value:Float):Float;

    @:CvProc function cloneMat(mat:Mat):Mat;

    // -------------------------
    // TermCriteria specific functions.
    // -------------------------
    @:CvProc function checkTermCriteria(criteria:TermCriteria, defEps:Float, defMaxIter:Int):TermCriteria;

    // -------------------------
    // Simple type constructors
    // Change from C side, names here aren't capitalised.
    // -------------------------
    @:CvProc(Point)        function point       (x:Int  =0, y:Int  =0):Point;
    @:CvProc(Point2D32f)   function point2D32f  (x:Float=0, y:Float=0):Point2D32f;
    @:CvProc(Point2D64f)   function point2D64f  (x:Float=0, y:Float=0):Point2D64f;
    @:CvProc(Point3D32f)   function point3D32f  (x:Float=0, y:Float=0, z:Float=0):Point3D32f;
    @:CvProc(Point3D64f)   function point3D64f  (x:Float=0, y:Float=0, z:Float=0):Point3D64f;
    @:CvProc(Rect)         function rect        (x:Int  =0, y:Int  =0, w:Int  =0, h:Int  =0):Rect;
    @:CvProc(Scalar)       function scalar      (x:Float=0, y:Float=0, z:Float=0, w:Float=0):Scalar;
    @:CvProc(Size)         function size        (w:Int  =0, h:Int  =0):Size;
    @:CvProc(Size2D32f)    function size2D32f   (w:Float=0, h:Float=0):Size2D32f;
    @:CvProc(TermCriteria) function termCriteria(type:Int,  maxIter:Int, eps:Float):TermCriteria;

    // -------------------------
    // Complex type constructors
    // Change from C-API, no release methods exist (GC'ed)
    //                  , createFont instead of initFont (haxe semantics)
    // -------------------------
    @:CvProc function createImage(size:Size,    depth:Int,       channels:Int):Image;
    @:CvProc function createMat  (rows:Int,     cols :Int,       type    :Int):Mat;
    @:CvProc function createFont (fontFace:Int, hscale:Float=1,  vscale:Float=1, shear:Float=0, thickness:Int=1, lineType:Int=8):Font;


    @:CvProc function createImageHeader(size:Size, depth:Int, channels:Int):Image;
    @:CvProc function createMatHeader  (rows:Int,  cols :Int, type    :Int):Mat;
    @:CvProc function createData       (arr:Arr):Void;

    // --------------------------
    // Derived type constructors.
    // --------------------------
    // Scalar
    @:CvProc function scalarAll (v:Float):Scalar return scalar(v, v, v, v);
    @:CvProc function realScalar(v:Float):Scalar return scalar(v, 0, 0, 0);

    // RGB (Scalar)
    @:CvProc function gray(v:Float=0)                      :RGB return scalar(v, v, v);
    @:CvProc function rgb (r:Float=0, g:Float=0, b:Float=0):RGB return scalar(b, g, r);

    // --------------------------
    // Drawing uilities
    // --------------------------
    @:CvProc function circle   (img:Arr, center:Point, radius:Int, color:RGB, thickness:Int=1, lineType:Int=8, shift:Int=0):Void;
    @:CvProc function line     (img:Arr, pt1:Point,    pt2:Point,  color:RGB, thickness:Int=1, lineType:Int=8, shift:Int=0):Void;
    @:CvProc function rectangle(img:Arr, pt1:Point,    pt2:Point,  color:RGB, thickness:Int=1, lineType:Int=8, shift:Int=0):Void;
    @:CvProc function putText  (img:Arr, text:String,  org:Point,  font:Font, color:RGB):Void;

    // --------------------------
    // General derived methods.
    // --------------------------
    @:CvProc function getCol(arr:Arr, submat:Mat, col:Int):Mat return getCols(arr, submat, col, col+1);
    @:CvProc function getRow(arr:Arr, submat:Mat, col:Int):Mat return getRows(arr, submat, col, col+1, 1);

}
