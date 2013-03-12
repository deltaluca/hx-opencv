package cv;

class NativeBinding {
    @:allow(cv)
    var nativeObject:Dynamic;

    public static inline function native(object:NativeBinding) {
        return if (object == null) null else object.nativeObject;
    }
}
