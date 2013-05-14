package cv.core;

abstract Scalar(Scalar_) from Scalar_ to Scalar_ {
    @:allow(cv)
    inline function new(x:Dynamic) {
        this = new Scalar_(x);
    }
    @:allow(cv)
    inline static function cvt(x:Dynamic) {
        return if (x == null) null else new Scalar_(x);
    }


    @:arrayAccess public inline function get(i:Int):Float {
        return Core.load("Scalar_get_i", 2)(this.nativeObject, i);
    }
    @:arrayAccess public inline function set(i:Int, x:Float):Float {
        return Core.load("Scalar_set_i", 3)(this.nativeObject, i, x);
    }


    public inline function toString() {
        return '{Scalar [${get(0)},${get(1)},${get(2)},${get(3)}]}';
    }
}

typedef RGB = Scalar;

class Scalar_ extends NativeBinding {
    public function new(x:Dynamic) {
        super(x);
    }
}
