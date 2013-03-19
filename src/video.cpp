#include <video/video.hpp>
#include <legacy/legacy.hpp>

#include "utils.h"
#define CONST(N) PCONST(video, N)
#define GETPROP(N, M, I) PGETPROP(video, N, M, I)
#define SETPROP(N, M, I) PSETPROP(video, N, M, I)
#define PROP(N, M, I) PPROP(video, N, M, I)

#include "core.h"
#include <core/core_c.h>



//
// CV_LKFLOW*
//
CONST(LKFLOW_PYR_A_READY);
CONST(LKFLOW_PYR_B_READY);
CONST(LKFLOW_INITIAL_GUESSES);
CONST(LKFLOW_GET_MIN_EIGENVALS);



//
// cvCalcOpticalFlowBM
// cvCalcOpticalFlowHS
// cvCalcOpticalFlowLK
// cvCalcOpticalFlowPyrLK
//
void hx_cv_video_calcOpticalFlowBM(value* args, int nargs) {
    if (nargs != 8) neko_error();
    value prev        = args[0];
    value curr        = args[1];
    value blockSize   = args[2];
    value shiftSize   = args[3];
    value max_range   = args[4];
    value usePrevious = args[5];
    value velx        = args[6];
    value vely        = args[7];
    val_check_kind(blockSize, k_Size);
    val_check_kind(shiftSize, k_Size);
    val_check_kind(max_range, k_Size);
    cvCalcOpticalFlowBM(val_data(prev), val_data(curr), *(CvSize*)val_data(blockSize), *(CvSize*)val_data(shiftSize), *(CvSize*)val_data(max_range), val_get<int>(usePrevious), val_data(velx), val_data(vely));
}
void hx_cv_video_calcOpticalFlowHS(value* args, int nargs) {
    if (nargs != 7) neko_error();
    value prev        = args[0];
    value curr        = args[1];
    value usePrevious = args[2];
    value velx        = args[3];
    value vely        = args[4];
    value lambda      = args[5];
    value criteria    = args[6];
    val_check_kind(criteria, k_TermCriteria);
    cvCalcOpticalFlowHS(val_data(prev), val_data(curr), val_get<int>(usePrevious), val_data(velx), val_data(vely), val_get<double>(lambda), *(CvTermCriteria*)val_data(criteria));
}
void hx_cv_video_calcOpticalFlowLK(value prev, value curr, value winSize, value velx, value vely) {
    val_check_kind(winSize, k_Size);
    cvCalcOpticalFlowLK(val_data(prev), val_data(curr), *(CvSize*)val_data(winSize), val_data(velx), val_data(vely));
}
void hx_cv_video_calcOpticalFlowPyrLK(value* args, int nargs) {
    if (nargs != 13) neko_error();
    const CvArr* prev  = val_data(args[0]);
    const CvArr* curr  = val_data(args[1]);
    CvArr* prevPyr     = val_data(args[2]);
    CvArr* currPyr     = val_data(args[3]);
    value prevFeatures = args[4];
    value currFeatures = args[5];
    int count          = val_get<int>(args[6]);
    value winSize      = args[7];
    int level          = val_get<int>(args[8]);
    value status       = args[9];
    value track_error  = args[10];
    value criteria     = args[11];
    int flags          = val_get<int>(args[12]);

    val_check(prevFeatures, array);
    val_check(currFeatures, array);
    val_check(status,       array);
    CvPoint2D32f* _prev   = new CvPoint2D32f[count];
    CvPoint2D32f* _curr   = new CvPoint2D32f[count];
    char*         _status = new char[count];
    float*        _error  = NULL;
    for (int i = 0; i < count; i++) {
        CvPoint2D32f* p = (CvPoint2D32f*)val_data(val_array_i(prevFeatures, i));
        _prev[i].x = p->x;
        _prev[i].y = p->y;
    }
    if (!val_is_null(track_error)) {
        val_check(track_error, array);
        _error = new float[count];
    }
    val_check_kind(winSize, k_Size);
    val_check_kind(criteria, k_TermCriteria);

    cvCalcOpticalFlowPyrLK(prev, curr, prevPyr, currPyr, _prev, _curr, count, *(CvSize*)val_data(winSize), level, _status, _error, *(CvTermCriteria*)val_data(criteria), flags);

    for (int i = 0; i < count; i++) {
        if (val_array_size(currFeatures) == i) {
            val_array_set_i(currFeatures, i, CONVERT(core, Point2D32f, new CvPoint2D32f));
        }
        CvPoint2D32f* p = (CvPoint2D32f*)val_data(val_array_i(currFeatures, i));
        p->x = _curr[i].x;
        p->y = _curr[i].y;
        val_array_set_i(status, i, alloc<bool>(_status[i]));
        if (!val_is_null(track_error))
            val_array_set_i(track_error, i, alloc<float>(_error[i]));
    }

    delete[] _prev;
    delete[] _curr;
    delete[] _status;
    if (!val_is_null(track_error)) {
        delete[] _error;
    }
}
DEFINE_PRIM_MULT(hx_cv_video_calcOpticalFlowBM);
DEFINE_PRIM_MULT(hx_cv_video_calcOpticalFlowHS);
DEFINE_PRIM(hx_cv_video_calcOpticalFlowLK, 5);
DEFINE_PRIM_MULT(hx_cv_video_calcOpticalFlowPyrLK);


extern "C" void video_allocateKinds() {
}
