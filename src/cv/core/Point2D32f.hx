package cv.core;

class Point2D32f extends NativeBinding {
    public var x(get,set):Float;
    public var y(get,set):Float;

    inline function get_x() { return Core.load("Point2D32f_get_x", 1)(nativeObject); }
    inline function get_y() { return Core.load("Point2D32f_get_y", 1)(nativeObject); }

    inline function set_x(x:Float) { return Core.load("Point2D32f_set_x", 2)(nativeObject, x); }
    inline function set_y(y:Float) { return Core.load("Point2D32f_set_y", 2)(nativeObject, y); }

    public function new(x:Float=0, y:Float=0) {
        nativeObject = Core.load("Point2D32f", 2)(x, y);
    }
}

