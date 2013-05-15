package cv;

import #if cpp cpp #else neko #end.Lib;
import cv.core.*;
import cv.Core;
import cv.nonfree.*;

import cv.Macros;

class NonFree implements CvConsts implements CvProcs {
    @:allow(cv.nonfree)
    static inline function load(n:String, p:Int=0):Dynamic
        return Lib.load("opencv", "hx_cv_nonfree_"+n, p);


    // -------------------------
    // SURF/SIFT
    // -------------------------
    // Differs from C++-API with non-constructor being used.
    @:CvProc(SURF) function surf(hessianThreshold:Float, nOctaves:Int=4, nOctaveLayers:Int=2, extended:Bool=true, upright:Bool=false):SURF {
        var ret = SURF.cvt(load("SURF", 5)(hessianThreshold, nOctaves, nOctaveLayers, extended, upright));
        ret.extended = extended;
        return ret;
    }
    @:CvProc(SIFT) function sift(nFeatures:Int=0, nOctaveLayers:Int=3, constrastThreshold:Float=0.04, edgeThreshold:Float=10, sigma:Float=1.6):SIFT;
}
