package cv;

import cv.Core;
import cv.core.Image;
import cv.core.Mat;
import cv.highgui.*;

import #if cpp cpp #else neko #end.Lib;

import cv.Macros;

class HighGUI implements CvConsts implements CvProcs {
    static inline function load(n:String, p:Int=0):Dynamic
        return Lib.load("opencv", "hx_cv_highgui_"+n, p);

    // -------------------------
    // Flags for window creation.
    // -------------------------
    @:CvConst var CV_WINDOW_NORMAL;
    @:CvConst var CV_WINDOW_AUTOSIZE;
    @:CvConst var CV_WINDOW_FREERATIO;
    @:CvConst var CV_WINDOW_KEEPRATIO;
    @:CvConst var CV_WINDOW_OPENGL;
    @:CvConst var CV_GUI_NORMAL;
    @:CvConst var CV_GUI_EXPANDED;

    // -------------------------
    // Event flags for mouse callbacks.
    // -------------------------
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

    // -------------------------
    // Modifier flags for mouse callbacks.
    // -------------------------
    @:CvConst var CV_EVENT_FLAG_LBUTTON;
    @:CvConst var CV_EVENT_FLAG_RBUTTON;
    @:CvConst var CV_EVENT_FLAG_MBUTTON;
    @:CvConst var CV_EVENT_FLAG_CTRLKEY;
    @:CvConst var CV_EVENT_FLAG_SHIFTKEY;
    @:CvConst var CV_EVENT_FLAG_ALTKEY;

    // ------------------------
    // Flags for image conversions.
    // ------------------------
    @:CvConst var CV_CVTIMG_FLIP;
    @:CvConst var CV_CVTIMG_SWAP_RB;

    // ------------------------
    // Image IO flags.
    // ------------------------
    @:CvConst var CV_LOAD_IMAGE_COLOR;
    @:CvConst var CV_LOAD_IMAGE_GRAYSCALE;
    @:CvConst var CV_LOAD_IMAGE_UNCHANGED;

    // -------------------------
    // Video/Camera capture properties flags.
    // -------------------------
    @:CvConst var CV_CAP_PROP_POS_MSEC;
    @:CvConst var CV_CAP_PROP_POS_FRAMES;
    @:CvConst var CV_CAP_PROP_POS_AVI_RATIO;
    @:CvConst var CV_CAP_PROP_FRAME_WIDTH;
    @:CvConst var CV_CAP_PROP_FRAME_HEIGHT;
    @:CvConst var CV_CAP_PROP_FPS;
    @:CvConst var CV_CAP_PROP_FRAME_COUNT;

    // -------------------------
    // Button Types
    // -------------------------
    @:CvConst var CV_PUSH_BUTTON;
    @:CvConst var CV_CHECKBOX;
    @:CvConst var CV_RADIOBOX;

    // -------------------------
    // System interaction.
    // -------------------------
    @:CvProc function initSystem(args:Array<String>):Int return load("initSystem", 2)(args.length, args);
    @:CvProc function waitKey(?delay:Int=0):Void;

    // -------------------------
    // Window management.
    // -------------------------
    @:CvProc(flags=CV_WINDOW_AUTOSIZE|CV_WINDOW_KEEPRATIO|CV_GUI_EXPANDED)
             function namedWindow(winname:String, ?flags:Null<Int>):Int;
    @:CvProc function destroyWindow(name:String):Void;
    @:CvProc function moveWindow   (name:String, x:Int, y:Int):Void;
    @:CvProc function resizeWindow (name:String, w:Int, h:Int):Void;

    @:CvProc function destroyAllWindows():Void;

    // -------------------------
    // Trackbar/Button management.
    // -------------------------
    @:CvProc function createTrackbar(trackbarName:String, ?windowName:Null<String>, value:Int, count:Int, ?onChange:Null<Int->Void>):Int;
    @:CvProc(buttonType=CV_PUSH_BUTTON) function createButton(buttonName:String, onChange:Int->Void, ?buttonType:Null<Int>, initialButtonState:Int=0):Int;
    @:CvProc function getTrackbarPos(trackbarName:String, ?windowName:Null<String>):Int;
    @:CvProc function setTrackbarPos(trackbarName:String, ?windowName:Null<String>, pos:Int):Void;

    // -------------------------
    // Mouse callbacks for windows.
    // OpenGL callbacks for windows.
    // -------------------------
    @:CvProc function setMouseCallback(windowName:String, onMouse:Int->Int->Int->Int->Void):Void;
    @:CvProc function setOpenGlDrawCallback(windowName:String, onDraw:Void->Void):Void;
    @:CvProc function setOpenGlContext(windowName:String):Void;
    @:CvProc function updateWindow(windowName:String):Void;

    // -------------------------
    // QT Extra Functions
    // -------------------------
    @:CvProc function displayOverlay(windowName:String, text:String, delayms:Int=0):Void;
    @:CvProc function displayStatusBar(windowName:String, text:String, delayms:Int=0):Void;


    // ------------------------
    // Image rendering.
    // ------------------------
    @:CvProc function convertImage(src:Arr, dst:Arr, flags:Int=0);
    @:CvProc function showImage   (windowName:String, image:Arr);

    // -------------------------
    // Image IO
    // -------------------------
    @:CvProc(iscolor=CV_LOAD_IMAGE_COLOR) function loadImage (filename:String, ?iscolor:Null<Int>):Null<Image>;
    @:CvProc(iscolor=CV_LOAD_IMAGE_COLOR) function loadImageM(filename:String, ?iscolor:Null<Int>):Null<Mat>;
    @:CvProc function saveImage(filename:String, image:Arr):Int;

    // -------------------------
    // Video/Camera capture IO.
    // -------------------------
    @:CvProc function captureFromFile(filename:String):Null<Capture>;

    @:CvProc function grabFrame    (capture:Capture):Int;
    @:CvProc function retrieveFrame(capture:Capture):Null<Image>;
    @:CvProc function queryFrame   (capture:Capture):Null<Image>;

    @:CvProc function getCaptureProperty(capture:Capture, property_id:Int):Float;
}
