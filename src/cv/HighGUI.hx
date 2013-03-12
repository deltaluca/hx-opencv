package cv;

import cv.Core;
import cv.core.Image;
import cv.core.Mat;

import #if cpp cpp #else neko #end.Lib;

class HighGUI {
    static inline function load(n:String, p:Int=0):Dynamic {
        return Lib.load("opencv", "hx_cv_highgui_"+n, p);
    }

    public static var CV_WINDOW_NORMAL   (get, never):Int; static inline function get_CV_WINDOW_NORMAL   () return load("CV_WINDOW_NORMAL")   ();
    public static var CV_WINDOW_AUTOSIZE (get, never):Int; static inline function get_CV_WINDOW_AUTOSIZE () return load("CV_WINDOW_AUTOSIZE") ();
    public static var CV_WINDOW_FREERATIO(get, never):Int; static inline function get_CV_WINDOW_FREERATIO() return load("CV_WINDOW_FREERATIO")();
    public static var CV_WINDOW_KEEPRATIO(get, never):Int; static inline function get_CV_WINDOW_KEEPRATIO() return load("CV_WINDOW_KEEPRATIO")();
    public static var CV_GUI_NORMAL      (get, never):Int; static inline function get_CV_GUI_NORMAL      () return load("CV_GUI_NORMAL")      ();
    public static var CV_GUI_EXPANDED    (get, never):Int; static inline function get_CV_GUI_EXPANDED    () return load("CV_GUI_EXPANDED")    ();



    public static var CV_EVENT_MOUSEMOVE    (get, never):Int; static inline function get_CV_EVENT_MOUSEMOVE    () return load("CV_EVENT_MOUSEMOVE")    ();
    public static var CV_EVENT_LBUTTONDOWN  (get, never):Int; static inline function get_CV_EVENT_LBUTTONDOWN  () return load("CV_EVENT_LBUTTONDOWN")  ();
    public static var CV_EVENT_RBUTTONDOWN  (get, never):Int; static inline function get_CV_EVENT_RBUTTONDOWN  () return load("CV_EVENT_RBUTTONDOWN")  ();
    public static var CV_EVENT_MBUTTONDOWN  (get, never):Int; static inline function get_CV_EVENT_MBUTTONDOWN  () return load("CV_EVENT_MBUTTONDOWN")  ();
    public static var CV_EVENT_LBUTTONUP    (get, never):Int; static inline function get_CV_EVENT_LBUTTONUP    () return load("CV_EVENT_LBUTTONUP")    ();
    public static var CV_EVENT_RBUTTONUP    (get, never):Int; static inline function get_CV_EVENT_RBUTTONUP    () return load("CV_EVENT_RBUTTONUP")    ();
    public static var CV_EVENT_MBUTTONUP    (get, never):Int; static inline function get_CV_EVENT_MBUTTONUP    () return load("CV_EVENT_MBUTTONUP")    ();
    public static var CV_EVENT_LBUTTONDBLCLK(get, never):Int; static inline function get_CV_EVENT_LBUTTONDBLCLK() return load("CV_EVENT_LBUTTONDBLCLK")();
    public static var CV_EVENT_RBUTTONDBLCLK(get, never):Int; static inline function get_CV_EVENT_RBUTTONDBLCLK() return load("CV_EVENT_RBUTTONDBLCLK")();
    public static var CV_EVENT_MBUTTONDBLCLK(get, never):Int; static inline function get_CV_EVENT_MBUTTONDBLCLK() return load("CV_EVENT_MBUTTONDBLCLK")();



    public static var CV_EVENT_FLAG_LBUTTON (get, never):Int; static inline function get_CV_EVENT_FLAG_LBUTTON () return load("CV_EVENT_FLAG_LBUTTON") ();
    public static var CV_EVENT_FLAG_RBUTTON (get, never):Int; static inline function get_CV_EVENT_FLAG_RBUTTON () return load("CV_EVENT_FLAG_RBUTTON") ();
    public static var CV_EVENT_FLAG_MBUTTON (get, never):Int; static inline function get_CV_EVENT_FLAG_MBUTTON () return load("CV_EVENT_FLAG_MBUTTON") ();
    public static var CV_EVENT_FLAG_CTRLKEY (get, never):Int; static inline function get_CV_EVENT_FLAG_CTRLKEY () return load("CV_EVENT_FLAG_CTRLKEY") ();
    public static var CV_EVENT_FLAG_SHIFTKEY(get, never):Int; static inline function get_CV_EVENT_FLAG_SHIFTKEY() return load("CV_EVENT_FLAG_SHIFTKEY")();
    public static var CV_EVENT_FLAG_ALTKEY  (get, never):Int; static inline function get_CV_EVENT_FLAG_ALTKEY  () return load("CV_EVENT_FLAG_ALTKEY")  ();



    public static inline function initSystem(args:Array<String>):Int {
        #if debug
            if (args == null) throw "initSystem :: args cannot be null";
        #end
        return load("initSystem", 2)(args.length, args);
    }
    public static inline function waitKey(?delay:Int) {
        if (delay == null) delay = 0;
        load("waitKey", 1)(delay);
    }



    public static inline function namedWindow(winname:String, ?flags:Null<Int>):Int {
        #if debug
            if (winname == null) throw "namedWindow :: winname cannot be null";
        #end
        if (flags == null) flags = CV_WINDOW_AUTOSIZE | CV_WINDOW_KEEPRATIO | CV_GUI_EXPANDED;
        return load("namedWindow", 2)(winname, flags);
    }
    public static inline function destroyWindow(name:String) {
        #if debug
            if (name == null) throw "destroyWindow :: name cannot be null";
        #end
        return load("destroyWindow", 1)(name);
    }
    public static inline function destroyAllWindows() {
        return load("destroyAllWindows", 0)();
    }
    public static inline function moveWindow(name:String, x:Int, y:Int) {
        #if debug
            if (name == null) throw "moveWindow :: name cannot be null";
        #end
        return load("moveWindow", 3)(name, x, y);
    }
    public static inline function resizeWindow(name:String, width:Int, height:Int) {
        #if debug
            if (name == null) throw "resizeWindow :: name cannot be null";
        #end
        return load("resizeWindow", 3)(name, width, height);
    }



    public static inline function createTrackbar(trackbarName:String, ?windowName:Null<String>, value:Int, count:Int, ?onChange:Null<Int->Void>):Int {
        #if debug
            if (trackbarName == null) throw "createTrackbar :: trackbarName cannot be null";
        #end
        return load("createTrackbar", 5)(trackbarName, windowName, value, count, onChange);
    }
    public static inline function getTrackbarPos(trackbarName:String, ?windowName:Null<String>):Int {
        #if debug
            if (trackbarName == null) throw "getTrackbarPos :: trackbarName cannot be null";
        #end
        return load("getTrackbarPos", 2)(trackbarName, windowName);
    }
    public static inline function setTrackbarPos(trackbarName:String, ?windowName:Null<String>, pos:Int) {
        #if debug
            if (trackbarName == null) throw "setTrackbarPos :: trackbarName cannot be null";
        #end
        load("setTrackbarPos", 3)(trackbarName, windowName, pos);
    }



    public static inline function setMouseCallback(windowName:String, onMouse:Int->Int->Int->Int->Void) {
        #if debug
            if (windowName == null) throw "setMouseCallback :: windowName cannot be null";
        #end
        load("setMouseCallback", 2)(windowName, onMouse);
    }



    public static var CV_CVTIMG_FLIP   (get, never):Int; static inline function get_CV_CVTIMG_FLIP   () return load("CV_CVTIMG_FLIP")   ();
    public static var CV_CVTIMG_SWAP_RB(get, never):Int; static inline function get_CV_CVTIMG_SWAP_RB() return load("CV_CVTIMG_SWAP_RB")();



    public static inline function convertImage(src:Arr, dst:Arr, flags:Int=0) {
        #if debug
            if (src == null) throw "convertImage :: src cannot be null";
            if (dst == null) throw "convertImage :: dst cannot be null";
        #end
        load("convertImage", 3)(src.nativeObject, dst.nativeObject, flags);
    }
    public static inline function showImage(windowName:String, image:Arr) {
        #if debug
            if (windowName == null) throw "showImage :: windowName cannot be null";
            if (image      == null) throw "showImage :: image cannot be null";
        #end
        load("showImage", 2)(windowName, image.nativeObject);
    }



    public static var CV_LOAD_IMAGE_COLOR    (get, never):Int; static inline function get_CV_LOAD_IMAGE_COLOR    () return load("CV_LOAD_IMAGE_COLOR")    ();
    public static var CV_LOAD_IMAGE_GRAYSCALE(get, never):Int; static inline function get_CV_LOAD_IMAGE_GRAYSCALE() return load("CV_LOAD_IMAGE_GRAYSCALE")();
    public static var CV_LOAD_IMAGE_UNCHANGED(get, never):Int; static inline function get_CV_LOAD_IMAGE_UNCHANGED() return load("CV_LOAD_IMAGE_UNCHANGED")();



    public static inline function loadImage(filename:String, ?iscolor:Null<Int>):Null<Image> {
        #if debug
            if (filename == null) throw "loadImage :: filename cannot be null";
        #end
        if (iscolor == null) iscolor = CV_LOAD_IMAGE_COLOR;
        return Image.cvt(load("loadImage", 2)(filename, iscolor));
    }
    public static inline function loadImageM(filename:String, ?iscolor:Null<Int>):Null<Mat> {
        #if debug
            if (filename == null) throw "loadImageM :: filename cannot be null";
        #end
        if (iscolor == null) iscolor = CV_LOAD_IMAGE_COLOR;
        return Mat.cvt(load("loadImageM", 2)(filename, iscolor));
    }
    public static inline function saveImage(filename:String, image:Arr):Int {
        #if debug
            if (filename == null) throw "saveImage :: filename cannot be null";
            if (image    == null) throw "saveImage :: image cannot be null";
        #end
        return load("saveImage", 2)(filename, image.nativeObject);
    }
}
