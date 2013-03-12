package cv;

class NativeBinding {
    @:isVar public var nativeObject(default, null):Dynamic;

    public static inline function native(object:NativeBinding) {
        return if (object == null) null else object.nativeObject;
    }
}
