package cv.core;

class Size extends NativeBinding {
    public var width (get,set):Int;
    public var height(get,set):Int;

    inline function get_width () { return Core.load("Size_get_width",  1)(nativeObject); }
    inline function get_height() { return Core.load("Size_get_height", 1)(nativeObject); }

    inline function set_width (width :Int) { return Core.load("Size_set_width",  2)(nativeObject, width ); }
    inline function set_height(height:Int) { return Core.load("Size_set_height", 2)(nativeObject, height); }

    public function new(width:Int=0, height:Int=0) {
        nativeObject = Core.load("Size", 2)(width, height);
    }

    public inline function toString() {
        return '{Size width=$width height=$height}';
    }
}

