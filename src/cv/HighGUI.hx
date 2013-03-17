package cv;

import cv.Core;
import cv.core.Image;
import cv.core.Mat;

import #if cpp cpp #else neko #end.Lib;

import cv.Macros;

typedef Capture = NativeBinding;

class HighGUI implements CvConsts implements CvProcs {
    static inline function load(n:String, p:Int=0):Dynamic
        return Lib.load("opencv", "hx_cv_highgui_"+n, p);

    @:CvConst var CV_WINDOW_NORMAL;
    @:CvConst var CV_WINDOW_AUTOSIZE;
    @:CvConst var CV_WINDOW_FREERATIO;
    @:CvConst var CV_WINDOW_KEEPRATIO;
    @:CvConst var CV_GUI_NORMAL;
    @:CvConst var CV_GUI_EXPANDED;


    @:CvConst var CV_EVENT_MOUSEMOVE;
    @:CvConst var CV_EVENT_LBUTTONDOWN;
    @:CvConst var CV_EVENT_RBUTTONDOWN;
    @:CvConst var CV_EVENT_MBUTTONDOWN;
    @:CvConst var CV_EVENT_LBUTTONUP;
    @:CvConst var CV_EVENT_RBUTTONUP;
    @:CvConst var CV_EVENT_MBUTTONUP;
    @:CvConst var CV_EVENT_LBUTTONDBLCLK;
    @:CvConst var CV_EVENT_RBUTTONDBLCLK;
    @:CvConst var CV_EVENT_MBUTTONDBLCLK;


    @:CvConst var CV_EVENT_FLAG_LBUTTON;
    @:CvConst var CV_EVENT_FLAG_RBUTTON;
    @:CvConst var CV_EVENT_FLAG_MBUTTON;
    @:CvConst var CV_EVENT_FLAG_CTRLKEY;
    @:CvConst var CV_EVENT_FLAG_SHIFTKEY;
    @:CvConst var CV_EVENT_FLAG_ALTKEY;


    @:CvProc function initSystem(args:Array<String>):Int
        return load("initSystem", 2)(args.length, args);
    @:CvProc function waitKey(?delay:Int)
        load("waitKey", 1)(delay == null ? 0 : delay);


    @:CvProc function namedWindow(winname:String, ?flags:Null<Int>):Int {
        if (flags == null) flags = CV_WINDOW_AUTOSIZE | CV_WINDOW_KEEPRATIO | CV_GUI_EXPANDED;
        return load("namedWindow", 2)(winname, flags);
    }
    @:CvProc function destroyWindow(name:String)
        load("destroyWindow", 1)(name);
    @:CvProc function destroyAllWindows()
        load("destroyAllWindows", 0)();
    @:CvProc function moveWindow(name:String, x:Int, y:Int)
        load("moveWindow", 3)(name, x, y);
    @:CvProc function resizeWindow(name:String, width:Int, height:Int)
         load("resizeWindow", 3)(name, width, height);



    @:CvProc function createTrackbar(trackbarName:String, ?windowName:Null<String>, value:Int, count:Int, ?onChange:Null<Int->Void>):Int
        return load("createTrackbar", 5)(trackbarName, windowName, value, count, onChange);
    @:CvProc function getTrackbarPos(trackbarName:String, ?windowName:Null<String>):Int
        return load("getTrackbarPos", 2)(trackbarName, windowName);
    @:CvProc function setTrackbarPos(trackbarName:String, ?windowName:Null<String>, pos:Int)
        load("setTrackbarPos", 3)(trackbarName, windowName, pos);


    @:CvProc function setMouseCallback(windowName:String, onMouse:Int->Int->Int->Int->Void)
        load("setMouseCallback", 2)(windowName, onMouse);


    @:CvConst var CV_CVTIMG_FLIP;
    @:CvConst var CV_CVTIMG_SWAP_RB;


    @:CvProc function convertImage(src:Arr, dst:Arr, flags:Int=0)
        load("convertImage", 3)(src.nativeObject, dst.nativeObject, flags);
    @:CvProc function showImage(windowName:String, image:Arr)
        load("showImage", 2)(windowName, image.nativeObject);


    @:CvConst var CV_LOAD_IMAGE_COLOR;
    @:CvConst var CV_LOAD_IMAGE_GRAYSCALE;
    @:CvConst var CV_LOAD_IMAGE_UNCHANGED;


    @:CvProc function loadImage(filename:String, ?iscolor:Null<Int>):Null<Image> {
        if (iscolor == null) iscolor = CV_LOAD_IMAGE_COLOR;
        return Image.cvt(load("loadImage", 2)(filename, iscolor));
    }
    @:CvProc function loadImageM(filename:String, ?iscolor:Null<Int>):Null<Mat> {
        if (iscolor == null) iscolor = CV_LOAD_IMAGE_COLOR;
        return Mat.cvt(load("loadImageM", 2)(filename, iscolor));
    }
    @:CvProc function saveImage(filename:String, image:Arr):Int
        return load("saveImage", 2)(filename, image.nativeObject);


    @:CvConst var CV_CAP_PROP_POS_MSEC;
    @:CvConst var CV_CAP_PROP_POS_FRAMES;
    @:CvConst var CV_CAP_PROP_POS_AVI_RATIO;
    @:CvConst var CV_CAP_PROP_FRAME_WIDTH;
    @:CvConst var CV_CAP_PROP_FRAME_HEIGHT;
    @:CvConst var CV_CAP_PROP_FPS;
    @:CvConst var CV_CAP_PROP_FRAME_COUNT;


    @:CvProc function captureFromFile(filename:String):Null<Capture>
        return Capture.generic(load("captureFromFile", 1)(filename));
    @:CvProc function getCaptureProperty(capture:Capture, property_id:Int):Float
        return load("getCaptureProperty", 2)(capture.nativeObject, property_id);
    @:CvProc function grabFrame(capture:Capture):Int
        return load("grabFrame", 1)(capture.nativeObject);
    @:CvProc function retrieveFrame(capture:Capture):Null<Image>
        return Image.cvt(load("retrieveFrame", 1)(capture.nativeObject));
    @:CvProc function queryFrame(capture:Capture):Null<Image>
        return Image.cvt(load("queryFrame", 1)(capture.nativeObject));
}
