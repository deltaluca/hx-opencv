#include <video/video.hpp>

#include "utils.h"
#define CONST(N) PCONST(video, N)
#define GETPROP(N, M, I) PGETPROP(video, N, M, I)
#define SETPROP(N, M, I) PSETPROP(video, N, M, I)
#define PROP(N, M, I) PPROP(video, N, M, I)

#include "core.h"



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
DEFINE_PRIM_MULT(hx_cv_video_calcOpticalFlowBM);


extern "C" void video_allocateKinds() {
}
