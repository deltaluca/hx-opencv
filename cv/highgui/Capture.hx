package cv.highgui;

abstract Capture(NativeBinding) from NativeBinding to NativeBinding {
    @:allow(cv)
    inline function new(x:Dynamic) this = x;

    @:allow(cv)
    static inline function cvt(x:Dynamic):Null<Capture> {
        return if (x == null) null else NativeBinding.generic(x);
    }
}
