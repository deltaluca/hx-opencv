#define IMPLEMENT_API
#include <hx/CFFI.h>

#include "core.h"
#include "highgui.h"

extern "C" void hx_opencv_entry() {
    core_allocateKinds();
    highgui_allocateKinds();
}
DEFINE_ENTRY_POINT(hx_opencv_entry);

