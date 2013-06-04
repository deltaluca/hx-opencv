#include <imgproc/imgproc_c.h>
#include <imgproc/imgproc.hpp>

#include "utils.h"
#define GETPROP(N, M, I) PGETPROP(imgproc, N, M, I)
#define SETPROP(N, M, I) PSETPROP(imgproc, N, M, I)
#define PROP(N, M, I) PPROP(imgproc, N, M, I)

#include "core.h"



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
// cvBilateralFilter
// cvDilate
// cvErode
// cvEqualizeHist
// cvFilter2D
// cvLaplace
// cvMorphologyEx
// cvPyrDown
// cvSmooth
// cvSobel
//
void hx_cv_imgproc_bilateralFilter(value src, value dst, value d, value color, value space) {
    cv::bilateralFilter(cv::cvarrToMat(val_data(src)), cv::cvarrToMat(val_data(dst)), val_get<int>(d), val_get<double>(color), val_get<double>(space));
}
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
void hx_cv_imgproc_equalizeHist(value src, value dst) {
    cvEqualizeHist(val_data(src), val_data(dst));
}
void hx_cv_imgproc_filter2D(value src, value dst, value kernel, value anchor) {
    val_check_kind(kernel, k_Mat);
    val_check_kind(anchor, k_Point);
    cvFilter2D(val_data(src), val_data(dst), (CvMat*)val_data(kernel), *(CvPoint*)val_data(anchor));
}
void hx_cv_imgproc_gaussianBlur(value* args, int nargs) {
    cv::GaussianBlur(cv::cvarrToMat(val_data(args[0])), cv::cvarrToMat(val_data(args[1])), *(CvSize*)val_data(args[2]), val_get<double>(args[3]), val_get<double>(args[4]), val_get<int>(args[5]));
}
void hx_cv_imgproc_laplace(value src, value dst, value apertureSize) {
    cvLaplace(val_data(src), val_data(dst), val_get<int>(apertureSize));
}
void hx_cv_imgproc_medianBlur(value src, value dst, value ksize) {
    cv::medianBlur(cv::cvarrToMat(val_data(src)), cv::cvarrToMat(val_data(dst)), val_get<int>(ksize));
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
DEFINE_PRIM(hx_cv_imgproc_bilateralFilter, 5);
DEFINE_PRIM(hx_cv_imgproc_dilate,       4);
DEFINE_PRIM(hx_cv_imgproc_erode,        4);
DEFINE_PRIM(hx_cv_imgproc_equalizeHist, 2);
DEFINE_PRIM(hx_cv_imgproc_filter2D,     4);
DEFINE_PRIM_MULT(hx_cv_imgproc_gaussianBlur);
DEFINE_PRIM(hx_cv_imgproc_laplace,      3);
DEFINE_PRIM(hx_cv_imgproc_medianBlur,   3);
DEFINE_PRIM_MULT(hx_cv_imgproc_morphologyEx);
DEFINE_PRIM(hx_cv_imgproc_pyrDown,      2);
DEFINE_PRIM_MULT(hx_cv_imgproc_smooth);
DEFINE_PRIM(hx_cv_imgproc_sobel,        5);



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



//
// cvAcc
// cvMultiplyAcc
// cvRunningAvg
// cvSquareAcc
//
void hx_cv_imgproc_acc(value image, value sum, value mask) {
    cvAcc(val_data(image), val_data(sum), val_data(mask));
}
void hx_cv_imgproc_multiplyAcc(value image1, value image2, value acc, value mask) {
    cvMultiplyAcc(val_data(image1), val_data(image2), val_data(acc), val_data(mask));
}
void hx_cv_imgproc_runningAvg(value image, value acc, value alpha, value mask) {
    cvRunningAvg(val_data(image), val_data(acc), val_get<double>(alpha), val_data(mask));
}
void hx_cv_imgproc_squareAcc(value image, value sqsum, value mask) {
    cvSquareAcc(val_data(image), val_data(sqsum), val_data(mask));
}
DEFINE_PRIM(hx_cv_imgproc_acc,         3);
DEFINE_PRIM(hx_cv_imgproc_multiplyAcc, 4);
DEFINE_PRIM(hx_cv_imgproc_runningAvg,  4);
DEFINE_PRIM(hx_cv_imgproc_squareAcc,   3);



//
// cvThreshold
//
value hx_cv_imgproc_threshold(value src, value dst, value threshold, value maxValue, value thresholdType) {
    return alloc<double>(cvThreshold(val_data(src), val_data(dst), val_get<double>(threshold), val_get<double>(maxValue), val_get<int>(thresholdType)));
}
DEFINE_PRIM(hx_cv_imgproc_threshold, 5);



//
// cvGoodFeaturesToTrack
//
value hx_cv_imgproc_goodFeaturesToTrack(value* args, int nargs) {
    if (nargs != 11) neko_error();
    const CvArr* image     = val_data(args[0]);
          CvArr* eigImage  = val_data(args[1]);
          CvArr* tempImage = val_data(args[2]);
    value corners          = args[3];
    int cornerCount        = val_get<int>(args[4]);
    double qualityLevel    = val_get<double>(args[5]);
    double minDistance     = val_get<double>(args[6]);
    const CvArr* mask      = val_data(args[7]);
    int blockSize          = val_get<int>(args[8]);
    int useHarris          = val_get<int>(args[9]);
    double k               = val_get<double>(args[10]);

    val_check(corners, array);

    CvPoint2D32f* corns = new CvPoint2D32f[cornerCount];
    cvGoodFeaturesToTrack(image, eigImage, tempImage, corns, &cornerCount, qualityLevel, minDistance, mask, blockSize, useHarris, k);

    for (int i = 0; i < cornerCount; i++) {
        if (i == val_array_size(corners)) {
            val_array_set_i(corners, i, CONVERT(core, Point2D32f, new CvPoint2D32f));
        }
        CvPoint2D32f* p = (CvPoint2D32f*)val_data(val_array_i(corners, i));
        p->x = corns[i].x;
        p->y = corns[i].y;
    }

    delete[] corns;
    return alloc<int>(cornerCount);
}
DEFINE_PRIM_MULT(hx_cv_imgproc_goodFeaturesToTrack);




// NON_OPENCV_METHODS
void hx_cv_imgproc_equalizeHistAdaptive(value* args, int narg) {
    CvMat* src = (CvMat*)val_data(args[0]);
    CvMat* dst = (CvMat*)val_data(args[1]);
    unsigned char* srcp = src->data.ptr;
    unsigned char* dstp = dst->data.ptr;
    int windowRows = val_get<int>(args[2]);
    int windowCols = val_get<int>(args[3]);
    if (windowRows > src->rows) windowRows = src->rows;
    if (windowCols > src->cols) windowCols = src->cols;
    int numWindowsR = (int)ceil(((float)src->rows)/windowRows);
    int numWindowsC = (int)ceil(((float)src->cols)/windowCols);

    int lastRows = (src->rows - (numWindowsR-1)*windowRows);
    int lastCols = (src->cols - (numWindowsC-1)*windowCols);

    float limit = val_get<double>(args[4]);
    float cutoff = val_get<double>(args[5]);

    float* hist = new float[numWindowsR*numWindowsC*0x100];
    for (int i = 0; i < numWindowsR*numWindowsC*0x100; i++) hist[i] = 0;

    for (int wi = 0; wi < numWindowsR; wi++) {
    for (int wj = 0; wj < numWindowsC; wj++) {
        float* chist = hist + (wi*numWindowsC+wj)*0x100;
        int i0 = wi*windowRows; int i1 = i0 + windowRows; if (i1 > src->rows) i1 = src->rows;
        int j0 = wj*windowCols; int j1 = j0 + windowCols; if (j1 > src->cols) j1 = src->cols;
        float accum = 0;
        float lim = limit*(i1-i0)*(j1-j0);
        float cut = cutoff*(i1-i0)*(j1-j0);
        for (int i = i0; i < i1; i++) {
        for (int j = j0; j < j1; j++) {
            chist[srcp[i*src->cols+j]]++;
            if (chist[srcp[i*src->cols+j]] > lim) {
                chist[srcp[i*src->cols+j]] = lim;
                accum++;
            }
        }}
        while (accum != 0) {
            bool any = false;
            accum /= 0x100;
            for (int i = 0; i <= 0xff; i++) {
                chist[i] += accum;
                if (chist[i] > cut) any = true;
            }
            if (any) {
                accum = 0;
                for (int i = 0; i <= 0xff; i++) {
                    if (chist[i] > lim) {
                        accum += chist[i] - lim;
                        chist[i] = lim;
                    }
                }
            }
            else accum = 0;
        }
        float den = 1.0f/((i1-i0)*(j1-j0));
        chist[0] *= den;
        for (int i = 1; i <= 0xff; i++) chist[i] = chist[i-1]+(chist[i]*den);
        for (int i = 0; i <  0xff; i++) chist[i] = 0xff*chist[i]/chist[0xff];
        chist[0xff] = 0xff;
    }}

    for (int i = 0; i < src->rows; i++) {
    for (int j = 0; j < src->cols; j++) {
        int wi = i / windowRows;
        int wj = j / windowCols;
        float* chist = hist + (wi*numWindowsC+wj)*0x100;
        int actualRows = (wi < numWindowsR-1) ? windowRows : lastRows;
        int actualCols = (wj < numWindowsC-1) ? windowCols : lastCols;
        float di = i - wi*windowRows - ((float)actualRows)*0.5;
        float dj = j - wj*windowCols - ((float)actualCols)*0.5;

        // corners
        if ((di == 0 && dj == 0)
         || (wi == 0 && wj == 0 && di <= 0 && dj <= 0)
         || (wi == 0 && wj == numWindowsC-1 && di <= 0 && dj >= 0)
         || (wi == numWindowsR-1 && wj == 0 && di >= 0 && dj <= 0)
         || (wi == numWindowsR-1 && wj == numWindowsC-1 && di >= 0 && dj >= 0)) {
            dstp[i*src->cols+j] = (int)chist[srcp[i*src->cols+j]];
        }
        //edges-top/bot
        else if ((wi == 0 && di <= 0)
         || (wi == numWindowsR-1 && di >= 0)) {
            float* chist2 = chist + (dj > 0 ? 0x100 : -0x100);
            int cols2 = (wj+(dj > 0 ? 1 : -1) < numWindowsC-1) ? windowCols : lastCols;
            float f = dj / (((float)(actualCols + cols2))*0.5f);
            if (f < 0) f = -f;
            dstp[i*src->cols+j] = (int)((1-f)*chist[srcp[i*src->cols+j]] + f*chist2[srcp[i*src->cols+j]]);
        }
        //edges-left/right
        else if ((wj == 0 && dj <= 0)
         || (wj == numWindowsC-1 && dj >= 0)) {
            float* chist2 = chist + (di > 0 ? 0x100 : -0x100)*numWindowsC;
            int rows2 = (wi+(di > 0 ? 1 : -1) < numWindowsR-1) ? windowRows : lastRows;
            float f = di / (((float)(actualRows + rows2))*0.5f);
            if (f < 0) f = -f;
            dstp[i*src->cols+j] = (int)((1-f)*chist[srcp[i*src->cols+j]] + f*chist2[srcp[i*src->cols+j]]);
        }
        else {
            float* chist2 = chist + (dj > 0 ? 0x100 : -0x100);
            int cols2 = (wj+(dj > 0 ? 1 : -1) < numWindowsC-1) ? windowCols : lastCols;
            float f2 = dj / (((float)(actualCols + cols2))*0.5f);
            if (f2 < 0) f2 = -f2;

            float* chist3 = chist + (di > 0 ? 0x100 : -0x100)*numWindowsC;
            int rows2 = (wi+(di > 0 ? 1 : -1) < numWindowsR-1) ? windowRows : lastRows;
            float f3 = di / (((float)(actualRows + rows2))*0.5f);
            if (f3 < 0) f3 = -f3;

            float* chist4 = chist + (di > 0 ? 0x100 : -0x100)*numWindowsC + (dj > 0 ? 0x100 : -0x100);
            dstp[i*src->cols+j] = (int)(
                (1-f2)*(1-f3)*chist [srcp[i*src->cols+j]] + f2*(1-f3)*chist2[srcp[i*src->cols+j]]
              + (1-f2)*f3*    chist3[srcp[i*src->cols+j]] + f2*f3*    chist4[srcp[i*src->cols+j]]
            );
        }
    }}

    delete[] hist;
}
DEFINE_PRIM_MULT(hx_cv_imgproc_equalizeHistAdaptive);

extern "C" void imgproc_allocateKinds() {
    k_ConvKernel = alloc_kind();
}
