#include <highgui/highgui_c.h>

#include "utils.h"
#define CONST(N) PCONST(highgui, N)



//
// CV_WINDOW_*
// CV_GUI_*
//
CONST(WINDOW_NORMAL);
CONST(WINDOW_AUTOSIZE);
CONST(WINDOW_FREERATIO);
CONST(WINDOW_KEEPRATIO);
CONST(GUI_NORMAL);
CONST(GUI_EXPANDED);



//
// CV_EVENT_*
//
CONST(EVENT_MOUSEMOVE);
CONST(EVENT_LBUTTONDOWN);
CONST(EVENT_RBUTTONDOWN);
CONST(EVENT_MBUTTONDOWN);
CONST(EVENT_LBUTTONUP);
CONST(EVENT_RBUTTONUP);
CONST(EVENT_MBUTTONUP);
CONST(EVENT_LBUTTONDBLCLK);
CONST(EVENT_RBUTTONDBLCLK);
CONST(EVENT_MBUTTONDBLCLK);



//
// CV_EVENT_FLAG_*
//
CONST(EVENT_FLAG_LBUTTON);
CONST(EVENT_FLAG_RBUTTON);
CONST(EVENT_FLAG_MBUTTON);
CONST(EVENT_FLAG_CTRLKEY);
CONST(EVENT_FLAG_SHIFTKEY);
CONST(EVENT_FLAG_ALTKEY);



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
void hx_cv_highgui_waitKey(value delay) {
    cvWaitKey(val_get<int>(delay));
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
void hx_cv_highgui_destroyWindow(value name) {
    cvDestroyWindow(val_get<string>(name));
}
void hx_cv_highgui_destroyAllWindows() {
    cvDestroyAllWindows();
}
void hx_cv_highgui_moveWindow(value name, value x, value y) {
    cvMoveWindow(val_get<string>(name), val_get<int>(x), val_get<int>(y));
}
void hx_cv_highgui_resizeWindow(value name, value width, value height) {
    cvResizeWindow(val_get<string>(name), val_get<int>(width), val_get<int>(height));
}
DEFINE_PRIM(hx_cv_highgui_namedWindow,       2);
DEFINE_PRIM(hx_cv_highgui_destroyWindow,     1);
DEFINE_PRIM(hx_cv_highgui_destroyAllWindows, 0);
DEFINE_PRIM(hx_cv_highgui_moveWindow,        3);
DEFINE_PRIM(hx_cv_highgui_resizeWindow,      3);



//
// cvCreateTrackbar
// cvGetTrackbarPos
// cvSetTrackbarPos
//
void bound_onChanged(int pos, void* onChange) {
    val_call1((value)onChange, alloc<int>(pos));
}
static int hx_cv_highgui_trackbar_value;
value hx_cv_highgui_createTrackbar(value trackbarName, value windowName, value _value, value count, value onChange) {
    if (!val_is_null(onChange)) val_check_function(onChange, 1);

    int* val = &hx_cv_highgui_trackbar_value;
    *val = val_get<int>(_value);

    if (val_is_null(onChange)) {
        return alloc<int>(cvCreateTrackbar(val_get<string>(trackbarName), safe_val_string(windowName), val, val_get<int>(count)));
    }
    else {
        return alloc<int>(cvCreateTrackbar2(val_get<string>(trackbarName), safe_val_string(windowName), val, val_get<int>(count), bound_onChanged, onChange));
    }
}
value hx_cv_highgui_getTrackbarPos(value trackbarName, value windowName) {
    return alloc_int(cvGetTrackbarPos(val_get<string>(trackbarName), safe_val_string(windowName)));
}
void hx_cv_highgui_setTrackbarPos(value trackbarName, value windowName, value pos) {
    cvSetTrackbarPos(val_get<string>(trackbarName), safe_val_string(windowName), val_get<int>(pos));
}
DEFINE_PRIM(hx_cv_highgui_createTrackbar, 5);
DEFINE_PRIM(hx_cv_highgui_getTrackbarPos, 2);
DEFINE_PRIM(hx_cv_highgui_setTrackbarPos, 3);



//
// cvSetMouseCallback
//
void bound_onMouse(int event, int x, int y, int flags, void* onMouse) {
    value args[4] = {alloc<int>(event), alloc<int>(x), alloc<int>(y), alloc<int>(flags)};
    val_callN((value)onMouse, args, 4);
}
void hx_cv_highgui_setMouseCallback(value windowName, value onMouse) {
    val_check_function(onMouse, 4);
    cvSetMouseCallback(val_get<string>(windowName), bound_onMouse, onMouse);
}
DEFINE_PRIM(hx_cv_highgui_setMouseCallback, 2);
