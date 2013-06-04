package cv;

import cv.Core;
import cv.core.Image;
import cv.core.Mat;
import cv.highgui.*;

import #if cpp cpp #else neko #end.Lib;

import cv.Macros;

class HighGUI implements CvProcs {
    static inline function load(n:String, p:Int=0):Dynamic
        return Lib.load("opencv", "hx_cv_highgui_"+n, p);

    // -------------------------
    // Flags for window creation.
    // -------------------------
    public static inline var WINDOW_NORMAL     = 0x000;
    public static inline var WINDOW_AUTOSIZE   = 0x001;

    public static inline var WINDOW_FULLSCREEN = 0x001;
    public static inline var WINDOW_FREERATIO  = 0x100;
    public static inline var WINDOW_KEEPRATIO  = 0x000;

    public static inline var GUI_NORMAL        = 0x010;
    public static inline var GUI_EXPANDED      = 0x000;

    // -------------------------
    // Event flags for mouse callbacks.
    // -------------------------
    public static inline var EVENT_MOUSEMOVE     = 0;
    public static inline var EVENT_LBUTTONDOWN   = 1;
    public static inline var EVENT_RBUTTONDOWN   = 2;
    public static inline var EVENT_MBUTTONDOWN   = 3;
    public static inline var EVENT_LBUTTONUP     = 4;
    public static inline var EVENT_RBUTTONUP     = 5;
    public static inline var EVENT_MBUTTONUP     = 6;
    public static inline var EVENT_LBUTTONDBLCLK = 7;
    public static inline var EVENT_RBUTTONDBLCLK = 8;
    public static inline var EVENT_MBUTTONDBLCLK = 9;

    // -------------------------
    // Modifier flags for mouse callbacks.
    // -------------------------
    public static inline var EVENT_FLAG_LBUTTON  = 1;
    public static inline var EVENT_FLAG_RBUTTON  = 2;
    public static inline var EVENT_FLAG_MBUTTON  = 4;
    public static inline var EVENT_FLAG_CTRLKEY  = 8;
    public static inline var EVENT_FLAG_SHIFTKEY = 16;
    public static inline var EVENT_FLAG_ALTKEY   = 32;

    // ------------------------
    // Flags for image conversions.
    // ------------------------
    public static inline var CVTIMG_FLIP    = 1;
    public static inline var CVTIMG_SWAP_RB = 2;

    // ------------------------
    // Image IO flags.
    // ------------------------
    public static inline var LOAD_IMAGE_UNCHANGED = -1;
    public static inline var LOAD_IMAGE_GRAYSCALE = 0;
    public static inline var LOAD_IMAGE_COLOR     = 1;
    public static inline var LOAD_IMAGE_ANYDEPTH  = 2;
    public static inline var LOAD_IMAGE_ANYCOLOR  = 4;

    // -------------------------
    // Video/Camera capture properties flags.
    // -------------------------
    public static inline var CAP_PROP_DC1394_OFF                = -4;
    public static inline var CAP_PROP_DC1394_MODE_MANUAL        = -3;
    public static inline var CAP_PROP_DC1394_MODE_AUTO          = -2;
    public static inline var CAP_PROP_DC1394_MODE_ONE_PUSH_AUTO = -1;
    public static inline var CAP_PROP_POS_MSEC                  = 0;
    public static inline var CAP_PROP_POS_FRAMES                = 1;
    public static inline var CAP_PROP_POS_AVI_RATIO             = 2;
    public static inline var CAP_PROP_FRAME_WIDTH               = 3;
    public static inline var CAP_PROP_FRAME_HEIGHT              = 4;
    public static inline var CAP_PROP_FPS                       = 5;
    public static inline var CAP_PROP_FOURCC                    = 6;
    public static inline var CAP_PROP_FRAME_COUNT               = 7;
    public static inline var CAP_PROP_FORMAT                    = 8;
    public static inline var CAP_PROP_MODE                      = 9;
    public static inline var CAP_PROP_BRIGHTNESS                = 10;
    public static inline var CAP_PROP_CONTRAST                  = 11;
    public static inline var CAP_PROP_SATURATION                = 12;
    public static inline var CAP_PROP_HUE                       = 13;
    public static inline var CAP_PROP_GAIN                      = 14;
    public static inline var CAP_PROP_EXPOSURE                  = 15;
    public static inline var CAP_PROP_CONVERT_RGB               = 16;
    public static inline var CAP_PROP_WHITE_BALANCE_BLUE_U      = 17;
    public static inline var CAP_PROP_RECTIFICATION             = 18;
    public static inline var CAP_PROP_MONOCROME                 = 19;
    public static inline var CAP_PROP_SHARPNESS                 = 20;
    public static inline var CAP_PROP_AUTO_EXPOSURE             = 21;
    public static inline var CAP_PROP_GAMMA                     = 22;
    public static inline var CAP_PROP_TEMPERATURE               = 23;
    public static inline var CAP_PROP_TRIGGER                   = 24;
    public static inline var CAP_PROP_TRIGGER_DELAY             = 25;
    public static inline var CAP_PROP_WHITE_BALANCE_RED_V       = 26;
    public static inline var CAP_PROP_MAX_DC1394                = 27;
    public static inline var CAP_PROP_AUTOGRAB                  = 1024;
    public static inline var CAP_PROP_SUPPORTED_PREVIEW_SIZES_STRING = 1025;
    public static inline var CAP_PROP_PREVIEW_FORMAT           = 1026;
    public static inline var CAP_OPENNI_DEPTH_GENERATOR        = 0;
    public static inline var CAP_OPENNI_IMAGE_GENERATOR        = 1 << 31;
    public static inline var CAP_OPENNI_GENERATORS_MASK        = 1 << 31;
    public static inline var CAP_PROP_OPENNI_OUTPUT_MODE       = 100;
    public static inline var CAP_PROP_OPENNI_FRAME_MAX_DEPTH   = 101;
    public static inline var CAP_PROP_OPENNI_BASELINE          = 102;
    public static inline var CAP_PROP_OPENNI_FOCAL_LENGTH      = 103;
    public static inline var CAP_PROP_OPENNI_REGISTRATION_ON   = 104;
    public static inline var CAP_PROP_OPENNI_REGISTRATION      = CAP_PROP_OPENNI_REGISTRATION_ON;
    public static inline var CAP_OPENNI_IMAGE_GENERATOR_OUTPUT_MODE = CAP_OPENNI_IMAGE_GENERATOR + CAP_PROP_OPENNI_OUTPUT_MODE;
    public static inline var CAP_OPENNI_DEPTH_GENERATOR_BASELINE = CAP_OPENNI_DEPTH_GENERATOR + CAP_PROP_OPENNI_BASELINE;
    public static inline var CAP_OPENNI_DEPTH_GENERATOR_FOCAL_LENGTH = CAP_OPENNI_DEPTH_GENERATOR + CAP_PROP_OPENNI_FOCAL_LENGTH;
    public static inline var CAP_OPENNI_DEPTH_GENERATOR_REGISTRATION_ON = CAP_OPENNI_DEPTH_GENERATOR + CAP_PROP_OPENNI_REGISTRATION_ON;
    public static inline var CAP_GSTREAMER_QUEUE_LENGTH   = 200;
    public static inline var CAP_PROP_PVAPI_MULTICASTIP   = 300;
    public static inline var CAP_PROP_XI_DOWNSAMPLING     = 400;
    public static inline var CAP_PROP_XI_DATA_FORMAT      = 401;
    public static inline var CAP_PROP_XI_OFFSET_X         = 402;
    public static inline var CAP_PROP_XI_OFFSET_Y         = 403;
    public static inline var CAP_PROP_XI_TRG_SOURCE       = 404;
    public static inline var CAP_PROP_XI_TRG_SOFTWARE     = 405;
    public static inline var CAP_PROP_XI_GPI_SELECTOR     = 406;
    public static inline var CAP_PROP_XI_GPI_MODE         = 407;
    public static inline var CAP_PROP_XI_GPI_LEVEL        = 408;
    public static inline var CAP_PROP_XI_GPO_SELECTOR     = 409;
    public static inline var CAP_PROP_XI_GPO_MODE         = 410;
    public static inline var CAP_PROP_XI_LED_SELECTOR     = 411;
    public static inline var CAP_PROP_XI_LED_MODE         = 412;
    public static inline var CAP_PROP_XI_MANUAL_WB        = 413;
    public static inline var CAP_PROP_XI_AUTO_WB          = 414;
    public static inline var CAP_PROP_XI_AEAG             = 415;
    public static inline var CAP_PROP_XI_EXP_PRIORITY     = 416;
    public static inline var CAP_PROP_XI_AE_MAX_LIMIT     = 417;
    public static inline var CAP_PROP_XI_AG_MAX_LIMIT     = 418;
    public static inline var CAP_PROP_XI_AEAG_LEVEL       = 419;
    public static inline var CAP_PROP_XI_TIMEOUT          = 420;

    // -------------------------
    // Button Types
    // -------------------------
    public static inline var PUSH_BUTTON = 0;
    public static inline var CHECKBOX    = 1;
    public static inline var RADIOBOX    = 2;

    // -------------------------
    // System interaction.
    // -------------------------
    @:CvProc function initSystem(args:Array<String>):Int return load("initSystem", 2)(args.length, args);
    @:CvProc function waitKey(?delay:Int=0):Void;

    // -------------------------
    // Window management.
    // -------------------------
    @:CvProc(flags=WINDOW_AUTOSIZE|WINDOW_KEEPRATIO|GUI_EXPANDED)
             function namedWindow(winname:String, ?flags:Null<Int>):Int;
    @:CvProc function destroyWindow(name:String):Void;
    @:CvProc function moveWindow   (name:String, x:Int, y:Int):Void;
    @:CvProc function resizeWindow (name:String, w:Int, h:Int):Void;

    @:CvProc function destroyAllWindows():Void;

    // -------------------------
    // Trackbar/Button management.
    // -------------------------
    @:CvProc function createTrackbar(trackbarName:String, ?windowName:Null<String>, value:Int, count:Int, ?onChange:Null<Int->Void>):Int;
    @:CvProc(buttonType=PUSH_BUTTON) function createButton(buttonName:String, onChange:Int->Void, ?buttonType:Null<Int>, initialButtonState:Int=0):Int;
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
    @:CvProc(iscolor=LOAD_IMAGE_COLOR) function loadImage (filename:String, ?iscolor:Null<Int>):Null<Image>;
    @:CvProc(iscolor=LOAD_IMAGE_COLOR) function loadImageM(filename:String, ?iscolor:Null<Int>):Null<Mat>;
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
