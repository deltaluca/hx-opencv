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



DECLARE_KIND(k_BRISK);
DEFINE_KIND(k_BRISK);
value hx_cv_features2d_BRISK(value thresh, value octaves, value patternScale) {
    cv::BRISK* ptr = new cv::BRISK(val_get<int>(thresh), val_get<int>(octaves), val_get<double>(patternScale));
    value v = alloc_abstract(k_BRISK, ptr);
    val_gc(v, finaliser<cv::BRISK>);
    return v;
}
value hx_cv_features2d_BRISK_detect(value* args, int nargs) {
    if (nargs != 6) neko_error();
    value thisp       = args[0];
    value img         = args[1];
    value mask        = args[2];
    value keypoints   = args[3];
    value descriptors = args[4];
    value useProvided = args[5];

    val_check_kind(thisp, k_BRISK);

    val_check(keypoints, array);
    std::vector<cv::KeyPoint> _keypoints;
    for (int i = 0; i < val_array_size(keypoints); i++)
        _keypoints.push_back(*(cv::KeyPoint*)val_data(val_array_i(keypoints, i)));

    cv::Mat _descriptors;
    cv::InputArray _mask = (val_is_null(mask) ? cv::noArray() : cv::cvarrToMat(val_data(mask)));

    ((cv::BRISK*)val_data(thisp))->operator()(cv::cvarrToMat(val_data(img)), _mask, _keypoints, _descriptors, val_get<bool>(useProvided));

    for (int i = 0; i < _keypoints.size(); i++) {
        if (i == val_array_size(keypoints)) {
            val_array_set_i(keypoints, i, CONVERT(features2d, KeyPoint, new cv::KeyPoint));
        }
        cv::KeyPoint* p = (cv::KeyPoint*)val_data(val_array_i(keypoints, i));
        p->operator=(_keypoints[i]);
    }

    if (!val_is_null(descriptors)) {
        val_array_set_size(descriptors, _descriptors.size().width*_descriptors.size().height);
        double* dd = val_array_double(descriptors);
        for (int i = 0; i < _descriptors.size().height; i++) {
            for (int j = 0; j < _descriptors.size().width; j++) {
                dd[i*_descriptors.size().width+j] = _descriptors.at<float>(i, j);
            }
        }
    }

    return alloc<int>(_keypoints.size());
}
DEFINE_PRIM(hx_cv_features2d_BRISK, 3);
DEFINE_PRIM_MULT(hx_cv_features2d_BRISK_detect);



extern "C" void features2d_allocateKinds() {
    k_KeyPoint = alloc_kind();
    k_BRISK    = alloc_kind();
}
