#include <opencv.hpp>
#include <nonfree/nonfree.hpp>
#include <features2d/features2d.hpp>

#include "utils.h"
#define CONST(N) PCONST(nonfree, N)
#define GETPROP(N, M, I) PGETPROP(nonfree, N, M, I)
#define SETPROP(N, M, I) PSETPROP(nonfree, N, M, I)
#define PROP(N, M, I) PPROP(nonfree, N, M, I)

#include "core.h"
#include "features2d.h"



DECLARE_KIND(k_SIFT);
DEFINE_KIND(k_SIFT);
value hx_cv_nonfree_SIFT(value nFeatures, value nOctaveLayers, value constrastThreshold, value edgeThreshold, value sigma) {
    cv::SIFT* ptr = new cv::SIFT(val_get<int>(nFeatures), val_get<int>(nOctaveLayers), val_get<double>(constrastThreshold), val_get<double>(edgeThreshold), val_get<double>(sigma));
    value v = alloc_abstract(k_SIFT, ptr);
    val_gc(v, finaliser<cv::SIFT>);
    return v;
}
value hx_cv_nonfree_SIFT_detect(value* args, int nargs) {
    if (nargs != 6) neko_error();
    value thisp       = args[0];
    value img         = args[1];
    value mask        = args[2];
    value keypoints   = args[3];
    value descriptors = args[4];
    value useProvided = args[5];

    val_check_kind(thisp, k_SIFT);

    val_check(keypoints, array);
    std::vector<cv::KeyPoint> _keypoints;
    for (int i = 0; i < val_array_size(keypoints); i++)
        _keypoints.push_back(*(cv::KeyPoint*)val_data(val_array_i(keypoints, i)));

    cv::Mat _descriptors;
    cv::InputArray _mask = (val_is_null(mask) ? cv::noArray() : cv::cvarrToMat(val_data(mask)));

    ((cv::SIFT*)val_data(thisp))->operator()(cv::cvarrToMat(val_data(img)), _mask, _keypoints, (val_is_null(descriptors) ? cv::noArray() : _descriptors), val_get<bool>(useProvided));

    for (int i = 0; i < _keypoints.size(); i++) {
        if (i == val_array_size(keypoints)) {
            val_array_set_i(keypoints, i, CONVERT(features2d, KeyPoint, new cv::KeyPoint));
        }
        cv::KeyPoint* p = (cv::KeyPoint*)val_data(val_array_i(keypoints, i));
        p->operator=(_keypoints[i]);
    }

    val_array_set_size(descriptors, _descriptors.size().width*_descriptors.size().height);
    double* dd = val_array_double(descriptors);
    for (int i = 0; i < _descriptors.size().height; i++) {
        for (int j = 0; j < _descriptors.size().width; j++) {
            dd[i*_descriptors.size().width+j] = _descriptors.at<float>(i, j);
        }
    }

    return alloc<int>(_keypoints.size());
}
DEFINE_PRIM(hx_cv_nonfree_SIFT, 5);
DEFINE_PRIM_MULT(hx_cv_nonfree_SIFT_detect);



DECLARE_KIND(k_SURF);
DEFINE_KIND(k_SURF);
value hx_cv_nonfree_SURF(value hessian, value nOctaves, value nLayers, value extended, value upright) {
    cv::SURF* ptr = new cv::SURF(val_get<double>(hessian), val_get<int>(nOctaves), val_get<int>(nLayers), val_get<bool>(extended), val_get<bool>(upright));
    value v = alloc_abstract(k_SURF, ptr);
    val_gc(v, finaliser<cv::SURF>);
    return v;
}
value hx_cv_nonfree_SURF_detect(value* args, int nargs) {
    if (nargs != 6) neko_error();
    value thisp       = args[0];
    value img         = args[1];
    value mask        = args[2];
    value keypoints   = args[3];
    value descriptors = args[4];
    value useProvided = args[5];

    val_check_kind(thisp, k_SURF);

    val_check(keypoints, array);
    std::vector<cv::KeyPoint> _keypoints;
    for (int i = 0; i < val_array_size(keypoints); i++)
        _keypoints.push_back(*(cv::KeyPoint*)val_data(val_array_i(keypoints, i)));

    std::vector<float> _descriptors;
    cv::InputArray _mask = (val_is_null(mask) ? cv::noArray() : cv::cvarrToMat(val_data(mask)));

    ((cv::SURF*)val_data(thisp))->operator()(cv::cvarrToMat(val_data(img)), _mask, _keypoints, (val_is_null(descriptors) ? cv::noArray() : _descriptors), val_get<bool>(useProvided));

    for (int i = 0; i < _keypoints.size(); i++) {
        if (i == val_array_size(keypoints)) {
            val_array_set_i(keypoints, i, CONVERT(features2d, KeyPoint, new cv::KeyPoint));
        }
        cv::KeyPoint* p = (cv::KeyPoint*)val_data(val_array_i(keypoints, i));
        p->operator=(_keypoints[i]);
    }

    val_array_set_size(descriptors, _descriptors.size());
    double* dd = val_array_double(descriptors);
    for (int i = 0; i < _descriptors.size(); i++)
        dd[i] = _descriptors[i];

    return alloc<int>(_keypoints.size());
}
DEFINE_PRIM(hx_cv_nonfree_SURF, 5);
DEFINE_PRIM_MULT(hx_cv_nonfree_SURF_detect);



extern "C" void nonfree_allocateKinds() {
    cv::initModule_nonfree();
    k_SURF = alloc_kind();
    k_SIFT = alloc_kind();
}
