package cv.core;

class Rect extends NativeBinding {
    @:allow(cv)
    function new(nativeObject:Dynamic) {
        super(nativeObject);
    }
    @:allow(cv)
    static inline function cvt(x:Dynamic):Null<Rect> {
        return if (x == null) null else new Rect(x);
    }



    public var x     (get,set):Int;
    public var y     (get,set):Int;
    public var width (get,set):Int;
    public var height(get,set):Int;

    inline function get_x     () { return Core.load("Rect_get_x",      1)(nativeObject); }
    inline function get_y     () { return Core.load("Rect_get_y",      1)(nativeObject); }
    inline function get_width () { return Core.load("Rect_get_width",  1)(nativeObject); }
    inline function get_height() { return Core.load("Rect_get_height", 1)(nativeObject); }

    inline function set_x     (x     :Int) { return Core.load("Rect_set_x",      2)(nativeObject, x     ); }
    inline function set_y     (y     :Int) { return Core.load("Rect_set_y",      2)(nativeObject, y     ); }
    inline function set_width (width :Int) { return Core.load("Rect_set_width",  2)(nativeObject, width ); }
    inline function set_height(height:Int) { return Core.load("Rect_set_height", 2)(nativeObject, height); }



    public inline function toString() {
        return '{Rect x=$x y=$y width=$width height=$height}';
    }
}

