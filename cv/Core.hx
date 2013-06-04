package cv;

import #if cpp cpp #else neko #end.Lib;
import cv.core.*;
import cv.core.Scalar.RGB;

import cv.Macros;

typedef Arr = NativeBinding; // Image|Mat|Seq?

class Core implements CvProcs {
    @:allow(cv.core)
    static inline function load(n:String, p:Int=0):Dynamic
        return Lib.load("opencv", "hx_cv_core_"+n, p);

    // -------------------------
    // Flags for initialisation of TermCriteria object.
    // -------------------------
    public static inline var TERMCRIT_ITER   = 1;
    public static inline var TERMCRIT_NUMBER = TERMCRIT_ITER;
    public static inline var TERMCRIT_EPS    = 2;

    // -------------------------
    // Type flags for initialisation of Mat object.
    // -------------------------
    static inline function MAKETYPE(depth,cn) return (depth & 511) + ((cn-1) << 3);
    public static inline var _8U = 0;
        public static inline var _8UC1 = MAKETYPE(_8U,1);
        public static inline var _8UC2 = MAKETYPE(_8U,2);
        public static inline var _8UC3 = MAKETYPE(_8U,3);
        public static inline var _8UC4 = MAKETYPE(_8U,4);
    public static inline var _8S = 1;
        public static inline var _8SC1 = MAKETYPE(_8S,1);
        public static inline var _8SC2 = MAKETYPE(_8S,2);
        public static inline var _8SC3 = MAKETYPE(_8S,3);
        public static inline var _8SC4 = MAKETYPE(_8S,4);
    public static inline var _16U = 2;
        public static inline var _16UC1 = MAKETYPE(_16U,1);
        public static inline var _16UC2 = MAKETYPE(_16U,2);
        public static inline var _16UC3 = MAKETYPE(_16U,3);
        public static inline var _16UC4 = MAKETYPE(_16U,4);
    public static inline var _16S = 3;
        public static inline var _16SC1 = MAKETYPE(_16S,1);
        public static inline var _16SC2 = MAKETYPE(_16S,2);
        public static inline var _16SC3 = MAKETYPE(_16S,3);
        public static inline var _16SC4 = MAKETYPE(_16S,4);
    public static inline var _32S = 4;
        public static inline var _32SC1 = MAKETYPE(_32S,1);
        public static inline var _32SC2 = MAKETYPE(_32S,2);
        public static inline var _32SC3 = MAKETYPE(_32S,3);
        public static inline var _32SC4 = MAKETYPE(_32S,4);
    public static inline var _32F = 5;
        public static inline var _32FC1 = MAKETYPE(_32F,1);
        public static inline var _32FC2 = MAKETYPE(_32F,2);
        public static inline var _32FC3 = MAKETYPE(_32F,3);
        public static inline var _32FC4 = MAKETYPE(_32F,4);
    public static inline var _64F = 6;
        public static inline var _64FC1 = MAKETYPE(_64F,1);
        public static inline var _64FC2 = MAKETYPE(_64F,2);
        public static inline var _64FC3 = MAKETYPE(_64F,3);
        public static inline var _64FC4 = MAKETYPE(_64F,4);

    public static inline function _8UC (N:Int) return [_8UC1,  _8UC2,  _8UC3,  _8UC4 ][N-1];
    public static inline function _8SC (N:Int) return [_8SC1,  _8SC2,  _8SC3,  _8SC4 ][N-1];
    public static inline function _16UC(N:Int) return [_16UC1, _16UC2, _16UC3, _16UC4][N-1];
    public static inline function _16SC(N:Int) return [_16SC1, _16SC2, _16SC3, _16SC4][N-1];
    public static inline function _32SC(N:Int) return [_32SC1, _32SC2, _32SC3, _32SC4][N-1];
    public static inline function _32FC(N:Int) return [_32FC1, _32FC2, _32FC3, _32FC4][N-1];
    public static inline function _64FC(N:Int) return [_64FC1, _64FC2, _64FC3, _64FC4][N-1];

    // -------------------------
    // Type flags for initialised of Image object.
    // -------------------------
    public static inline var IPL_DEPTH_1U  = 1;
    public static inline var IPL_DEPTH_8U  = 8;
    public static inline var IPL_DEPTH_16U = 16;
    public static inline var IPL_DEPTH_32F = 32;
    public static inline var IPL_DEPTH_64F = 64;

    inline static var IPL_DEPTH_SIGN = 0x80000000;
    public static inline var IPL_DEPTH_8S  = IPL_DEPTH_SIGN | 8;
    public static inline var IPL_DEPTH_16S = IPL_DEPTH_SIGN | 16;
    public static inline var IPL_DEPTH_32S = IPL_DEPTH_SIGN | 32;

    // -------------------------
    // Operations supported by comparison methods.
    // -------------------------
    public static inline var CMP_EQ = 0;
    public static inline var CMP_GT = 1;
    public static inline var CMP_GE = 2;
    public static inline var CMP_LT = 3;
    public static inline var CMP_LE = 4;
    public static inline var CMP_NE = 5;

    // -------------------------
    // Flags for discrete cosine/fourier transforms.
    // -------------------------
    public static inline var DXT_FORWARD  = 0;
    public static inline var DXT_INVERSE  = 1;
    public static inline var DXT_SCALE    = 2;
    public static inline var DXT_INV_SCALE = (DXT_INVERSE + DXT_SCALE);
    public static inline var DXT_INVERSE_SCALE = DXT_INV_SCALE;
    public static inline var DXT_ROWS     = 4;
    public static inline var DXT_MUL_CONJ = 8;

    public static inline var DCT_INVERSE = DFT_INVERSE;
    public static inline var DCT_ROWS    = DFT_ROWS;

    public static inline var DFT_INVERSE        = 1;
    public static inline var DFT_SCALE          = 2;
    public static inline var DFT_ROWS           = 4;
    public static inline var DFT_COMPLEX_OUTPUT = 16;
    public static inline var DFT_REAL_OUTPUT    = 32;

    // -------------------------
    // Flags for drawing operations.
    // -------------------------
    public static inline var AA     = 16;
    public static inline var FILLED = -1;

    // -------------------------
    // Flags for supported font faces.
    // -------------------------
    public static inline var FONT_HERSHEY_SIMPLEX        = 0;
    public static inline var FONT_HERSHEY_PLAIN          = 1;
    public static inline var FONT_HERSHEY_DUPLEX         = 2;
    public static inline var FONT_HERSHEY_COMPLEX        = 3;
    public static inline var FONT_HERSHEY_TRIPLEX        = 4;
    public static inline var FONT_HERSHEY_COMPLEX_SMALL  = 5;
    public static inline var FONT_HERSHEY_SCRIPT_SIMPLEX = 6;
    public static inline var FONT_HERSHEY_SCRIPT_COMPLEX = 7;
    public static inline var FONT_ITALIC                 = 16;

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
