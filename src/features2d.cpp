#include <opencv.hpp>
#include <features2d/features2d.hpp>

#include "utils.h"
#define CONST(N) PCONST(features2d, N)
#define GETPROP(N, M, I) PPPGETPROP(features2d, N, M, I)
#define SETPROP(N, M, I) PPPSETPROP(features2d, N, M, I)
#define PROP(N, M, I) PPPPROP(features2d, N, M, I)

#include "core.h"

DEFINE_KIND(k_KeyPoint);
value hx_cv_features2d_KeyPoint() {
    cv::KeyPoint* ptr = new cv::KeyPoint;
    value v = alloc_abstract(k_KeyPoint, ptr);
    val_gc(v, finaliser<cv::KeyPoint>);
    return v;
}
DEFINE_PRIM(hx_cv_features2d_KeyPoint, 0);
CPPDEFINE_CONVERT_GENERIC(features2d, KeyPoint);
GETPROP(KeyPoint, size,     float);
GETPROP(KeyPoint, angle,    float);
GETPROP(KeyPoint, response, float);
GETPROP(KeyPoint, octave,   int);
GETPROP(KeyPoint, class_id, int);

value hx_cv_features2d_KeyPoint_get_pt(value v) {
    val_check_kind(v, k_KeyPoint);
    cv::KeyPoint* ptr = (cv::KeyPoint*)val_data(v);
    return CONVERT_NOGC(core, Point2D32f, (CvPoint2D32f*)&ptr->pt);
}
DEFINE_PRIM(hx_cv_features2d_KeyPoint_get_pt, 1);

extern "C" void features2d_allocateKinds() {
    k_KeyPoint = alloc_kind();
}
