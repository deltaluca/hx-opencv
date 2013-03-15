#include <core/core_c.h>
#include "utils.h"

#define INIT_POINT2D(N) \
    DECLARE_KIND(k_##N)
INIT_POINT2D(Point);
INIT_POINT2D(Point2D32f);
INIT_POINT2D(Point2D64f);

#define INIT_POINT3D(N) \
    DECLARE_KIND(k_##N)
INIT_POINT3D(Point3D32f);
INIT_POINT3D(Point3D64f);

#define INIT_SIZE2D(N) \
    DECLARE_KIND(k_##N)
INIT_SIZE2D(Size);
INIT_SIZE2D(Size2D32f);

DECLARE_KIND(k_Rect);
DECLARE_KIND(k_Scalar);
DECLARE_KIND(k_TermCriteria);
DECLARE_KIND(k_Mat);
DECLARE_KIND(k_Image);

GDECLARE_CONVERT(Ipl, core, Image);
PDECLARE_CONVERT(core, Mat);
PDECLARE_CONVERT(core, Scalar);
PDECLARE_CONVERT(core, Size);

extern "C" { void core_allocateKinds(); }
