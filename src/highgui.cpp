#include <hx/CFFI.h>
#include <highgui.h>
#include <ffi.h>
#include <string>
#include <map>

value hx_cv_highgui_CV_WINDOW_NORMAL   () { return alloc_int(CV_WINDOW_NORMAL);    }
value hx_cv_highgui_CV_WINDOW_AUTOSIZE () { return alloc_int(CV_WINDOW_AUTOSIZE);  }
value hx_cv_highgui_CV_WINDOW_FREERATIO() { return alloc_int(CV_WINDOW_FREERATIO); }
value hx_cv_highgui_CV_WINDOW_KEEPRATIO() { return alloc_int(CV_WINDOW_KEEPRATIO); }
value hx_cv_highgui_CV_GUI_NORMAL      () { return alloc_int(CV_GUI_NORMAL);       }
value hx_cv_highgui_CV_GUI_EXPANDED    () { return alloc_int(CV_GUI_EXPANDED);     }

DEFINE_PRIM(hx_cv_highgui_CV_WINDOW_NORMAL,    0);
DEFINE_PRIM(hx_cv_highgui_CV_WINDOW_AUTOSIZE,  0);
DEFINE_PRIM(hx_cv_highgui_CV_WINDOW_FREERATIO, 0);
DEFINE_PRIM(hx_cv_highgui_CV_WINDOW_KEEPRATIO, 0);
DEFINE_PRIM(hx_cv_highgui_CV_GUI_NORMAL,       0);
DEFINE_PRIM(hx_cv_highgui_CV_GUI_EXPANDED,     0);



value hx_cv_highgui_CV_EVENT_MOUSEMOVE    () { return alloc_int(CV_EVENT_MOUSEMOVE);     }
value hx_cv_highgui_CV_EVENT_LBUTTONDOWN  () { return alloc_int(CV_EVENT_LBUTTONDOWN);   }
value hx_cv_highgui_CV_EVENT_RBUTTONDOWN  () { return alloc_int(CV_EVENT_RBUTTONDOWN);   }
value hx_cv_highgui_CV_EVENT_MBUTTONDOWN  () { return alloc_int(CV_EVENT_MBUTTONDOWN);   }
value hx_cv_highgui_CV_EVENT_LBUTTONUP    () { return alloc_int(CV_EVENT_LBUTTONUP);     }
value hx_cv_highgui_CV_EVENT_RBUTTONUP    () { return alloc_int(CV_EVENT_RBUTTONUP);     }
value hx_cv_highgui_CV_EVENT_MBUTTONUP    () { return alloc_int(CV_EVENT_MBUTTONUP);     }
value hx_cv_highgui_CV_EVENT_LBUTTONDBLCLK() { return alloc_int(CV_EVENT_LBUTTONDBLCLK); }
value hx_cv_highgui_CV_EVENT_RBUTTONDBLCLK() { return alloc_int(CV_EVENT_RBUTTONDBLCLK); }
value hx_cv_highgui_CV_EVENT_MBUTTONDBLCLK() { return alloc_int(CV_EVENT_MBUTTONDBLCLK); }

DEFINE_PRIM(hx_cv_highgui_CV_EVENT_MOUSEMOVE,     0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_LBUTTONDOWN,   0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_RBUTTONDOWN,   0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_MBUTTONDOWN,   0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_LBUTTONUP,     0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_RBUTTONUP,     0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_MBUTTONUP,     0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_LBUTTONDBLCLK, 0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_RBUTTONDBLCLK, 0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_MBUTTONDBLCLK, 0);



value hx_cv_highgui_CV_EVENT_FLAG_LBUTTON () { return alloc_int(CV_EVENT_FLAG_LBUTTON);  }
value hx_cv_highgui_CV_EVENT_FLAG_RBUTTON () { return alloc_int(CV_EVENT_FLAG_RBUTTON);  }
value hx_cv_highgui_CV_EVENT_FLAG_MBUTTON () { return alloc_int(CV_EVENT_FLAG_MBUTTON);  }
value hx_cv_highgui_CV_EVENT_FLAG_CTRLKEY () { return alloc_int(CV_EVENT_FLAG_CTRLKEY);  }
value hx_cv_highgui_CV_EVENT_FLAG_SHIFTKEY() { return alloc_int(CV_EVENT_FLAG_SHIFTKEY); }
value hx_cv_highgui_CV_EVENT_FLAG_ALTKEY  () { return alloc_int(CV_EVENT_FLAG_ALTKEY);   }

DEFINE_PRIM(hx_cv_highgui_CV_EVENT_FLAG_LBUTTON,  0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_FLAG_RBUTTON,  0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_FLAG_MBUTTON,  0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_FLAG_CTRLKEY,  0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_FLAG_SHIFTKEY, 0);
DEFINE_PRIM(hx_cv_highgui_CV_EVENT_FLAG_ALTKEY,   0);



value hx_cv_highgui_initSystem(value argc, value argv) {
    val_check(argc, int);
    val_check(argv, array);

    int size = val_array_size(argv);
    char** _argv = new char*[size];
    for (int i = 0; i < size; i++) _argv[i] = val_dup_string(val_array_i(argv, i));

    int ret = cvInitSystem(val_int(argc), _argv);
    delete[] _argv;

    return alloc_int(ret);
}
void hx_cv_highgui_waitKey(value delay) {
    cvWaitKey(val_get_int(delay));
}

DEFINE_PRIM(hx_cv_highgui_initSystem, 2);
DEFINE_PRIM(hx_cv_highgui_waitKey,    1);



value hx_cv_highgui_namedWindow(value winname, value flags) {
    return alloc_int(cvNamedWindow(val_get_string(winname), val_get_int(flags)));
}
void hx_cv_highgui_destroyWindow(value name) {
    cvDestroyWindow(val_get_string(name));
}
void hx_cv_highgui_destroyAllWindows() {
    cvDestroyAllWindows();
}
void hx_cv_highgui_moveWindow(value name, value x, value y) {
    cvMoveWindow(val_get_string(name), val_get_int(x), val_get_int(y));
}
void hx_cv_highgui_resizeWindow(value name, value width, value height) {
    cvResizeWindow(val_get_string(name), val_get_int(width), val_get_int(height));
}

DEFINE_PRIM(hx_cv_highgui_namedWindow,       2);
DEFINE_PRIM(hx_cv_highgui_destroyWindow,     1);
DEFINE_PRIM(hx_cv_highgui_destroyAllWindows, 0);
DEFINE_PRIM(hx_cv_highgui_moveWindow,        3);
DEFINE_PRIM(hx_cv_highgui_resizeWindow,      3);

void bound_onChanged(int pos, void* onChange) {
    val_call1((value)onChange, alloc_int(pos));
}
const char* safe_val_string(value x) {
    return val_is_null(x) ? NULL : val_get_string(x);
}

static int hx_cv_highgui_trackbar_value;
value hx_cv_highgui_createTrackbar(value trackbarName, value windowName, value _value, value count, value onChange) {
    if (!val_is_null(onChange)) val_check_function(onChange, 1);

    int* val = &hx_cv_highgui_trackbar_value;
    *val = val_get_int(_value);

    if (val_is_null(onChange)) {
        return alloc_int(cvCreateTrackbar(val_get_string(trackbarName), safe_val_string(windowName), val, val_get_int(count)));
    }
    else {
        return alloc_int(cvCreateTrackbar2(val_get_string(trackbarName), safe_val_string(windowName), val, val_get_int(count), bound_onChanged, onChange));
    }
}
value hx_cv_highgui_getTrackbarPos(value trackbarName, value windowName) {
    return alloc_int(cvGetTrackbarPos(val_get_string(trackbarName), safe_val_string(windowName)));
}
void hx_cv_highgui_setTrackbarPos(value trackbarName, value windowName, value pos) {
    cvSetTrackbarPos(val_get_string(trackbarName), safe_val_string(windowName), val_get_int(pos));
}

DEFINE_PRIM(hx_cv_highgui_createTrackbar, 5);
DEFINE_PRIM(hx_cv_highgui_getTrackbarPos, 2);
DEFINE_PRIM(hx_cv_highgui_setTrackbarPos, 3);


void bound_onMouse(int event, int x, int y, int flags, void* onMouse) {
    value args[4] = {alloc_int(event), alloc_int(x), alloc_int(y), alloc_int(flags)};
    val_callN((value)onMouse, args, 4);
}

void hx_cv_highgui_setMouseCallback(value windowName, value onMouse) {
    val_check_function(onMouse, 4);
    cvSetMouseCallback(val_get_string(windowName), bound_onMouse, onMouse);
}

DEFINE_PRIM(hx_cv_highgui_setMouseCallback, 2);
