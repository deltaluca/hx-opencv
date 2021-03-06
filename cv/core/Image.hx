package cv.core;

import cv.core.CVBuffer;
import cv.core.Size;

class Image extends NativeBinding {
    @:allow(cv)
    function new(nativeObject:Dynamic) {
        super(nativeObject);
    }
    @:allow(cv)
    static inline function cvt(x:Dynamic):Null<Image> {
        return if (x == null) null else new Image(x);
    }

    public var raw(get, never):CVBuffer;
    inline function get_raw():CVBuffer return Core.load("Image_get_raw", 1)(nativeObject);

    public var nChannels(get,never):Int;
    public var depth    (get,never):Int;
    public var dataOrder(get,never):Int;
    public var origin   (get,never):Int;
    public var width    (get,never):Int;
    public var height   (get,never):Int;
    public var imageSize(get,never):Int;
    public var widthStep(get,never):Int;

    inline function get_nChannels():Int { return Core.load("Image_get_nChannels", 1)(this.nativeObject); }
    inline function get_depth    ():Int { return Core.load("Image_get_depth",     1)(this.nativeObject); }
    inline function get_dataOrder():Int { return Core.load("Image_get_dataOrder", 1)(this.nativeObject); }
    inline function get_origin   ():Int { return Core.load("Image_get_origin",    1)(this.nativeObject); }
    inline function get_width    ():Int { return Core.load("Image_get_width",     1)(this.nativeObject); }
    inline function get_height   ():Int { return Core.load("Image_get_height",    1)(this.nativeObject); }
    inline function get_imageSize():Int { return Core.load("Image_get_imageSize", 1)(this.nativeObject); }
    inline function get_widthStep():Int { return Core.load("Image_get_widthStep", 1)(this.nativeObject); }

    public inline function toString() {
        return '{Image (${width}x$height) : nChannels=$nChannels depth=$depth dataOrder=$dataOrder origin=$origin imageSize=$imageSize widthStep=$widthStep}';
    }
}
