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


    @:CvConst var CV_BGR2BGRA;
    @:CvConst var CV_RGB2RGBA;
    @:CvConst var CV_BGRA2BGR;
    @:CvConst var CV_RGBA2RGB;
    @:CvConst var CV_BGR2RGBA;
    @:CvConst var CV_RGB2BGRA;
    @:CvConst var CV_RGBA2BGR;
    @:CvConst var CV_BGRA2RGB;
    @:CvConst var CV_BGR2RGB;
    @:CvConst var CV_RGB2BGR;
    @:CvConst var CV_BGRA2RGBA;
    @:CvConst var CV_RGBA2BGRA;
    @:CvConst var CV_BGR2GRAY;
    @:CvConst var CV_RGB2GRAY;
    @:CvConst var CV_GRAY2BGR;
    @:CvConst var CV_GRAY2RGB;
    @:CvConst var CV_GRAY2BGRA;
    @:CvConst var CV_GRAY2RGBA;
    @:CvConst var CV_BGRA2GRAY;
    @:CvConst var CV_RGBA2GRAY;
    @:CvConst var CV_BGR2BGR565;
    @:CvConst var CV_RGB2BGR565;
    @:CvConst var CV_BGR5652BGR;
    @:CvConst var CV_BGR5652RGB;
    @:CvConst var CV_BGRA2BGR565;
    @:CvConst var CV_RGBA2BGR565;
    @:CvConst var CV_BGR5652BGRA;
    @:CvConst var CV_BGR5652RGBA;
    @:CvConst var CV_GRAY2BGR565;
    @:CvConst var CV_BGR5652GRAY;
    @:CvConst var CV_BGR2BGR555;
    @:CvConst var CV_RGB2BGR555;
    @:CvConst var CV_BGR5552BGR;
    @:CvConst var CV_BGR5552RGB;
    @:CvConst var CV_BGRA2BGR555;
    @:CvConst var CV_RGBA2BGR555;
    @:CvConst var CV_BGR5552BGRA;
    @:CvConst var CV_BGR5552RGBA;
    @:CvConst var CV_GRAY2BGR555;
    @:CvConst var CV_BGR5552GRAY;
    @:CvConst var CV_BGR2XYZ;
    @:CvConst var CV_RGB2XYZ;
    @:CvConst var CV_XYZ2BGR;
    @:CvConst var CV_XYZ2RGB;
    @:CvConst var CV_BGR2YCrCb;
    @:CvConst var CV_RGB2YCrCb;
    @:CvConst var CV_YCrCb2BGR;
    @:CvConst var CV_YCrCb2RGB;
    @:CvConst var CV_BGR2HSV;
    @:CvConst var CV_RGB2HSV;
    @:CvConst var CV_BGR2Lab;
    @:CvConst var CV_RGB2Lab;
    @:CvConst var CV_BayerBG2BGR;
    @:CvConst var CV_BayerGB2BGR;
    @:CvConst var CV_BayerRG2BGR;
    @:CvConst var CV_BayerGR2BGR;
    @:CvConst var CV_BayerBG2RGB;
    @:CvConst var CV_BayerGB2RGB;
    @:CvConst var CV_BayerRG2RGB;
    @:CvConst var CV_BayerGR2RGB;
    @:CvConst var CV_BGR2Luv;
    @:CvConst var CV_RGB2Luv;
    @:CvConst var CV_BGR2HLS;
    @:CvConst var CV_RGB2HLS;
    @:CvConst var CV_HSV2BGR;
    @:CvConst var CV_HSV2RGB;
    @:CvConst var CV_Lab2BGR;
    @:CvConst var CV_Lab2RGB;
    @:CvConst var CV_Luv2BGR;
    @:CvConst var CV_Luv2RGB;
    @:CvConst var CV_HLS2BGR;
    @:CvConst var CV_HLS2RGB;
    @:CvConst var CV_BayerBG2BGR_VNG;
    @:CvConst var CV_BayerGB2BGR_VNG;
    @:CvConst var CV_BayerRG2BGR_VNG;
    @:CvConst var CV_BayerGR2BGR_VNG;
    @:CvConst var CV_BayerBG2RGB_VNG;
    @:CvConst var CV_BayerGB2RGB_VNG;
    @:CvConst var CV_BayerRG2RGB_VNG;
    @:CvConst var CV_BayerGR2RGB_VNG;
    @:CvConst var CV_BGR2HSV_FULL;
    @:CvConst var CV_RGB2HSV_FULL;
    @:CvConst var CV_BGR2HLS_FULL;
    @:CvConst var CV_RGB2HLS_FULL;
    @:CvConst var CV_HSV2BGR_FULL;
    @:CvConst var CV_HSV2RGB_FULL;
    @:CvConst var CV_HLS2BGR_FULL;
    @:CvConst var CV_HLS2RGB_FULL;
    @:CvConst var CV_LBGR2Lab;
    @:CvConst var CV_LRGB2Lab;
    @:CvConst var CV_LBGR2Luv;
    @:CvConst var CV_LRGB2Luv;
    @:CvConst var CV_Lab2LBGR;
    @:CvConst var CV_Lab2LRGB;
    @:CvConst var CV_Luv2LBGR;
    @:CvConst var CV_Luv2LRGB;
    @:CvConst var CV_BGR2YUV;
    @:CvConst var CV_RGB2YUV;
    @:CvConst var CV_YUV2BGR;
    @:CvConst var CV_YUV2RGB;
    @:CvConst var CV_BayerBG2GRAY;
    @:CvConst var CV_BayerGB2GRAY;
    @:CvConst var CV_BayerRG2GRAY;
    @:CvConst var CV_BayerGR2GRAY;
    @:CvConst var CV_YUV420i2RGB;
    @:CvConst var CV_YUV420i2BGR;
    @:CvConst var CV_YUV420sp2RGB;
    @:CvConst var CV_YUV420sp2BGR;


    @:CvConst var CV_DIST_C;
    @:CvConst var CV_DIST_L1;
    @:CvConst var CV_DIST_L2;


    @:CvProc function cvtColor(src:Arr, dst:Arr, code:Int)
        load("cvtColor", 3)(src.nativeObject, dst.nativeObject, code);
    @:CvProc function distTransform(src:Arr, dst:Arr, ?distance_type:Null<Int>, mask_size:Int=3, ?mask:Null<Array<Float>>, ?labels:Null<Arr>) {
        if (distance_type == null) distance_type = CV_DIST_L2;
        load("distTransform", 6)(src.nativeObject, dst.nativeObject, distance_type, mask_size, mask, NativeBinding.native(labels));
    }
    @:CvProc function integral(image:Arr, sum:Arr, ?sqsum:Null<Arr>, ?tiltedSum:Null<Arr>)
        load("integral", 4)(image.nativeObject, sum.nativeObject, NativeBinding.native(sqsum), NativeBinding.native(tiltedSum));
}
