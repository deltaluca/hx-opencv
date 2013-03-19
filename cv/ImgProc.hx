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

    // -------------------------
    // Flags for kernel shapes.
    // -------------------------
    @:CvConst var CV_SHAPE_RECT;
    @:CvConst var CV_SHAPE_CROSS;
    @:CvConst var CV_SHAPE_ELLIPSE;
    @:CvConst var CV_SHAPE_CUSTOM;

    // -------------------------
    // Morphological operator flags.
    // -------------------------
    @:CvConst var CV_MOP_OPEN;
    @:CvConst var CV_MOP_CLOSE;
    @:CvConst var CV_MOP_GRADIENT;
    @:CvConst var CV_MOP_TOPHAT;
    @:CvConst var CV_MOP_BLACKHAT;

    // -------------------------
    // Smoothening operators.
    // -------------------------
    @:CvConst var CV_GAUSSIAN;
    @:CvConst var CV_BLUR;
    @:CvConst var CV_BLUR_NO_SCALE;
    @:CvConst var CV_MEDIAN;
    @:CvConst var CV_BILATERAL;

    // -------------------------
    // Color conversion flags.
    // -------------------------
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
    @:CvConst var CV_YUV2RGB_NV12;
    @:CvConst var CV_YUV2BGR_NV12;
    @:CvConst var CV_YUV2RGB_NV21;
    @:CvConst var CV_YUV2BGR_NV21;
    @:CvConst var CV_YUV420sp2RGB;
    @:CvConst var CV_YUV420sp2BGR;
    @:CvConst var CV_YUV2RGBA_NV12;
    @:CvConst var CV_YUV2BGRA_NV12;
    @:CvConst var CV_YUV2RGBA_NV21;
    @:CvConst var CV_YUV2BGRA_NV21;
    @:CvConst var CV_YUV420sp2RGBA;
    @:CvConst var CV_YUV420sp2BGRA;
    @:CvConst var CV_YUV2RGB_YV12;
    @:CvConst var CV_YUV2BGR_YV12;
    @:CvConst var CV_YUV2RGB_IYUV;
    @:CvConst var CV_YUV2BGR_IYUV;
    @:CvConst var CV_YUV2RGB_I420;
    @:CvConst var CV_YUV2BGR_I420;
    @:CvConst var CV_YUV420p2RGB;
    @:CvConst var CV_YUV420p2BGR;
    @:CvConst var CV_YUV2RGBA_YV12;
    @:CvConst var CV_YUV2BGRA_YV12;
    @:CvConst var CV_YUV2RGBA_IYUV;
    @:CvConst var CV_YUV2BGRA_IYUV;
    @:CvConst var CV_YUV2RGBA_I420;
    @:CvConst var CV_YUV2BGRA_I420;
    @:CvConst var CV_YUV420p2RGBA;
    @:CvConst var CV_YUV420p2BGRA;
    @:CvConst var CV_YUV2GRAY_420;
    @:CvConst var CV_YUV2GRAY_NV21;
    @:CvConst var CV_YUV2GRAY_NV12;
    @:CvConst var CV_YUV2GRAY_YV12;
    @:CvConst var CV_YUV2GRAY_IYUV;
    @:CvConst var CV_YUV2GRAY_I420;
    @:CvConst var CV_YUV420sp2GRAY;
    @:CvConst var CV_YUV420p2GRAY;
    @:CvConst var CV_YUV2RGB_UYVY;
    @:CvConst var CV_YUV2BGR_UYVY;
    @:CvConst var CV_YUV2RGB_Y422;
    @:CvConst var CV_YUV2BGR_Y422;
    @:CvConst var CV_YUV2RGB_UYNV;
    @:CvConst var CV_YUV2BGR_UYNV;
    @:CvConst var CV_YUV2RGBA_UYVY;
    @:CvConst var CV_YUV2BGRA_UYVY;
    @:CvConst var CV_YUV2RGBA_Y422;
    @:CvConst var CV_YUV2BGRA_Y422;
    @:CvConst var CV_YUV2RGBA_UYNV;
    @:CvConst var CV_YUV2BGRA_UYNV;
    @:CvConst var CV_YUV2RGB_YUY2;
    @:CvConst var CV_YUV2BGR_YUY2;
    @:CvConst var CV_YUV2RGB_YVYU;
    @:CvConst var CV_YUV2BGR_YVYU;
    @:CvConst var CV_YUV2RGB_YUYV;
    @:CvConst var CV_YUV2BGR_YUYV;
    @:CvConst var CV_YUV2RGB_YUNV;
    @:CvConst var CV_YUV2BGR_YUNV;
    @:CvConst var CV_YUV2RGBA_YUY2;
    @:CvConst var CV_YUV2BGRA_YUY2;
    @:CvConst var CV_YUV2RGBA_YVYU;
    @:CvConst var CV_YUV2BGRA_YVYU;
    @:CvConst var CV_YUV2RGBA_YUYV;
    @:CvConst var CV_YUV2BGRA_YUYV;
    @:CvConst var CV_YUV2RGBA_YUNV;
    @:CvConst var CV_YUV2BGRA_YUNV;
    @:CvConst var CV_YUV2GRAY_UYVY;
    @:CvConst var CV_YUV2GRAY_YUY2;
    @:CvConst var CV_YUV2GRAY_Y422;
    @:CvConst var CV_YUV2GRAY_UYNV;
    @:CvConst var CV_YUV2GRAY_YVYU;
    @:CvConst var CV_YUV2GRAY_YUYV;
    @:CvConst var CV_YUV2GRAY_YUNV;
    @:CvConst var CV_RGBA2mRGBA;
    @:CvConst var CV_mRGBA2RGBA;

    // -------------------------
    // Distance metric flags.
    // -------------------------
    @:CvConst var CV_DIST_C;
    @:CvConst var CV_DIST_L1;
    @:CvConst var CV_DIST_L2;

    // -------------------------
    // Threshold operators flags.
    // -------------------------
    @:CvConst var CV_THRESH_BINARY;
    @:CvConst var CV_THRESH_BINARY_INV;
    @:CvConst var CV_THRESH_TRUNC;
    @:CvConst var CV_THRESH_TOZERO;
    @:CvConst var CV_THRESH_TOZERO_INV;

    // -------------------------
    // Image processing methods.
    // -------------------------
    @:CvProc function createStructuringElementEx(cols:Int, rows:Int, anchorX:Int, anchorY:Int, shape:Int, ?values:Null<Array<Int>>):ConvKernel {
        @:CvCheck if (shape == CV_SHAPE_CUSTOM && values == null) throw "values cannot be null when using CV_SHAPE_CUSTOM";
        return NativeBinding.generic(load("createStructuringElementEx", 6)(cols, rows, anchorX, anchorY, shape, values));
    }

    @:CvProc function dilate(src:Arr, dst:Arr, ?element:Null<ConvKernel>, iterations:Int=1):Void;
    @:CvProc function erode (src:Arr, dst:Arr, ?element:Null<ConvKernel>, iterations:Int=1):Void;
    @:CvProc(anchor=Core.point(-1,-1)) function filter2D(src:Arr, dst:Arr, kernel:Mat, ?anchor:Null<Point>):Void;

    @:CvProc function threshold(src:Arr, dst:Arr, threshold:Float, maxValue:Float, thresholdType:Int):Void;

    @:CvProc function morphologyEx(src:Arr, dst:Arr, tmp:Null<Arr>, element:ConvKernel, operation:Int, iterations:Int=1) {
        @:CvCheck(tmp) if (tmp == null && (operation == CV_MOP_GRADIENT)) throw "tmp Arr required for MOP_GRADIENT";
        @:CvCheck(tmp) if (tmp == null && src == dst && (operation == CV_MOP_TOPHAT || operation == CV_MOP_BLACKHAT)) throw "tmp Arr required for in-place MOP_TOPHAT/BLACKHAT";
        load("morphologyEx", 6)(src.nativeObject, dst.nativeObject, NativeBinding.native(tmp), element.nativeObject, operation, iterations);
    }

    @:CvProc function pyrDown(src:Arr, dst:Arr):Void;
    @:CvProc(smoothType=CV_GAUSSIAN) function smooth(src:Arr, dst:Arr, ?smoothType:Null<Int>, param1:Int=3, param2:Int=0, param3:Int=0, param4:Int=0):Void;

    @:CvProc function laplace (src:Arr,   dst:Arr, apertureSize:Int=3):Void;
    @:CvProc function sobel   (src:Arr,   dst:Arr, xorder:Int, yorder:Int, apertureSize:Int=3):Void;
    @:CvProc function integral(image:Arr, sum:Arr, ?sqsum:Null<Arr>, ?tiltedSum:Null<Arr>):Void;

    @:CvProc function cvtColor(src:Arr, dst:Arr, code:Int):Void;
    @:CvProc(distanceType=CV_DIST_L2) function distTransform(src:Arr, dst:Arr, ?distanceType:Null<Int>, maskSize:Int=3, ?mask:Null<Array<Float>>, ?labels:Null<Arr>):Void;

    @:CvProc function acc        (image :Arr, sum   :Arr, ?mask:Null<Arr>):Void;
    @:CvProc function squareAcc  (image :Arr, sqsum :Arr, ?mask:Null<Arr>):Void;
    @:CvProc function multiplyAcc(image1:Arr, image2:Arr, acc:Arr,     ?mask:Null<Arr>):Void;
    @:CvProc function runningAvg (image :Arr, acc   :Arr, alpha:Float, ?mask:Null<Arr>):Void;

    // -------------------------
    // Feature detection.
    // -------------------------
    // Differs from C-API with maxCorners parameter laying a cap on the number of corners to detect
    // Corners are stored into the corners array (expanded as necessary) and this function
    // returns the number of found corners (<= maxCorners)
    @:CvProc function goodFeaturesToTrack(image:Arr, eigImage:Arr, tempImage:Arr, corners:Array<Point2D32f>, maxCorners:Int, qualityLevel:Float, minDistance:Float, ?mask:Null<Arr>, blockSize:Int=3, useHarris:Bool=false, k:Float=0.04):Int {
        var corns = NativeBinding.mapNative(corners);
        var ret = load("goodFeaturesToTrack", 11)(image.nativeObject, eigImage.nativeObject, tempImage.nativeObject, corns, maxCorners, qualityLevel, minDistance, NativeBinding.native(mask), blockSize, useHarris ? 1 : 0, k);
        for (i in corners.length...ret)
            corners[i] = new Point2D32f(corns[i]);
        return ret;
    }

}
