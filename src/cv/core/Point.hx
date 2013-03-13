package cv.core;

class Point extends NativeBinding {
    @:allow(cv)
    function new(nativeObject:Dynamic) {
        super(nativeObject);
    }
    @:allow(cv)
    static inline function cvt(x:Dynamic):Null<Point> {
        return if (x == null) null else new Point(x);
    }



    public var x(get,set):Int;
    public var y(get,set):Int;

    inline function get_x() { return Core.load("Point_get_x", 1)(nativeObject); }
    inline function get_y() { return Core.load("Point_get_y", 1)(nativeObject); }

    inline function set_x(x:Int) { return Core.load("Point_set_x", 2)(nativeObject, x); }
    inline function set_y(y:Int) { return Core.load("Point_set_y", 2)(nativeObject, y); }



    public inline function toString() {
        return '{Point x=$x y=$y}';
    }
}
