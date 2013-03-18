package cv;

import #if cpp cpp #else neko #end.Lib;
import cv.core.*;
import cv.Core;

import cv.Macros;

class Video implements CvConsts implements CvProcs {
    @:allow(cv.video)
    static inline function load(n:String, p:Int=0):Dynamic
        return Lib.load("opencv", "hx_cv_video_"+n, p);


    @:CvConst var CV_LKFLOW_PYR_A_READY;
    @:CvConst var CV_LKFLOW_PYR_B_READY;
    @:CvConst var CV_LKFLOW_INITIAL_GUESSES;
    @:CvConst var CV_LKFLOW_GET_MIN_EIGENVALS;


    @:CvProc function calcOpticalFlowBM(prev:Arr, curr:Arr, blockSize:Size, shiftSize:Size, max_range:Size, usePrevious:Bool, velx:Arr, vely:Arr)
        load("calcOpticalFlowBM", 8)(prev.nativeObject, curr.nativeObject, blockSize.nativeObject, shiftSize.nativeObject, max_range.nativeObject, usePrevious ? 1 : 0, velx.nativeObject, vely.nativeObject);
    @:CvProc function calcOpticalFlowHS(prev:Arr, curr:Arr, usePrevious:Bool, velx:Arr, vely:Arr, lambda:Float, criteria:TermCriteria)
        load("calcOpticalFlowHS", 7)(prev.nativeObject, curr.nativeObject, usePrevious ? 1 : 0, velx.nativeObject, vely.nativeObject, lambda, criteria.nativeObject);
    @:CvProc function calcOpticalFlowLK(prev:Arr, curr:Arr, winSize:Size, velx:Arr, vely:Arr) {
        @:CvCheck if (winSize.width & (winSize.width + 1) != 0) throw "winSize.width must be power of 2, minus 1";
        @:CvCheck if (winSize.height & (winSize.height + 1) != 0) throw "winSize.height must be power of 2, minus 1";
        load("calcOpticalFlowLK", 5)(prev.nativeObject, curr.nativeObject, winSize.nativeObject, velx.nativeObject, vely.nativeObject);
    }

    // arrays currFeatures, status, and error will be resized as necessary by this call
    // to match the size of prevFeatures.
    @:CvProc function calcOpticalFlowPyrLK(prev:Arr, curr:Arr, prevPyr:Null<Arr>, currPyr:Null<Arr>, prevFeatures:Array<Point2D32f>, currFeatures:Array<Point2D32f>, winSize:Size, level:Int, status:Array<Bool>, error:Null<Array<Float>>, criteria:TermCriteria, flags:Int) {
        var currs = NativeBinding.mapNative(currFeatures);
        load("calcOpticalFlowPyrLK", 13)(prev.nativeObject, curr.nativeObject, NativeBinding.native(prevPyr), NativeBinding.native(currPyr), NativeBinding.mapNative(prevFeatures), currs, prevFeatures.length, winSize.nativeObject, level, status, error, criteria.nativeObject, flags);
        for (i in currFeatures.length...currs.length)
            currFeatures[i] = new Point2D32f(currs[i]);
    }
}
