package cv.core;

class Mat extends NativeBinding {
    @:allow(cv)
    function new(nativeObject:Dynamic) {
        super(nativeObject);
    }
    @:allow(cv)
    static inline function cvt(x:Dynamic):Null<Mat> {
        return if (x == null) null else new Mat(x);
    }

    public var raw(get, never):Dynamic;
    inline function get_raw():Dynamic { return Core.load("Mat_get_raw", 1)(this.nativeObject); }


    public inline function get_uchar (i:Int):Int   { return Core.load("mat_uchar_get",  2)(this.nativeObject, i); }
    public inline function get_short (i:Int):Int   { return Core.load("mat_short_get",  2)(this.nativeObject, i); }
    public inline function get_int   (i:Int):Int   { return Core.load("mat_int_get",    2)(this.nativeObject, i); }
    public inline function get_float (i:Int):Float { return Core.load("mat_float_get",  2)(this.nativeObject, i); }
    public inline function get_double(i:Int):Float { return Core.load("mat_double_get", 2)(this.nativeObject, i); }

    public inline function set_uchar (i:Int, v:Int  ):Int   { return Core.load("mat_uchar_set",  3)(this.nativeObject, i, v); }
    public inline function set_short (i:Int, v:Int  ):Int   { return Core.load("mat_short_set",  3)(this.nativeObject, i, v); }
    public inline function set_int   (i:Int, v:Int  ):Int   { return Core.load("mat_int_set",    3)(this.nativeObject, i, v); }
    public inline function set_float (i:Int, v:Float):Float { return Core.load("mat_float_set",  3)(this.nativeObject, i, v); }
    public inline function set_double(i:Int, v:Float):Float { return Core.load("mat_double_set", 3)(this.nativeObject, i, v); }



    public var type(get,never):Int;
    public var step(get,never):Int;
    public var rows(get,never):Int;
    public var cols(get,never):Int;

    inline function get_type():Int { return Core.load("Mat_get_type", 1)(this.nativeObject); }
    inline function get_step():Int { return Core.load("Mat_get_step", 1)(this.nativeObject); }
    inline function get_rows():Int { return Core.load("Mat_get_rows", 1)(this.nativeObject); }
    inline function get_cols():Int { return Core.load("Mat_get_cols", 1)(this.nativeObject); }



    public inline function toString() {
        return '{Mat (${rows}x$cols) : type=$type step=$step}';
    }
}
