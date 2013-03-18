package cv.core;

class TermCriteria extends NativeBinding {
    @:allow(cv)
    function new(nativeObject:Dynamic) {
        super(nativeObject);
    }
    @:allow(cv)
    static inline function cvt(type:Dynamic):Null<TermCriteria> {
        return if (type == null) null else new TermCriteria(type);
    }



    public var type    (get,set):Int;
    public var max_iter(get,set):Int;
    public var epsilon (get,set):Float;

    inline function get_type    () { return Core.load("TermCriteria_get_type",     1)(nativeObject); }
    inline function get_max_iter() { return Core.load("TermCriteria_get_max_iter", 1)(nativeObject); }
    inline function get_epsilon () { return Core.load("TermCriteria_get_epsilon",  1)(nativeObject); }

    inline function set_type    (type:Int)      { return Core.load("TermCriteria_set_type",     2)(nativeObject, type); }
    inline function set_max_iter(max_iter:Int)  { return Core.load("TermCriteria_set_max_iter", 2)(nativeObject, max_iter); }
    inline function set_epsilon (epsilon:Float) { return Core.load("TermCriteria_set_epsilon",  2)(nativeObject, epsilon); }



    public inline function toString() {
        return '{TermCriteria type=$type max_iter=$max_iter}';
    }
}
