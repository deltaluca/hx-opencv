package cv.core;

class Size2D32f extends NativeBinding {
    public var width (get,set):Float;
    public var height(get,set):Float;

    inline function get_width () { return Core.load("Size2D32f_get_width",  1)(nativeObject); }
    inline function get_height() { return Core.load("Size2D32f_get_height", 1)(nativeObject); }

    inline function set_width (width :Float) { return Core.load("Size2D32f_set_width",  2)(nativeObject, width ); }
    inline function set_height(height:Float) { return Core.load("Size2D32f_set_height", 2)(nativeObject, height); }

    public function new(width:Float=0, height:Float=0) {
        nativeObject = Core.load("Size2D32f", 2)(width, height);
    }

    public inline function toString() {
        return '{Size2D32f width=$width height=$height}';
    }
}


