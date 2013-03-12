package cv;

import #if cpp cpp #else neko #end.Lib;

class Core {
    @:allow(cv.core)
    static inline function load(n:String, p:Int=0):Dynamic {
        return Lib.load("opencv", "hx_cv_core_"+n, p);
    }
}
