package cv;

import #if cpp cpp #else neko #end.Lib;

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
}
