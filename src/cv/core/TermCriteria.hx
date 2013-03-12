package cv.core;

class Point extends NativeBinding {
    public var x(get,set):Int;
    public var y(get,set):Int;

    inline function get_x() { return Core.load("Point_get_x", 1)(nativeObject); }
    inline function get_y() { return Core.load("Point_get_y", 1)(nativeObject); }

    inline function set_x(x:Int) { return Core.load("Point_set_x", 2)(nativeObject, x); }
    inline function set_y(y:Int) { return Core.load("Point_set_y", 2)(nativeObject, y); }

    public function new(x:Int=0, y:Int=0) {
        nativeObject = Core.load("Point", 2)(x, y);
    }

    public inline function toString() {
        return '{Point x=$x y=$y}';
    }
}
