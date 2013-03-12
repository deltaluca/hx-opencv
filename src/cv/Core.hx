package cv;

import #if cpp cpp #else neko #end.Lib;

import cv.core.Scalar;

typedef Arr = NativeBinding; // Image|Mat|Seq?

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
}
