package cv;

import #if cpp cpp #else neko #end.Lib;
import cv.core.*;
import cv.Core;

import cv.Macros;

class Video implements CvConsts implements CvProcs {
    @:allow(cv.video)
    static inline function load(n:String, p:Int=0):Dynamic
        return Lib.load("opencv", "hx_cv_video_"+n, p);

    @:CvProc function calcOpticalFlowBM(prev:Arr, curr:Arr, blockSize:Size, shiftSize:Size, max_range:Size, usePrevious:Bool, velx:Arr, vely:Arr)
        load("calcOpticalFlowBM", 8)(prev.nativeObject, curr.nativeObject, blockSize.nativeObject, shiftSize.nativeObject, max_range.nativeObject, usePrevious ? 1 : 0, velx.nativeObject, vely.nativeObject);
    @:CvProc function calcOpticalFlowHS(prev:Arr, curr:Arr, usePrevious:Bool, velx:Arr, vely:Arr, lambda:Float, criteria:TermCriteria)
        load("calcOpticalFlowHS", 7)(prev.nativeObject, curr.nativeObject, usePrevious ? 1 : 0, velx.nativeObject, vely.nativeObject, lambda, criteria.nativeObject);
    @:CvProc function calcOpticalFlowLK(prev:Arr, curr:Arr, winSize:Size, velx:Arr, vely:Arr) {
        @:CvCheck if (winSize.width & (winSize.width + 1) != 0) throw "winSize.width must be power of 2, minus 1";
        @:CvCheck if (winSize.height & (winSize.height + 1) != 0) throw "winSize.height must be power of 2, minus 1";
        load("calcOpticalFlowLK", 5)(prev.nativeObject, curr.nativeObject, winSize.nativeObject, velx.nativeObject, vely.nativeObject);
    }
}
