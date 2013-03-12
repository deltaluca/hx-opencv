package cv.core;

abstract Scalar(Scalar_) from Scalar_ to Scalar_ {
    inline public function new(v0:Float=0, v1:Float=0, v2:Float=0, v3:Float=0) {
        this = new Scalar_(Core.load("Scalar", 4)(v0, v1, v2, v3));
    }
    @:arrayAccess public inline function get(i:Int):Float {
        return Core.load("Scalar_get_i", 2)(this.nativeObject, i);
    }
    @:arrayAccess public inline function set(i:Int, x:Float):Float {
        return Core.load("Scalar_set_i", 3)(this.nativeObject, i, x);
    }

    @:allow(cv)
    inline static function cvt(x:Dynamic) {
        return if (x == null) null else new Scalar_(x);
    }
    inline public static function all(v0123:Float) {
        return new Scalar(v0123, v0123, v0123, v0123);
    }
    inline public static function realScalar(v:Float) {
        return new Scalar(v, 0, 0, 0);
    }
}

class Scalar_ extends NativeBinding {
    public function new(x:Dynamic) {
        nativeObject = x;
    }
    public inline function toString() {
        var s:Scalar = this;
        return '{Scalar [${s[0]},${s[1]},${s[2]},${s[3]}]}';
    }
}
