package cv.core;

class Point3D64f extends NativeBinding {
    public var x(get,set):Float;
    public var y(get,set):Float;
    public var z(get,set):Float;

    inline function get_x() { return Core.load("Point3D64f_get_x", 1)(nativeObject); }
    inline function get_y() { return Core.load("Point3D64f_get_y", 1)(nativeObject); }
    inline function get_z() { return Core.load("Point3D64f_get_z", 1)(nativeObject); }

    inline function set_x(x:Float) { return Core.load("Point3D64f_set_x", 2)(nativeObject, x); }
    inline function set_y(y:Float) { return Core.load("Point3D64f_set_y", 2)(nativeObject, y); }
    inline function set_z(z:Float) { return Core.load("Point3D64f_set_z", 2)(nativeObject, z); }

    public function new(x:Float=0, y:Float=0, z:Float=0) {
        nativeObject = Core.load("Point3D64f", 3)(x, y, z);
    }

    public inline function toString() {
        return '{Point3D64f x=$x y=$y z=$z}';
    }
}

