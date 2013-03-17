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



//
// CV_*2*
//
CONST(BGR2BGRA);
CONST(RGB2RGBA);
CONST(BGRA2BGR);
CONST(RGBA2RGB);
CONST(BGR2RGBA);
CONST(RGB2BGRA);
CONST(RGBA2BGR);
CONST(BGRA2RGB);
CONST(BGR2RGB);
CONST(RGB2BGR);
CONST(BGRA2RGBA);
CONST(RGBA2BGRA);
CONST(BGR2GRAY);
CONST(RGB2GRAY);
CONST(GRAY2BGR);
CONST(GRAY2RGB);
CONST(GRAY2BGRA);
CONST(GRAY2RGBA);
CONST(BGRA2GRAY);
CONST(RGBA2GRAY);
CONST(BGR2BGR565);
CONST(RGB2BGR565);
CONST(BGR5652BGR);
CONST(BGR5652RGB);
CONST(BGRA2BGR565);
CONST(RGBA2BGR565);
CONST(BGR5652BGRA);
CONST(BGR5652RGBA);
CONST(GRAY2BGR565);
CONST(BGR5652GRAY);
CONST(BGR2BGR555);
CONST(RGB2BGR555);
CONST(BGR5552BGR);
CONST(BGR5552RGB);
CONST(BGRA2BGR555);
CONST(RGBA2BGR555);
CONST(BGR5552BGRA);
CONST(BGR5552RGBA);
CONST(GRAY2BGR555);
CONST(BGR5552GRAY);
CONST(BGR2XYZ);
CONST(RGB2XYZ);
CONST(XYZ2BGR);
CONST(XYZ2RGB);
CONST(BGR2YCrCb);
CONST(RGB2YCrCb);
CONST(YCrCb2BGR);
CONST(YCrCb2RGB);
CONST(BGR2HSV);
CONST(RGB2HSV);
CONST(BGR2Lab);
CONST(RGB2Lab);
CONST(BayerBG2BGR);
CONST(BayerGB2BGR);
CONST(BayerRG2BGR);
CONST(BayerGR2BGR);
CONST(BayerBG2RGB);
CONST(BayerGB2RGB);
CONST(BayerRG2RGB);
CONST(BayerGR2RGB);
CONST(BGR2Luv);
CONST(RGB2Luv);
CONST(BGR2HLS);
CONST(RGB2HLS);
CONST(HSV2BGR);
CONST(HSV2RGB);
CONST(Lab2BGR);
CONST(Lab2RGB);
CONST(Luv2BGR);
CONST(Luv2RGB);
CONST(HLS2BGR);
CONST(HLS2RGB);
CONST(BayerBG2BGR_VNG);
CONST(BayerGB2BGR_VNG);
CONST(BayerRG2BGR_VNG);
CONST(BayerGR2BGR_VNG);
CONST(BayerBG2RGB_VNG);
CONST(BayerGB2RGB_VNG);
CONST(BayerRG2RGB_VNG);
CONST(BayerGR2RGB_VNG);
CONST(BGR2HSV_FULL);
CONST(RGB2HSV_FULL);
CONST(BGR2HLS_FULL);
CONST(RGB2HLS_FULL);
CONST(HSV2BGR_FULL);
CONST(HSV2RGB_FULL);
CONST(HLS2BGR_FULL);
CONST(HLS2RGB_FULL);
CONST(LBGR2Lab);
CONST(LRGB2Lab);
CONST(LBGR2Luv);
CONST(LRGB2Luv);
CONST(Lab2LBGR);
CONST(Lab2LRGB);
CONST(Luv2LBGR);
CONST(Luv2LRGB);
CONST(BGR2YUV);
CONST(RGB2YUV);
CONST(YUV2BGR);
CONST(YUV2RGB);
CONST(BayerBG2GRAY);
CONST(BayerGB2GRAY);
CONST(BayerRG2GRAY);
CONST(BayerGR2GRAY);
CONST(YUV420i2RGB);
CONST(YUV420i2BGR);
CONST(YUV420sp2RGB);
CONST(YUV420sp2BGR);



//
// CV_DIST_*
//
CONST(DIST_C);
CONST(DIST_L1);
CONST(DIST_L2);



//
// cvCvtColor
// cvDistTransform
// cvIntegral
//
void hx_cv_imgproc_cvtColor(value src, value dst, value code) {
    cvCvtColor(val_data(src), val_data(dst), val_get<int>(code));
}
void hx_cv_imgproc_distTransform(value* args, int nargs) {
    if (nargs != 6) neko_error();
    value src         = args[0];
    value dst         = args[1];
    int distance_type = val_get<int>(args[2]);
    int mask_size     = val_get<int>(args[3]);
    value mask        = args[4];
    value labels      = args[5];
    float* _mask = NULL;
    if (!val_is_null(mask)) {
        val_check(mask, array);
        int size = val_array_size(mask);
        _mask = new float[size];
        for (int i = 0; i < size; i++) _mask[i] = val_get<double>(val_array_i(mask, i));
    }
    cvDistTransform(val_data(src), val_data(dst), distance_type, mask_size, _mask, val_data(labels));
    if (_mask != NULL) delete[] _mask;
}
void hx_cv_imgproc_integral(value image, value sum, value sqsum, value tiltedSum) {
    cvIntegral(val_data(image), val_data(sum), val_data(sqsum), val_data(tiltedSum));
}
DEFINE_PRIM(hx_cv_imgproc_cvtColor, 3);
DEFINE_PRIM_MULT(hx_cv_imgproc_distTransform);
DEFINE_PRIM(hx_cv_imgproc_integral, 4);



extern "C" void imgproc_allocateKinds() {
    k_ConvKernel = alloc_kind();
}
