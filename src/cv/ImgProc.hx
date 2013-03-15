package cv;

import #if cpp cpp #else neko #end.Lib;
import cv.core.*;
import cv.Core;

typedef ConvKernel = NativeBinding;

class ImgProc {
    @:allow(cv.imgproc)
    static inline function load(n:String, p:Int=0):Dynamic {
        return Lib.load("opencv", "hx_cv_imgproc_"+n, p);
    }



    public static var CV_SHAPE_RECT   (get, never):Int; static inline function get_CV_SHAPE_RECT   () { return load("CV_SHAPE_RECT",    0)(); }
    public static var CV_SHAPE_CROSS  (get, never):Int; static inline function get_CV_SHAPE_CROSS  () { return load("CV_SHAPE_CROSS",   0)(); }
    public static var CV_SHAPE_ELLIPSE(get, never):Int; static inline function get_CV_SHAPE_ELLIPSE() { return load("CV_SHAPE_ELLIPSE", 0)(); }
    public static var CV_SHAPE_CUSTOM (get, never):Int; static inline function get_CV_SHAPE_CUSTOM () { return load("CV_SHAPE_CUSTOM",  0)(); }



    public static inline function createStructuringElementEx(cols:Int, rows:Int, anchorX:Int, anchorY:Int, shape:Int, ?values:Null<Array<Int>>):ConvKernel {
        #if debug
            if (shape == CV_SHAPE_CUSTOM && values == null) throw "createStructuringElementEx :: values cannot be null when using CV_SHAPE_CUSTOM";
        #end
        return NativeBinding.generic(load("createStructuringElementEx", 6)(cols, rows, anchorX, anchorY, shape, values));
    }
    public static inline function dilate(src:Arr, dst:Arr, ?element:Null<ConvKernel>, iterations:Int=1) {
        #if debug
            if (src == null) throw "dilate :: src cannot be null";
            if (dst == null) throw "dilate :: dst cannot be null";
        #end
        load("dilate", 4)(src.nativeObject, dst.nativeObject, NativeBinding.native(element), iterations);
    }
    public static inline function erode(src:Arr, dst:Arr, ?element:Null<ConvKernel>, iterations:Int=1) {
        #if debug
            if (src == null) throw "erode :: src cannot be null";
            if (dst == null) throw "erode :: dst cannot be null";
        #end
        load("erode", 4)(src.nativeObject, dst.nativeObject, NativeBinding.native(element), iterations);
    }
    public static inline function filter2D(src:Arr, dst:Arr, kernel:Mat, ?anchor:Null<Point>) {
        #if debug
            if (src == null) throw "filter2D :: src cannot be null";
            if (dst == null) throw "filter2D :: dst cannot be null";
            if (kernel == null) throw "filter2D :: kernel cannot be null";
        #end
        if (anchor == null) anchor = Core.point(-1,-1);
        load("filter2D", 4)(src.nativeObject, dst.nativeObject, kernel.nativeObject, anchor.nativeObject);
    }
}
