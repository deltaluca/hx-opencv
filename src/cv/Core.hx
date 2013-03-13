package cv;

import #if cpp cpp #else neko #end.Lib;
import cv.core.*;
import cv.core.Scalar.Scalar_;
import cv.core.Scalar.RGB;

typedef Arr = NativeBinding; // Image|Mat|Seq?

typedef Font = NativeBinding;

class Core {
    @:allow(cv.core)
    static inline function load(n:String, p:Int=0):Dynamic {
        return Lib.load("opencv", "hx_cv_core_"+n, p);
    }

    public static var CV_TERMCRIT_ITER  (get,never):Int; static inline function get_CV_TERMCRIT_ITER  () { return load("CV_TERMCRIT_ITER",   0)(); }
    public static var CV_TERMCRIT_NUMBER(get,never):Int; static inline function get_CV_TERMCRIT_NUMBER() { return load("CV_TERMCRIT_NUMBER", 0)(); }
    public static var CV_TERMCRIT_EPS   (get,never):Int; static inline function get_CV_TERMCRIT_EPS   () { return load("CV_TERMCRIT_EPS",    0)(); }

    public static var CV_8U   (get,never):Int; static inline function get_CV_8U   () { return load("CV_8U",    0)(); }
    public static var CV_8S   (get,never):Int; static inline function get_CV_8S   () { return load("CV_8S",    0)(); }
    public static var CV_16U  (get,never):Int; static inline function get_CV_16U  () { return load("CV_16U",   0)(); }
    public static var CV_16S  (get,never):Int; static inline function get_CV_16S  () { return load("CV_16S",   0)(); }
    public static var CV_32F  (get,never):Int; static inline function get_CV_32F  () { return load("CV_32F",   0)(); }
    public static var CV_64F  (get,never):Int; static inline function get_CV_64F  () { return load("CV_64F",   0)(); }
    public static var CV_8UC1 (get,never):Int; static inline function get_CV_8UC1 () { return load("CV_8UC1",  0)(); }
    public static var CV_8UC2 (get,never):Int; static inline function get_CV_8UC2 () { return load("CV_8UC2",  0)(); }
    public static var CV_8UC3 (get,never):Int; static inline function get_CV_8UC3 () { return load("CV_8UC3",  0)(); }
    public static var CV_8UC4 (get,never):Int; static inline function get_CV_8UC4 () { return load("CV_8UC4",  0)(); }
    public static var CV_8SC1 (get,never):Int; static inline function get_CV_8SC1 () { return load("CV_8SC1",  0)(); }
    public static var CV_8SC2 (get,never):Int; static inline function get_CV_8SC2 () { return load("CV_8SC2",  0)(); }
    public static var CV_8SC3 (get,never):Int; static inline function get_CV_8SC3 () { return load("CV_8SC3",  0)(); }
    public static var CV_8SC4 (get,never):Int; static inline function get_CV_8SC4 () { return load("CV_8SC4",  0)(); }
    public static var CV_16UC1(get,never):Int; static inline function get_CV_16UC1() { return load("CV_16UC1", 0)(); }
    public static var CV_16UC2(get,never):Int; static inline function get_CV_16UC2() { return load("CV_16UC2", 0)(); }
    public static var CV_16UC3(get,never):Int; static inline function get_CV_16UC3() { return load("CV_16UC3", 0)(); }
    public static var CV_16UC4(get,never):Int; static inline function get_CV_16UC4() { return load("CV_16UC4", 0)(); }
    public static var CV_16SC1(get,never):Int; static inline function get_CV_16SC1() { return load("CV_16SC1", 0)(); }
    public static var CV_16SC2(get,never):Int; static inline function get_CV_16SC2() { return load("CV_16SC2", 0)(); }
    public static var CV_16SC3(get,never):Int; static inline function get_CV_16SC3() { return load("CV_16SC3", 0)(); }
    public static var CV_16SC4(get,never):Int; static inline function get_CV_16SC4() { return load("CV_16SC4", 0)(); }
    public static var CV_32SC1(get,never):Int; static inline function get_CV_32SC1() { return load("CV_32SC1", 0)(); }
    public static var CV_32SC2(get,never):Int; static inline function get_CV_32SC2() { return load("CV_32SC2", 0)(); }
    public static var CV_32SC3(get,never):Int; static inline function get_CV_32SC3() { return load("CV_32SC3", 0)(); }
    public static var CV_32SC4(get,never):Int; static inline function get_CV_32SC4() { return load("CV_32SC4", 0)(); }
    public static var CV_32FC1(get,never):Int; static inline function get_CV_32FC1() { return load("CV_32FC1", 0)(); }
    public static var CV_32FC2(get,never):Int; static inline function get_CV_32FC2() { return load("CV_32FC2", 0)(); }
    public static var CV_32FC3(get,never):Int; static inline function get_CV_32FC3() { return load("CV_32FC3", 0)(); }
    public static var CV_32FC4(get,never):Int; static inline function get_CV_32FC4() { return load("CV_32FC4", 0)(); }
    public static var CV_64FC1(get,never):Int; static inline function get_CV_64FC1() { return load("CV_64FC1", 0)(); }
    public static var CV_64FC2(get,never):Int; static inline function get_CV_64FC2() { return load("CV_64FC2", 0)(); }
    public static var CV_64FC3(get,never):Int; static inline function get_CV_64FC3() { return load("CV_64FC3", 0)(); }
    public static var CV_64FC4(get,never):Int; static inline function get_CV_64FC4() { return load("CV_64FC4", 0)(); }

    public static inline function CV_8UC (N:Int):Int { return [CV_8UC1,  CV_8UC2,  CV_8UC3,  CV_8UC4 ][N-1]; }
    public static inline function CV_8SC (N:Int):Int { return [CV_8SC1,  CV_8SC2,  CV_8SC3,  CV_8SC4 ][N-1]; }
    public static inline function CV_16UC(N:Int):Int { return [CV_16UC1, CV_16UC2, CV_16UC3, CV_16UC4][N-1]; }
    public static inline function CV_16SC(N:Int):Int { return [CV_16SC1, CV_16SC2, CV_16SC3, CV_16SC4][N-1]; }
    public static inline function CV_32SC(N:Int):Int { return [CV_32SC1, CV_32SC2, CV_32SC3, CV_32SC4][N-1]; }
    public static inline function CV_32FC(N:Int):Int { return [CV_32FC1, CV_32FC2, CV_32FC3, CV_32FC4][N-1]; }
    public static inline function CV_64FC(N:Int):Int { return [CV_64FC1, CV_64FC2, CV_64FC3, CV_64FC4][N-1]; }



    public static var IPL_DEPTH_8U(get,never):Int; static inline function get_IPL_DEPTH_8U() { return load("IPL_DEPTH_8U", 0)(); }
    public static var IPL_DEPTH_8S(get,never):Int; static inline function get_IPL_DEPTH_8S() { return load("IPL_DEPTH_8S", 0)(); }
    public static var IPL_DEPTH_16U(get,never):Int; static inline function get_IPL_DEPTH_16U() { return load("IPL_DEPTH_16U", 0)(); }
    public static var IPL_DEPTH_16S(get,never):Int; static inline function get_IPL_DEPTH_16S() { return load("IPL_DEPTH_16S", 0)(); }
    public static var IPL_DEPTH_32S(get,never):Int; static inline function get_IPL_DEPTH_32S() { return load("IPL_DEPTH_32S", 0)(); }
    public static var IPL_DEPTH_32F(get,never):Int; static inline function get_IPL_DEPTH_32F() { return load("IPL_DEPTH_32F", 0)(); }
    public static var IPL_DEPTH_64F(get,never):Int; static inline function get_IPL_DEPTH_64F() { return load("IPL_DEPTH_64F", 0)(); }



    public static var CV_CMP_EQ(get,never):Int; static inline function get_CV_CMP_EQ() { return load("CV_CMP_EQ", 0)(); }
    public static var CV_CMP_GT(get,never):Int; static inline function get_CV_CMP_GT() { return load("CV_CMP_GT", 0)(); }
    public static var CV_CMP_GE(get,never):Int; static inline function get_CV_CMP_GE() { return load("CV_CMP_GE", 0)(); }
    public static var CV_CMP_LT(get,never):Int; static inline function get_CV_CMP_LT() { return load("CV_CMP_LT", 0)(); }
    public static var CV_CMP_LE(get,never):Int; static inline function get_CV_CMP_LE() { return load("CV_CMP_LE", 0)(); }
    public static var CV_CMP_NE(get,never):Int; static inline function get_CV_CMP_NE() { return load("CV_CMP_NE", 0)(); }



    public static var CV_DXT_FORWARD(get,never):Int; static inline function get_CV_DXT_FORWARD() { return load("CV_DXT_FORWARD", 0)(); }
    public static var CV_DXT_INVERSE(get,never):Int; static inline function get_CV_DXT_INVERSE() { return load("CV_DXT_INVERSE", 0)(); }
    public static var CV_DXT_SCALE(get,never):Int; static inline function get_CV_DXT_SCALE() { return load("CV_DXT_SCALE", 0)(); }
    public static var CV_DXT_ROWS(get,never):Int; static inline function get_CV_DXT_ROWS() { return load("CV_DXT_ROWS", 0)(); }
    public static var CV_DXT_INVERSE_SCALE(get,never):Int; static inline function get_CV_DXT_INVERSE_SCALE() { return load("CV_DXT_INVERSE_SCALE", 0)(); }



    public static var CV_AA    (get,never):Int; static inline function get_CV_AA    () { return load("CV_AA",     0)(); }
    public static var CV_FILLED(get,never):Int; static inline function get_CV_FILLED() { return load("CV_FILLED", 0)(); }



    public static var CV_FONT_HERSHEY_SIMPLEX       (get,never):Int; static inline function get_CV_FONT_HERSHEY_SIMPLEX       () { return load("CV_FONT_HERSHEY_SIMPLEX",        0)(); }
    public static var CV_FONT_HERSHEY_PLAIN         (get,never):Int; static inline function get_CV_FONT_HERSHEY_PLAIN         () { return load("CV_FONT_HERSHEY_PLAIN",          0)(); }
    public static var CV_FONT_HERSHEY_DUPLEX        (get,never):Int; static inline function get_CV_FONT_HERSHEY_DUPLEX        () { return load("CV_FONT_HERSHEY_DUPLEX" ,        0)(); }
    public static var CV_FONT_HERSHEY_COMPLEX       (get,never):Int; static inline function get_CV_FONT_HERSHEY_COMPLEX       () { return load("CV_FONT_HERSHEY_COMPLEX",        0)(); }
    public static var CV_FONT_HERSHEY_TRIPLEX       (get,never):Int; static inline function get_CV_FONT_HERSHEY_TRIPLEX       () { return load("CV_FONT_HERSHEY_TRIPLEX",        0)(); }
    public static var CV_FONT_HERSHEY_COMPLEX_SMALL (get,never):Int; static inline function get_CV_FONT_HERSHEY_COMPLEX_SMALL () { return load("CV_FONT_HERSHEY_COMPLEX_SMALL",  0)(); }
    public static var CV_FONT_HERSHEY_SCRIPT_SIMPLEX(get,never):Int; static inline function get_CV_FONT_HERSHEY_SCRIPT_SIMPLEX() { return load("CV_FONT_HERSHEY_SCRIPT_SIMPLEX", 0)(); }
    public static var CV_FONT_HERSHEY_SCRIPT_COMPLEX(get,never):Int; static inline function get_CV_FONT_HERSHEY_SCRIPT_COMPLEX() { return load("CV_FONT_HERSHEY_SCRIPT_COMPLEX", 0)(); }
    public static var CV_FONT_ITALIC                (get,never):Int; static inline function get_CV_FONT_ITALIC                () { return load("CV_FONT_ITALIC",                 0)(); }



    public static inline function absDiff(src1:Arr, src2:Arr, dst:Arr) {
        #if debug
            if (src1 == null) throw "absDiff :: src1 cannot be null";
            if (src2 == null) throw "absDiff :: src2 cannot be null";
            if (dst  == null) throw "absDiff :: dst cannot be null";
        #end
        load("absDiff", 3)(src1.nativeObject, src2.nativeObject, dst.nativeObject);
    }
    public static inline function absDiffS(src:Arr, value:Scalar, dst:Arr) {
        #if debug
            if (src   == null) throw "absDiffS :: src cannot be null";
            if (value == null) throw "absDiffS :: value cannot be null";
            if (dst   == null) throw "absDiffS :: dst cannot be null";
        #end
        var _value:Scalar_ = value;
        load("absDiffS", 3)(src.nativeObject, _value.nativeObject, dst.nativeObject);
    }
    public static inline function add(src1:Arr, src2:Arr, dst:Arr, ?mask:Null<Arr>) {
        #if debug
            if (src1 == null) throw "add :: src1 cannot be null";
            if (src2 == null) throw "add :: src2 cannot be null";
            if (dst  == null) throw "add :: dst cannot be null";
        #end
        load("add", 4)(src1.nativeObject, src2.nativeObject, dst.nativeObject, NativeBinding.native(mask));
    }
    public static inline function addS(src:Arr, value:Scalar, dst:Arr, ?mask:Null<Arr>) {
        #if debug
            if (src   == null) throw "addS :: src cannot be null";
            if (value == null) throw "addS :: value cannot be null";
            if (dst   == null) throw "addS :: dst cannot be null";
        #end
        var _value:Scalar_ = value;
        load("addS", 4)(src.nativeObject, _value.nativeObject, dst.nativeObject, NativeBinding.native(mask));
    }
    public static inline function addWeighted(src1:Arr, alpha:Float, src2:Arr, beta:Float, gamma:Float, dst:Arr) {
        #if debug
            if (src1 == null) throw "addWeighted :: src1 cannot be null";
            if (src2 == null) throw "addWeighted :: src2 cannot be null";
            if (dst  == null) throw "addWeighted :: dst cannot be null";
        #end
        load("addWeighted", 6)(src1.nativeObject, alpha, src2.nativeObject, beta, gamma, dst.nativeObject);
    }
    public static inline function and(src1:Arr, src2:Arr, dst:Arr, ?mask:Null<Arr>) {
        #if debug
            if (src1 == null) throw "and :: src1 cannot be null";
            if (src2 == null) throw "and :: src2 cannot be null";
            if (dst  == null) throw "and :: dst cannot be null";
        #end
        load("and", 4)(src1.nativeObject, src2.nativeObject, dst.nativeObject, NativeBinding.native(mask));
    }
    public static inline function andS(src:Arr, value:Scalar, dst:Arr, ?mask:Null<Arr>) {
        #if debug
            if (src   == null) throw "andS :: src cannot be null";
            if (value == null) throw "andS :: value cannot be null";
            if (dst   == null) throw "andS :: dst cannot be null";
        #end
        var _value:Scalar_ = value;
        load("andS", 4)(src.nativeObject, _value.nativeObject, dst.nativeObject, NativeBinding.native(mask));
    }
    public static inline function avg(arr:Arr, ?mask:Null<Arr>):Scalar {
        #if debug
            if (arr == null) throw "avg :: arr cannot be null";
        #end
        return Scalar.cvt(load("avg", 2)(arr.nativeObject, NativeBinding.native(mask)));
    }
    public static inline function avgSdv(arr:Arr, mean:Scalar, stdDev:Scalar, ?mask:Null<Arr>) {
        #if debug
            if (arr    == null) throw "avgSdv :: arr cannot be null";
            if (mean   == null) throw "avgSdv :: mean cannot be null";
            if (stdDev == null) throw "avgSdv :: stdDev cannot be null";
        #end
        var _mean  :Scalar_ = mean;
        var _stdDev:Scalar_ = stdDev;
        load("avgSdv", 4)(arr.nativeObject, _mean.nativeObject, _stdDev.nativeObject, NativeBinding.native(mask));
    }
    public inline function cloneImage(image:Image):Image {
        #if debug
            if (image == null) throw "cloneImage :: image cannot be null";
        #end
        return new Image(Core.load("cloneImage", 1)(image.nativeObject));
    }
    public inline function cloneMat(mat:Mat):Mat {
        #if debug
            if (mat == null) throw "cloneMat :: mat cannot be null";
        #end
        return new Mat(Core.load("cloneMat", 1)(mat.nativeObject));
    }
    public static inline function cmp(src1:Arr, src2:Arr, dst:Arr, cmpOp:Int) {
        #if debug
            if (src1 == null) throw "cmp :: src1 cannot be null";
            if (src2 == null) throw "cmp :: src2 cannot be null";
            if (dst  == null) throw "cmp :: dst cannot be null";
        #end
        load("cmp", 4)(src1.nativeObject, src2.nativeObject, dst.nativeObject, cmpOp);
    }
    public static inline function cmpS(src:Arr, value:Float, dst:Arr, cmpOp:Int) {
        #if debug
            if (src == null) throw "cmpS :: src cannot be null";
            if (dst == null) throw "cmpS :: dst cannot be null";
        #end
        load("cmpS", 4)(src.nativeObject, value, dst.nativeObject, cmpOp);
    }
    public static inline function convertScale(src:Arr, dst:Arr, scale:Float=1, shift:Float=0) {
        #if debug
            if (src == null) throw "convertScale :: src cannot be null";
            if (dst == null) throw "convertScale :: dst cannot be null";
        #end
        load("convertScale", 4)(src.nativeObject, dst.nativeObject, scale, shift);
    }
    public static inline function convert(src:Arr, dst:Arr) {
        convertScale(src, dst);
    }
    public static inline function convertScaleAbs(src:Arr, dst:Arr, scale:Float=1, shift:Float=0) {
        #if debug
            if (src == null) throw "convertScaleAbs :: src cannot be null";
            if (dst == null) throw "convertScaleAbs :: dst cannot be null";
        #end
        load("convertScaleAbs", 4)(src.nativeObject, dst.nativeObject, scale, shift);
    }
    public static inline function copy(src:Arr, dst:Arr) {
        #if debug
            if (src == null) throw "copy :: src cannot be null";
            if (dst == null) throw "copy :: dst cannot be null";
        #end
        load("copy", 2)(src.nativeObject, dst.nativeObject);
    }
    public static inline function countNonZero(arr:Arr) {
        #if debug
            if (arr == null) throw "countNonZero :: arr cannot be null";
        #end
        load("countNonZero", 1)(arr.nativeObject);
    }
    public static inline function createData(arr:Arr) {
        #if debug
            if (arr == null) throw "createData :: arr cannot be null";
        #end
        load("createData", 1)(arr.nativeObject);
    }
    public static inline function createImage(size:Size, depth:Int, channels:Int):Image {
        #if debug
            if (size == null) throw "Image.create :: size cannot be null";
        #end
        return new Image(Core.load("createImage", 3)(size.nativeObject, depth, channels));
    }
    public static inline function createImageHeader(size:Size, depth:Int, channels:Int):Image {
        #if debug
            if (size == null) throw "Image.createHeader :: size cannot be null";
        #end
        return new Image(Core.load("createImageHeader", 3)(size.nativeObject, depth, channels));
    }
    public static inline function createMat(rows:Int, cols:Int, type:Int):Mat {
        return new Mat(Core.load("createMat", 3)(rows, cols, type));
    }
    public static inline function createMatHeader(rows:Int, cols:Int, type:Int):Mat {
        return new Mat(Core.load("createMatHeader", 3)(rows, cols, type));
    }
    public static inline function DCT(src:Arr, dst:Arr, flags:Int) {
        #if debug
            if (src == null) throw "DCT :: src cannot be null";
            if (dst == null) throw "DCT :: dst cannot be null";
        #end
        load("DCT", 3)(src.nativeObject, dst.nativeObject, flags);
    }
    public static inline function DFT(src:Arr, dst:Arr, flags:Int, nonzeroRows:Int=0) {
        #if debug
            if (src == null) throw "DFT :: src cannot be null";
            if (dst == null) throw "DFT :: dst cannot be null";
        #end
        load("DFT", 4)(src.nativeObject, dst.nativeObject, flags, nonzeroRows);
    }
    public static inline function det(mat:Arr):Float {
        #if debug
            if (mat == null) throw "det :: mat cannot be null";
        #end
        return load("det", 1)(mat.nativeObject);
    }
    public static inline function div(src1:Arr, src2:Arr, dst:Arr, scale:Float=1.0) {
        #if debug
            if (src1 == null) throw "div :: src1 cannot be null";
            if (src2 == null) throw "div :: src2 cannot be null";
            if (dst  == null) throw "div :: dst cannot be null";
        #end
        load("div", 4)(src1.nativeObject, src2.nativeObject, dst.nativeObject, scale);
    }
    public static inline function dotProduct(src1:Arr, src2:Arr):Float {
        #if debug
            if (src1 == null) throw "dotProduct :: src1 cannot be null";
            if (src2 == null) throw "dotProduct :: src2 cannot be null";
        #end
        return load("dotProduct", 2)(src1.nativeObject, src2.nativeObject);
    }
    public static inline function get1D(arr:Arr, idx0:Int):Scalar {
        #if debug
            if (arr == null) throw "get1D :: arr cannot be null";
        #end
        return Scalar.cvt(load("get1D", 2)(arr.nativeObject, idx0));
    }
    public static inline function get2D(arr:Arr, idx0:Int, idx1:Int):Scalar {
        #if debug
            if (arr == null) throw "get2D :: arr cannot be null";
        #end
        return Scalar.cvt(load("get2D", 3)(arr.nativeObject, idx0, idx1));
    }
    public static inline function get3D(arr:Arr, idx0:Int, idx1:Int, idx2:Int):Scalar {
        #if debug
            if (arr == null) throw "get3D :: arr cannot be null";
        #end
        return Scalar.cvt(load("get3D", 4)(arr.nativeObject, idx0, idx1, idx2));
    }
    public static inline function getND(arr:Arr, idx:Array<Int>):Scalar {
        #if debug
            if (arr == null) throw "getND :: arr cannot be null";
        #end
        return Scalar.cvt(load("getND", 2)(arr.nativeObject, idx));
    }
    public static inline function getCols(arr:Arr, submat:Mat, startCol:Int, endCol:Int):Mat {
        #if debug
            if (arr == null) throw "getCols :: arr cannot be null";
            // submat (TODO??)
        #end
        return Mat.cvt(load("getCols", 4)(arr.nativeObject, NativeBinding.native(submat), startCol, endCol));
    }
    public static inline function getCol(arr:Arr, submat:Mat, col:Int):Mat {
        return Mat.cvt(getCols(arr, submat, col, col+1));
    }
    public static inline function getDiag(arr:Arr, submat:Mat, diag:Int):Mat {
        #if debug
            if (arr == null) throw "getDiag :: arr cannot be null";
            // submat (TODO??)
        #end
        return Mat.cvt(load("getDiag", 3)(arr.nativeObject, NativeBinding.native(submat), diag));
    }
    public static inline function getElemType(arr:Arr):Int {
        #if debug
            if (arr == null) throw "getElemType :: arr cannot be null";
        #end
        return load("getElemType", 1)(arr.nativeObject);
    }
    public static inline function getReal1D(arr:Arr, idx0:Int):Float {
        #if debug
            if (arr == null) throw "getReal1D :: arr cannot be null";
        #end
        return load("getReal1D", 2)(arr.nativeObject, idx0);
    }
    public static inline function getReal2D(arr:Arr, idx0:Int, idx1:Int):Float {
        #if debug
            if (arr == null) throw "getReal2D :: arr cannot be null";
        #end
        return load("getReal2D", 3)(arr.nativeObject, idx0, idx1);
    }
    public static inline function getReal3D(arr:Arr, idx0:Int, idx1:Int, idx2:Int):Float {
        #if debug
            if (arr == null) throw "getReal3D :: arr cannot be null";
        #end
        return load("getReal3D", 4)(arr.nativeObject, idx0, idx1, idx2);
    }
    public static inline function getRealND(arr:Arr, idx:Array<Int>):Float {
        #if debug
            if (arr == null) throw "getRealND :: arr cannot be null";
        #end
        return load("getRealND", 2)(arr.nativeObject, idx);
    }
    public static inline function getRows(arr:Arr, submat:Mat, startRow:Int, endRow:Int, deltaRow:Int=1):Mat {
        #if debug
            if (arr == null) throw "getRows :: arr cannot be null";
            // submat (TODO??)
        #end
        return Mat.cvt(load("getRows", 5)(arr.nativeObject, NativeBinding.native(submat), startRow, endRow, deltaRow));
    }
    public static inline function getRow(arr:Arr, submat:Mat, col:Int):Mat {
        return getRows(arr, submat, col, col+1, 1);
    }
    public static inline function point(x:Int=0, y:Int=0):Point {
        return new Point(Core.load("Point", 2)(x, y));
    }
    public static inline function point2D32f(x:Float=0, y:Float=0):Point2D32f {
        return new Point2D32f(Core.load("Point2D32f", 2)(x, y));
    }
    public static inline function point2D64f(x:Float=0, y:Float=0):Point2D64f {
        return new Point2D64f(Core.load("Point2D64f", 2)(x, y));
    }
    public static inline function point3D32f(x:Float=0, y:Float=0, z:Float=0):Point3D32f {
        return new Point3D32f(Core.load("Point3D32f", 3)(x, y, z));
    }
    public static inline function point3D64f(x:Float=0, y:Float=0, z:Float=0):Point3D64f {
        return new Point3D64f(Core.load("Point3D64f", 3)(x, y, z));
    }
    public static inline function rect(x:Int=0, y:Int=0, width:Int=0, height:Int=0):Rect {
        return new Rect(Core.load("Rect", 4)(x, y, width, height));
    }
    public static inline function scalar(v0:Float=0, v1:Float=0, v2:Float=0, v3:Float=0):Scalar {
        return new Scalar(Core.load("Scalar", 4)(v0, v1, v2, v3));
    }
    public static inline function scaleAll(v0123:Float):Scalar {
        return scalar(v0123, v0123, v0123, v0123);
    }
    public static inline function size(width:Int=0, height:Int=0):Size {
        return new Size(Core.load("Size", 2)(width, height));
    }
    public static inline function size2D32f(width:Float=0, height:Float=0):Size2D32f {
        return new Size2D32f(Core.load("Size2D32f", 2)(width, height));
    }
    public static inline function termCriteria(type:Int, max_iter:Int, epsilon:Float):TermCriteria {
        return new TermCriteria(Core.load("TermCriteria", 3)(type, max_iter, epsilon));
    }
    public static inline function checkTermCriteria(criteria:TermCriteria, default_eps:Float, default_max_iters:Int):TermCriteria {
        #if debug
            if (criteria == null) throw "checkTermCriteria : criteria cannot be null";
        #end
        return new TermCriteria(Core.load("checkTermCriteria")(criteria.nativeObject, default_eps, default_max_iters));
    }
    public static inline function realScalar(v:Float):Scalar {
        return scalar(v, 0, 0, 0);
    }
    public static inline function getSize(arr:Arr):Size {
        #if debug
            if (arr == null) throw "getSize :: arr cannot be null";
        #end
        return Size.cvt(load("getSize", 1)(arr.nativeObject));
    }
    public static inline function getSubRect(arr:Arr, submat:Mat, rect:Rect):Mat {
        #if debug
            if (arr  == null) throw "getSubRect :: arr cannot be null";
            // submat (TODO??)
            if (rect == null) throw "getSubRect :: rect cannot be null";
        #end
        return Mat.cvt(load("getSubRect", 3)(arr.nativeObject, NativeBinding.native(submat), rect.nativeObject));
    }
    public static inline function mGet(mat:Mat, i:Int, j:Int):Float {
        #if debug
            if (mat == null) throw "mGet :: mat cannot be null";
        #end
        return Core.load("mGet", 3)(mat.nativeObject, i, j);
    }
    public static inline function mSet(mat:Mat, i:Int, j:Int, value:Float):Float {
        #if debug
            if (mat == null) throw "mGet :: mat cannot be null";
        #end
        return Core.load("mSet", 4)(mat.nativeObject, i, j, value);
    }



    public static inline function circle(img:Arr, center:Point, radius:Int, color:RGB, thickness:Int=1, lineType:Int=8, shift:Int=0) {
        #if debug
            if (img    == null) throw "circle :: img cannot be null";
            if (center == null) throw "circle :: center cannot be null";
            if (color  == null) throw "circle :: color cannot be null";
        #end
        var _color:Scalar_ = color;
        Core.load("circle", 7)(img.nativeObject, center.nativeObject, radius, _color.nativeObject, thickness, lineType, shift);
    }
    public static inline function line(img:Arr, pt1:Point, pt2:Point, color:RGB, thickness:Int=1, lineType:Int=8, shift:Int=0) {
        #if debug
            if (img   == null) throw "line :: img cannot be null";
            if (pt1   == null) throw "line :: pt1 cannot be null";
            if (pt2   == null) throw "line :: pt1 cannot be null";
            if (color == null) throw "line :: color cannot be null";
        #end
        var _color:Scalar_ = color;
        Core.load("line", 7)(img.nativeObject, pt1.nativeObject, pt2.nativeObject, _color.nativeObject, thickness, lineType, shift);
    }
    public static inline function rectangle(img:Arr, pt1:Point, pt2:Point, color:RGB, thickness:Int=1, lineType:Int=8, shift:Int=0) {
        #if debug
            if (img   == null) throw "rectangle :: img cannot be null";
            if (pt1   == null) throw "rectangle :: pt1 cannot be null";
            if (pt2   == null) throw "rectangle :: pt1 cannot be null";
            if (color == null) throw "rectangle :: color cannot be null";
        #end
        var _color:Scalar_ = color;
        Core.load("rectangle", 7)(img.nativeObject, pt1.nativeObject, pt2.nativeObject, _color.nativeObject, thickness, lineType, shift);
    }
    public static inline function rgb(r:Int=0, g:Int=0, b:Int=0):RGB {
        return scalar(b, g, r);
    }
    public static inline function createFont(fontFace:Int, hscale:Float=1, vscale:Float=1, shear:Float=0, thickness:Int=1, lineType:Int=8):Font {
        return NativeBinding.generic(Core.load("createFont", 6)(fontFace, hscale, vscale, shear, thickness, lineType));
    }
    public static inline function putText(img:Arr, text:String, org:Point, font:Font, color:RGB) {
        #if debug
            if (img   == null) throw "putText :: img cannot be null";
            if (org   == null) throw "putText :: org cannot be null";
            if (font  == null) throw "putText :: font cannot be null";
            if (color == null) throw "putText :: color cannot be null";
        #end
        var _color:Scalar_ = color;
        Core.load("putText", 5)(img.nativeObject, text, org.nativeObject, font.nativeObject, _color.nativeObject);
    }
}
