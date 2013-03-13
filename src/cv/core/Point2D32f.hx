package cv.core;

class Point2D32f extends NativeBinding {
    @:allow(cv)
    function new(nativeObject:Dynamic) {
        super(nativeObject);
    }
    @:allow(cv)
    static inline function cvt(x:Dynamic):Null<Point2D32f> {
        return if (x == null) null else new Point2D32f(x);
    }



    public var x(get,set):Float;
    public var y(get,set):Float;

    inline function get_x() { return Core.load("Point2D32f_get_x", 1)(nativeObject); }
    inline function get_y() { return Core.load("Point2D32f_get_y", 1)(nativeObject); }

    inline function set_x(x:Float) { return Core.load("Point2D32f_set_x", 2)(nativeObject, x); }
    inline function set_y(y:Float) { return Core.load("Point2D32f_set_y", 2)(nativeObject, y); }



    public inline function toString() {
        return '{Point2D32f x=$x y=$y}';
    }
}

