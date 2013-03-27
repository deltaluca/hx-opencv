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


DECLARE_KIND(k_SURF);
DEFINE_KIND(k_SURF);
void finalise_SURF(value v) {
    cv::SURF* ptr = (cv::SURF*)val_data(v);
    delete ptr;
}
value hx_cv_nonfree_SURF(value hessian, value nOctaves, value nLayers, value extended, value upright) {
    cv::SURF* ptr = new cv::SURF(val_get<double>(hessian), val_get<int>(nOctaves), val_get<int>(nLayers), val_get<bool>(extended), val_get<bool>(upright));
    value v = alloc_abstract(k_SURF, ptr);
    val_gc(v, finalise_SURF);
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

    cv::OutputArray _descriptors = (val_is_null(descriptors) ? cv::noArray() : cv::cvarrToMat(val_data(descriptors)));

    cv::InputArray _mask = (val_is_null(mask) ? cv::noArray() : cv::cvarrToMat(val_data(mask)));

    ((cv::SURF*)val_data(thisp))->operator()(cv::cvarrToMat(val_data(img)), _mask, _keypoints, _descriptors, val_get<bool>(useProvided));

    for (int i = 0; i < _keypoints.size(); i++) {
        if (i == val_array_size(keypoints)) {
            val_array_set_i(keypoints, i, CONVERT(features2d, KeyPoint, new cv::KeyPoint));
        }
        cv::KeyPoint* p = (cv::KeyPoint*)val_data(val_array_i(keypoints, i));
        p->operator=(_keypoints[i]);
    }

    return alloc<int>(_keypoints.size());
}
DEFINE_PRIM(hx_cv_nonfree_SURF, 5);
DEFINE_PRIM_MULT(hx_cv_nonfree_SURF_detect);



extern "C" void nonfree_allocateKinds() {
    cv::initModule_nonfree();
    k_SURF = alloc_kind();
}
