#include <imgproc/imgproc_c.h>

#include "utils.h"
#define CONST(N) PCONST(imgproc, N)
#define GETPROP(N, M, I) PGETPROP(imgproc, N, M, I)
#define SETPROP(N, M, I) PSETPROP(imgproc, N, M, I)
#define PROP(N, M, I) PPROP(imgproc, N, M, I)



//
// CV_SHAPE_*
//
CONST(SHAPE_RECT);
CONST(SHAPE_CROSS);
CONST(SHAPE_ELLIPSE);
CONST(SHAPE_CUSTOM);



//
// cvCreateStructuringElementEx
//
DECLARE_KIND(k_ConvKernel);
DEFINE_KIND(k_ConvKernel);
void finalise_ConvKernel(value v) {
    IplConvKernel* ptr = (IplConvKernel*)val_data(v);
    cvReleaseStructuringElement(&ptr);
}
value hx_cv_imgproc_createStructuringElementEx(value *args, int nargs) {
    if (nargs != 6) neko_error();
    value cols    = args[0];
    value rows    = args[1];
    value anchorX = args[2];
    value anchorY = args[3];
    int shape     = val_get<int>(args[4]);
    value values  = args[5];

    int* vals = NULL;
    if (shape == CV_SHAPE_CUSTOM) {
        val_check(values, array);
        int size = val_array_size(values);
        vals = new int[size];
        for (int i = 0; i < size; i++) vals[i] = val_get<int>(val_array_i(values, i));
    }

    IplConvKernel* ptr = cvCreateStructuringElementEx(val_get<int>(cols), val_get<int>(rows), val_get<int>(anchorX), val_get<int>(anchorY), shape, vals);
    value v = alloc_abstract(k_ConvKernel, ptr);
    val_gc(v, finalise_ConvKernel);
    if (vals != NULL) delete[] vals;
    return v;
}
DEFINE_PRIM_MULT(hx_cv_imgproc_createStructuringElementEx);



//
// cvDilate
// cvErode
//
void hx_cv_imgproc_dilate(value src, value dst, value element, value iterations) {
    if (!val_is_null(element)) val_check_kind(element, k_ConvKernel);
    IplConvKernel* elm = (val_is_null(element) ? NULL : (IplConvKernel*)val_data(element));
    cvDilate(val_data(src), val_data(dst), elm, val_get<int>(iterations));
}
void hx_cv_imgproc_erode(value src, value dst, value element, value iterations) {
    if (!val_is_null(element)) val_check_kind(element, k_ConvKernel);
    IplConvKernel* elm = (val_is_null(element) ? NULL : (IplConvKernel*)val_data(element));
    cvErode(val_data(src), val_data(dst), elm, val_get<int>(iterations));
}
DEFINE_PRIM(hx_cv_imgproc_dilate, 4);
DEFINE_PRIM(hx_cv_imgproc_erode,  4);



extern "C" void imgproc_allocateKinds() {
    k_ConvKernel = alloc_kind();
}
