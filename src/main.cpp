#define IMPLEMENT_API
#define NEKO_COMPATIBLE
#include <hx/CFFI.h>

#include "core.h"
#include "highgui.h"
#include "imgproc.h"
#include "video.h"
#include "nonfree.h"
#include "features2d.h"

extern "C" void hx_opencv_entry() {
    core_allocateKinds();
    highgui_allocateKinds();
    imgproc_allocateKinds();
    video_allocateKinds();
    nonfree_allocateKinds();
    features2d_allocateKinds();
}
DEFINE_ENTRY_POINT(hx_opencv_entry);

