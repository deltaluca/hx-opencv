package cv;

import #if cpp cpp #else neko #end.Lib;
import cv.core.*;
import cv.Core;

import cv.Macros;

typedef ConvKernel = NativeBinding;

class ImgProc implements CvConsts implements CvProcs {
    @:allow(cv.imgproc)
    static inline function load(n:String, p:Int=0):Dynamic
        return Lib.load("opencv", "hx_cv_imgproc_"+n, p);


    @:CvConst var CV_SHAPE_RECT;
    @:CvConst var CV_SHAPE_CROSS;
    @:CvConst var CV_SHAPE_ELLIPSE;
    @:CvConst var CV_SHAPE_CUSTOM;


    @:CvProc function createStructuringElementEx(cols:Int, rows:Int, anchorX:Int, anchorY:Int, shape:Int, ?values:Null<Array<Int>>):ConvKernel {
        @:CvCheck if (shape == CV_SHAPE_CUSTOM && values == null) throw "values cannot be null when using CV_SHAPE_CUSTOM";
        return NativeBinding.generic(load("createStructuringElementEx", 6)(cols, rows, anchorX, anchorY, shape, values));
    }
    @:CvProc function dilate(src:Arr, dst:Arr, ?element:Null<ConvKernel>, iterations:Int=1)
        load("dilate", 4)(src.nativeObject, dst.nativeObject, NativeBinding.native(element), iterations);
    @:CvProc function erode(src:Arr, dst:Arr, ?element:Null<ConvKernel>, iterations:Int=1)
        load("erode", 4)(src.nativeObject, dst.nativeObject, NativeBinding.native(element), iterations);
    @:CvProc function filter2D(src:Arr, dst:Arr, kernel:Mat, ?anchor:Null<Point>) {
        if (anchor == null) anchor = Core.point(-1,-1);
        load("filter2D", 4)(src.nativeObject, dst.nativeObject, kernel.nativeObject, anchor.nativeObject);
    }
}
