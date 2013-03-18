package cv;

class NativeBinding {
    @:allow(cv)
    var nativeObject:Dynamic;

    @:allow(cv)
    function new(x:Dynamic) {
        nativeObject = x;
    }

    @:allow(cv)
    inline static function generic(x:Null<Dynamic>):Null<NativeBinding> {
        return if (x == null) null else new NativeBinding(x);
    }

    @:allow(cv)
    static inline function native(object:Null<NativeBinding>):Null<Dynamic> {
        return if (object == null) null else object.nativeObject;
    }

    @:allow(cv)
    static inline function mapNative<T:NativeBinding>(objects:Array<Null<T>>):Array<Null<Dynamic>> {
        var ret = [];
        for (o in objects) ret.push(native(o));
        return ret;
    }
}
