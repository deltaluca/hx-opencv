#define IMPLEMENT_API
#include <hxcpp.h>
#include <hx/CFFI.h>

#include <cv.h>
#include <highgui.h>

#include <cstdio>
#include <cstdlib>
#include <cstdarg>
#include <cstring>

value sum(value a, value b) {
    return alloc_int(val_int(a) + val_int(b));
}

//extern "C" {
//    value sum(value a, value b) {
//        if (!val_is_int(a) || !val_is_int(b)) return val_null;
//        return alloc_int(val_int(a) + val_int(b));
//    }
//}
DEFINE_PRIM(sum, 2);
