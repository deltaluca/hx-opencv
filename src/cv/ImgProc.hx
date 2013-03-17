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


    @:CvConst var CV_MOP_OPEN;
    @:CvConst var CV_MOP_CLOSE;
    @:CvConst var CV_MOP_GRADIENT;
    @:CvConst var CV_MOP_TOPHAT;
    @:CvConst var CV_MOP_BLACKHAT;


    @:CvConst var CV_GAUSSIAN;
    @:CvConst var CV_BLUR;
    @:CvConst var CV_BLUR_NO_SCALE;
    @:CvConst var CV_MEDIAN;
    @:CvConst var CV_BILATERAL;


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
    @:CvProc function laplace(src:Arr, dst:Arr, apertureSize:Int=3)
        load("laplace", 3)(src.nativeObject, dst.nativeObject, apertureSize);
    @:CvProc function morphologyEx(src:Arr, dst:Arr, tmp:Null<Arr>, element:ConvKernel, operation:Int, iterations:Int=1) {
        @:CvCheck(tmp) if (tmp == null && (operation == CV_MOP_GRADIENT)) throw "tmp Arr required for MOP_GRADIENT";
        @:CvCheck(tmp) if (tmp == null && src == dst && (operation == CV_MOP_TOPHAT || operation == CV_MOP_BLACKHAT)) throw "tmp Arr required for in-place MOP_TOPHAT/BLACKHAT";
        load("morphologyEx", 6)(src.nativeObject, dst.nativeObject, NativeBinding.native(tmp), element.nativeObject, operation, iterations);
    }
    @:CvProc function pyrDown(src:Arr, dst:Arr)
        load("pyrDown", 2)(src.nativeObject, dst.nativeObject);
    @:CvProc function smooth(src:Arr, dst:Arr, ?smoothType:Null<Int>, param1:Int=3, param2:Int=0, param3:Int=0, param4:Int=0) {
        if (smoothType == null) smoothType = CV_GAUSSIAN;
        load("smooth", 7)(src.nativeObject, dst.nativeObject, smoothType, param1, param2, param3, param4);
    }
    @:CvProc function sobel(src:Arr, dst:Arr, xorder:Int, yorder:Int, apertureSize:Int=3)
        load("sobel", 5)(src.nativeObject, dst.nativeObject, xorder, yorder, apertureSize);
}
