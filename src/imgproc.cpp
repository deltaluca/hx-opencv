#include <imgproc/imgproc_c.h>

#include "utils.h"
#define CONST(N) PCONST(imgproc, N)
#define GETPROP(N, M, I) PGETPROP(imgproc, N, M, I)
#define SETPROP(N, M, I) PSETPROP(imgproc, N, M, I)
#define PROP(N, M, I) PPROP(imgproc, N, M, I)

#include "core.h"


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
// CV_MOP_*
//
CONST(MOP_OPEN);
CONST(MOP_CLOSE);
CONST(MOP_GRADIENT);
CONST(MOP_TOPHAT);
CONST(MOP_BLACKHAT);



//
// CV_*
//
CONST(GAUSSIAN);
CONST(MEDIAN);
CONST(BILATERAL);
CONST(BLUR);
CONST(BLUR_NO_SCALE);



//
// cvDilate
// cvErode
// cvFilter2D
// cvLaplace
// cvMorphologyEx
// cvPyrDown
// cvSmooth
// cvSobel
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
void hx_cv_imgproc_filter2D(value src, value dst, value kernel, value anchor) {
    val_check_kind(kernel, k_Mat);
    val_check_kind(anchor, k_Point);
    cvFilter2D(val_data(src), val_data(dst), (CvMat*)val_data(kernel), *(CvPoint*)val_data(anchor));
}
void hx_cv_imgproc_laplace(value src, value dst, value apertureSize) {
    cvLaplace(val_data(src), val_data(dst), val_get<int>(apertureSize));
}
void hx_cv_imgproc_morphologyEx(value* args, int nargs) {
    if (nargs != 6) neko_error();
    value src        = args[0];
    value dst        = args[1];
    value tmp        = args[2];
    value element    = args[3];
    value operation  = args[4];
    value iterations = args[5];
    val_check_kind(element, k_ConvKernel);
    cvMorphologyEx(val_data(src), val_data(dst), val_data(tmp), (IplConvKernel*)val_data(element), val_get<int>(operation), val_get<int>(iterations));
}
void hx_cv_imgproc_pyrDown(value src, value dst) { // CV_GAUSSIAN_5x5 is supported only.
    cvPyrDown(val_data(src), val_data(dst));
}
void hx_cv_imgproc_smooth(value* args, int nargs) {
    if (nargs != 7) neko_error();
    value src      = args[0];
    value dst      = args[1];
    int smoothType = val_get<int>(args[2]);
    int param1     = val_get<int>(args[3]);
    int param2     = val_get<int>(args[4]);
    int param3     = val_get<int>(args[5]);
    int param4     = val_get<int>(args[6]);
    cvSmooth(val_data(src), val_data(dst), smoothType, param1, param2, param3, param4);
}
void hx_cv_imgproc_sobel(value src, value dst, value xorder, value yorder, value apertureSize) {
    cvSobel(val_data(src), val_data(dst), val_get<int>(xorder), val_get<int>(yorder), val_get<int>(apertureSize));
}
DEFINE_PRIM(hx_cv_imgproc_dilate,   4);
DEFINE_PRIM(hx_cv_imgproc_erode,    4);
DEFINE_PRIM(hx_cv_imgproc_filter2D, 4);
DEFINE_PRIM(hx_cv_imgproc_laplace,  3);
DEFINE_PRIM_MULT(hx_cv_imgproc_morphologyEx);
DEFINE_PRIM(hx_cv_imgproc_pyrDown,  2);
DEFINE_PRIM_MULT(hx_cv_imgproc_smooth);
DEFINE_PRIM(hx_cv_imgproc_sobel,    5);



extern "C" void imgproc_allocateKinds() {
    k_ConvKernel = alloc_kind();
}
