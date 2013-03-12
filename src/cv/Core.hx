package cv;

import #if cpp cpp #else neko #end.Lib;

class Core {
    @:allow(cv.core)
    static inline function load(n:String, p:Int=0):Dynamic {
        return Lib.load("opencv", "hx_cv_core_"+n, p);
    }

    public static inline function CV_TERMCRIT_ITER  () { return load("CV_TERMCRIT_ITER",   0)(); }
    public static inline function CV_TERMCRIT_NUMBER() { return load("CV_TERMCRIT_NUMBER", 0)(); }
    public static inline function CV_TERMCRIT_EPS   () { return load("CV_TERMCRIT_EPS",    0)(); }
}
