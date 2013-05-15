package cv.features2d;

import cv.core.Point2D32f;

class KeyPoint extends NativeBinding {
    @:allow(cv)
    function new(nativeObject:Dynamic) {
        super(nativeObject);
    }
    @:allow(cv)
    static inline function cvt(x:Dynamic):Null<KeyPoint> {
        return if (x == null) null else new KeyPoint(x);
    }


    var _pt:Point2D32f;
    public var pt      (get,never):Point2D32f;
    public var size    (get,never):Float;
    public var angle   (get,never):Float;
    public var response(get,never):Float;
    public var octave  (get,never):Int;
    public var class_id(get,never):Int;

    public static inline function make(x:Float, y:Float, size:Float, angle:Float, response:Float, octave:Float, class_id:Int=-1):KeyPoint {
        return KeyPoint.cvt(Features2D.load("KeyPoint_make", 7)(x, y, size, angle, response, octave, class_id));
    }

    inline function get_pt() {
        if (_pt == null) _pt = new Point2D32f(Features2D.load("KeyPoint_get_pt", 1)(nativeObject));
        return _pt;
    }
    inline function get_size    () { return Features2D.load("KeyPoint_get_size",     1)(nativeObject); }
    inline function get_angle   () { return Features2D.load("KeyPoint_get_angle",    1)(nativeObject); }
    inline function get_response() { return Features2D.load("KeyPoint_get_response", 1)(nativeObject); }
    inline function get_octave  () { return Features2D.load("KeyPoint_get_octave",   1)(nativeObject); }
    inline function get_class_id() { return Features2D.load("KeyPoint_get_class_id", 1)(nativeObject); }


    public inline function toString() {
        return '{KeyKeyPoint pt=$pt size=$size angle=$angle response=$response octave=$octave class_id=$class_id}';
    }
}
