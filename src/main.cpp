#define IMPLEMENT_API
#include <hx/CFFI.h>

#include "core.h"
#include "highgui.h"
#include "imgproc.h"
#include "video.h"

extern "C" void hx_opencv_entry() {
    core_allocateKinds();
    highgui_allocateKinds();
    imgproc_allocateKinds();
    video_allocateKinds();
}
DEFINE_ENTRY_POINT(hx_opencv_entry);

