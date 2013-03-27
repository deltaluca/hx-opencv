package cv.features2d;

import cv.Core.Arr;
import cv.features2d.KeyPoint;

class BRISK extends NativeBinding {
    @:allow(cv)
    function new(nativeObject:Dynamic) {
        super(nativeObject);
    }
    @:allow(cv)
    static inline function cvt(x:Dynamic):Null<BRISK> {
        return if (x == null) null else new BRISK(x);
    }


    // change of api on return value.
    @:CvProc public inline function detect(img:Arr, mask:Null<Arr>, keypoints:Array<KeyPoint>, ?descriptors:Null<Array<Float>>, useProvidedKeypoints:Bool=false):Int {
        var points = NativeBinding.mapNative(keypoints);
        var ret = Features2D.load("BRISK_detect", 6)(this.nativeObject, img.nativeObject, NativeBinding.native(mask), points, descriptors, useProvidedKeypoints);
        for (i in keypoints.length...points.length) keypoints[i] = new KeyPoint(points[i]);
        return ret;
    }


    public inline function toString() {
        return '{BRISK}';
    }
}
