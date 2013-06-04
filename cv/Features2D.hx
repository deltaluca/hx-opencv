package cv;

import #if cpp cpp #else neko #end.Lib;
import cv.core.*;
import cv.Core;
import cv.features2d.*;

import cv.Macros;

class Features2D implements CvProcs {
    @:allow(cv.features2d)
    static inline function load(n:String, p:Int=0):Dynamic
        return Lib.load("opencv", "hx_cv_features2d_"+n, p);

    // -------------------------
    // BRISK
    // -------------------------
    // Differs from C++ API with non-constructor being used.
    @:CvProc(BRISK) function brisk(thresh:Int=30, octaves:Int=3, patternScale:Float=1.0):BRISK;

    @:CvProc(GFFT) function gfft(maxCorners:Int, qualityLevel:Float, minDistance:Float, blockSize:Int=3, useHarris:Bool=false, k:Float=0.04):GFFT;
}
