#include <highgui/highgui_c.h>

#include "highgui.h"
#include "core.h"
#include "utils.h"

#include <vector>
#include <map>
#include <string>

typedef std::vector<AutoGCRoot*> WindowRoots;
typedef std::map<std::string, WindowRoots> WindowCleanup;

WindowCleanup cleanup;
void cleanup_window(const std::string& wname) {
    WindowRoots& roots = cleanup[wname];
    while (!roots.empty()) {
        delete roots.back();
        roots.pop_back();
    }
}
void add_cleanup(value wname, AutoGCRoot* root) {
    if (val_is_null(wname)) cleanup["!!control_panel!!"].push_back(root);
    else cleanup[val_get<string>(wname)].push_back(root);
}



//
// cvInitSystem
// cvWaitKey
//
value hx_cv_highgui_initSystem(value argc, value argv) {
    val_check(argv, array);
    int size = val_array_size(argv);
    char** _argv = new char*[size];
    for (int i = 0; i < size; i++) _argv[i] = val_dup_string(val_array_i(argv, i));
    int ret = cvInitSystem(val_get<int>(argc), _argv);
    delete[] _argv;
    return alloc<int>(ret);
}
value hx_cv_highgui_waitKey(value delay) {
    cvWaitKey(val_get<int>(delay));
    return val_null;
}
DEFINE_PRIM(hx_cv_highgui_initSystem, 2);
DEFINE_PRIM(hx_cv_highgui_waitKey,    1);



//
// cvNamedWindow
// cvDestroyWindow
// cvDestroyAllWindows
// cvMoveWindow
// cvResizeWindow
//
value hx_cv_highgui_namedWindow(value winname, value flags) {
    return alloc<int>(cvNamedWindow(val_get<string>(winname), val_get<int>(flags)));
}
value hx_cv_highgui_destroyWindow(value name) {
    cvDestroyWindow(val_get<string>(name));
    cleanup_window(val_get<string>(name));
    return val_null;
}
value hx_cv_highgui_destroyAllWindows() {
    cvDestroyAllWindows();
    for (WindowCleanup::iterator i = cleanup.begin(); i != cleanup.end(); i++) {
        cleanup_window(i->first);
    }
    return val_null;
}
value hx_cv_highgui_moveWindow(value name, value x, value y) {
    cvMoveWindow(val_get<string>(name), val_get<int>(x), val_get<int>(y));
    return val_null;
}
value hx_cv_highgui_resizeWindow(value name, value width, value height) {
    cvResizeWindow(val_get<string>(name), val_get<int>(width), val_get<int>(height));
    return val_null;
}
DEFINE_PRIM(hx_cv_highgui_namedWindow,       2);
DEFINE_PRIM(hx_cv_highgui_destroyWindow,     1);
DEFINE_PRIM(hx_cv_highgui_destroyAllWindows, 0);
DEFINE_PRIM(hx_cv_highgui_moveWindow,        3);
DEFINE_PRIM(hx_cv_highgui_resizeWindow,      3);



//
// cvCreateTrackbar
// cvCreateButton
// cvGetTrackbarPos
// cvSetTrackbarPos
//
void bound_onChanged(int pos, void* onChange) {
    if (onChange == NULL) return;
    val_call1((value)onChange, alloc<int>(pos));
}
static int hx_cv_highgui_trackbar_value;
value hx_cv_highgui_createTrackbar(value trackbarName, value windowName, value _value, value count, value onChange) {
    if (!val_is_null(onChange)) val_check_function(onChange, 1);

    int* val = &hx_cv_highgui_trackbar_value;
    *val = val_get<int>(_value);

    add_cleanup(windowName, new AutoGCRoot(onChange));

    if (val_is_null(onChange)) {
        return alloc<int>(cvCreateTrackbar(val_get<string>(trackbarName), safe_val_string(windowName), val, val_get<int>(count)));
    }
    else {
        return alloc<int>(cvCreateTrackbar2(val_get<string>(trackbarName), safe_val_string(windowName), val, val_get<int>(count), bound_onChanged, onChange));
    }
}
void bound_onButtonChanged(int state, void* onChange) {
    if (onChange == NULL) return;
    val_call1((value)onChange, alloc<int>(state));
}
value hx_cv_highgui_createButton(value buttonName, value onChange, value buttonType, value initialState) {
    add_cleanup(val_null, new AutoGCRoot(onChange));
    return alloc<int>(cvCreateButton(val_get<string>(buttonName), bound_onButtonChanged, onChange, val_get<int>(buttonType), val_get<int>(initialState)));
}
value hx_cv_highgui_getTrackbarPos(value trackbarName, value windowName) {
    return alloc_int(cvGetTrackbarPos(val_get<string>(trackbarName), safe_val_string(windowName)));
}
value hx_cv_highgui_setTrackbarPos(value trackbarName, value windowName, value pos) {
    cvSetTrackbarPos(val_get<string>(trackbarName), safe_val_string(windowName), val_get<int>(pos));
    return val_null;
}
DEFINE_PRIM(hx_cv_highgui_createTrackbar, 5);
DEFINE_PRIM(hx_cv_highgui_createButton,   4);
DEFINE_PRIM(hx_cv_highgui_getTrackbarPos, 2);
DEFINE_PRIM(hx_cv_highgui_setTrackbarPos, 3);



//
// cvSetMouseCallback
// cvSetOpenGlContext
// cvSetOpenGLDrawCallback
// cvUpdateWindow
//
void bound_onMouse(int event, int x, int y, int flags, void* onMouse) {
    if (onMouse == NULL) return;
    value args[4] = {alloc<int>(event), alloc<int>(x), alloc<int>(y), alloc<int>(flags)};
    val_callN((value)onMouse, args, 4);
}
value hx_cv_highgui_setMouseCallback(value windowName, value onMouse) {
    val_check_function(onMouse, 4);
    add_cleanup(windowName, new AutoGCRoot(onMouse));
    cvSetMouseCallback(val_get<string>(windowName), bound_onMouse, onMouse);
    return val_null;
}
void bound_onDraw(void* onDraw) {
    if (onDraw == NULL) return;
    val_call0((value)onDraw);
}
value hx_cv_highgui_setOpenGlDrawCallback(value window, value onDraw) {
    val_check_function(onDraw, 0);
    add_cleanup(window, new AutoGCRoot(onDraw));
    cvSetOpenGlDrawCallback(val_get<string>(window), bound_onDraw, onDraw);
    return val_null;
}
value hx_cv_highgui_setOpenGlContext(value window) {
    cvSetOpenGlContext(val_get<string>(window));
    return val_null;
}
value hx_cv_highgui_updateWindow(value window) {
    cvUpdateWindow(val_get<string>(window));
    return val_null;
}
DEFINE_PRIM(hx_cv_highgui_setMouseCallback,      2);
DEFINE_PRIM(hx_cv_highgui_setOpenGlDrawCallback, 2);
DEFINE_PRIM(hx_cv_highgui_setOpenGlContext,      1);
DEFINE_PRIM(hx_cv_highgui_updateWindow,          1);



//
// cvDisplayOverlay
// cvDisplayStatusBar
//
value hx_cv_highgui_displayOverlay(value name, value text, value delayms) {
    cvDisplayOverlay(val_get<string>(name), val_get<string>(text), val_get<int>(delayms));
    return val_null;
}
value hx_cv_highgui_displayStatusBar(value name, value text, value delayms) {
    cvDisplayStatusBar(val_get<string>(name), val_get<string>(text), val_get<int>(delayms));
    return val_null;
}
DEFINE_PRIM(hx_cv_highgui_displayOverlay,   3);
DEFINE_PRIM(hx_cv_highgui_displayStatusBar, 3);



//
// cvConvertImage
// cvShowImage
//
value hx_cv_highgui_convertImage(value src, value dst, value flags) {
    cvConvertImage(val_data(src), val_data(dst), val_get<int>(flags));
    return val_null;
}
value hx_cv_highgui_showImage(value windowName, value image) {
    cvShowImage(val_get<string>(windowName), val_data(image));
    return val_null;
}
DEFINE_PRIM(hx_cv_highgui_convertImage, 3);
DEFINE_PRIM(hx_cv_highgui_showImage,    2);



//
// cvLoadImage
// cvLoadImageM
// cvSaveImage
//
value hx_cv_highgui_loadImage(value filename, value iscolor) {
    return CONVERT(core, Image, cvLoadImage(val_get<string>(filename), val_get<int>(iscolor)));
}
value hx_cv_highgui_loadImageM(value filename, value iscolor) {
    return CONVERT(core, Mat, cvLoadImageM(val_get<string>(filename), val_get<int>(iscolor)));
}
value hx_cv_highgui_saveImage(value filename, value image) {
    return alloc<int>(cvSaveImage(val_get<string>(filename), val_data(image)));
}
DEFINE_PRIM(hx_cv_highgui_loadImage,  2);
DEFINE_PRIM(hx_cv_highgui_loadImageM, 2);
DEFINE_PRIM(hx_cv_highgui_saveImage,  2);



//
// Capture
// cvCaptureFromFile
// cvGetCaptureProperty
// cvGrabFrame
// cvRetrieveFrame
// cvQueryFrame
//
DECLARE_KIND(k_Capture);
DEFINE_KIND(k_Capture);
static void finalise_Capture(value v) {
    CvCapture* ptr = (CvCapture*)val_data(v);
    cvReleaseCapture(&ptr);
}
value hx_cv_highgui_captureFromFile(value filename) {
    CvCapture* ptr = cvCaptureFromFile(val_get<string>(filename));
    if (ptr == NULL) return val_null;
    else {
        value v = alloc_abstract(k_Capture, ptr);
        val_gc(v, finalise_Capture);
        return v;
    }
}
value hx_cv_highgui_getCaptureProperty(value capture, value property_id) {
    val_check_kind(capture, k_Capture);
    return alloc<double>(cvGetCaptureProperty((CvCapture*)val_data(capture), val_get<int>(property_id)));
}
value hx_cv_highgui_grabFrame(value capture) {
    val_check_kind(capture, k_Capture);
    return alloc<int>(cvGrabFrame((CvCapture*)val_data(capture)));
}
value hx_cv_highgui_retrieveFrame(value capture) {
    val_check_kind(capture, k_Capture);
    return CONVERT_NOGC(core, Image, cvRetrieveFrame((CvCapture*)val_data(capture)));
}
value hx_cv_highgui_queryFrame(value capture) {
    val_check_kind(capture, k_Capture);
    return CONVERT_NOGC(core, Image, cvQueryFrame((CvCapture*)val_data(capture)));
}
DEFINE_PRIM(hx_cv_highgui_captureFromFile,    1);
DEFINE_PRIM(hx_cv_highgui_getCaptureProperty, 2);
DEFINE_PRIM(hx_cv_highgui_grabFrame,          1);
DEFINE_PRIM(hx_cv_highgui_retrieveFrame,      1);
DEFINE_PRIM(hx_cv_highgui_queryFrame,         1);


extern "C" void highgui_allocateKinds() {
    k_Capture = alloc_kind();
}
