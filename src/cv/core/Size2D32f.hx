package cv.core;

class Size2D32f extends NativeBinding {
    @:allow(cv)
    function new(nativeObject:Dynamic) {
        super(nativeObject);
    }
    @:allow(cv)
    static inline function cvt(x:Dynamic):Null<Size2D32f> {
        return if (x == null) null else new Size2D32f(x);
    }



    public var width (get,set):Float;
    public var height(get,set):Float;

    inline function get_width () { return Core.load("Size2D32f_get_width",  1)(nativeObject); }
    inline function get_height() { return Core.load("Size2D32f_get_height", 1)(nativeObject); }

    inline function set_width (width :Float) { return Core.load("Size2D32f_set_width",  2)(nativeObject, width ); }
    inline function set_height(height:Float) { return Core.load("Size2D32f_set_height", 2)(nativeObject, height); }



    public inline function toString() {
        return '{Size2D32f width=$width height=$height}';
    }
}
