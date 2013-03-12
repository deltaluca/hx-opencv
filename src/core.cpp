#include <hx/CFFI.h>
#include <core/core_c.h>

// silly hxcpp
value alloc_double(double x) {
    return alloc_float(x);
}



// Name Ffitype
#define INIT_POINT2D(N, F) \
    DECLARE_KIND(k_##N); \
    DEFINE_KIND(k_##N); \
    \
    void finalise_##N(value v) { \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        delete ptr; \
    } \
    value hx_cv_core_##N(value x, value y) { \
        Cv##N* ptr = new Cv##N; \
        ptr->x = val_get_##F(x); \
        ptr->y = val_get_##F(y); \
        value v = alloc_abstract(k_##N, ptr); \
        val_gc(v, finalise_##N); \
        return v; \
    } \
    value hx_cv_core_##N##_get_x(value v) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->x); \
    } \
    value hx_cv_core_##N##_get_y(value v) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->y); \
    } \
    value hx_cv_core_##N##_set_x(value v, value x) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->x = val_get_##F(x)); \
    } \
    value hx_cv_core_##N##_set_y(value v, value y) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->y = val_get_##F(y)); \
    } \
    DEFINE_PRIM(hx_cv_core_##N, 2); \
    DEFINE_PRIM(hx_cv_core_##N##_get_x, 1); \
    DEFINE_PRIM(hx_cv_core_##N##_get_y, 1); \
    DEFINE_PRIM(hx_cv_core_##N##_set_x, 2); \
    DEFINE_PRIM(hx_cv_core_##N##_set_y, 2)

INIT_POINT2D(Point,      int   );
INIT_POINT2D(Point2D32f, double);
INIT_POINT2D(Point2D64f, double);



// Name Ffitype
#define INIT_POINT3D(N, F) \
    DECLARE_KIND(k_##N); \
    DEFINE_KIND(k_##N); \
    \
    void finalise_##N(value v) { \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        delete ptr; \
    } \
    value hx_cv_core_##N(value x, value y, value z) { \
        Cv##N* ptr = new Cv##N; \
        ptr->x = val_get_##F(x); \
        ptr->y = val_get_##F(y); \
        ptr->z = val_get_##F(z); \
        value v = alloc_abstract(k_##N, ptr); \
        val_gc(v, finalise_##N); \
        return v; \
    } \
    value hx_cv_core_##N##_get_x(value v) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->x); \
    } \
    value hx_cv_core_##N##_get_y(value v) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->y); \
    } \
    value hx_cv_core_##N##_get_z(value v) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->z); \
    } \
    value hx_cv_core_##N##_set_x(value v, value x) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->x = val_get_##F(x)); \
    } \
    value hx_cv_core_##N##_set_y(value v, value y) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->y = val_get_##F(y)); \
    } \
    value hx_cv_core_##N##_set_z(value v, value z) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->z = val_get_##F(z)); \
    } \
    DEFINE_PRIM(hx_cv_core_##N, 3); \
    DEFINE_PRIM(hx_cv_core_##N##_get_x, 1); \
    DEFINE_PRIM(hx_cv_core_##N##_get_y, 1); \
    DEFINE_PRIM(hx_cv_core_##N##_get_z, 1); \
    DEFINE_PRIM(hx_cv_core_##N##_set_x, 2); \
    DEFINE_PRIM(hx_cv_core_##N##_set_y, 2); \
    DEFINE_PRIM(hx_cv_core_##N##_set_z, 2)

INIT_POINT3D(Point3D32f, double);
INIT_POINT3D(Point3D64f, double);



// Name Ffitype
#define INIT_SIZE2D(N, F) \
    DECLARE_KIND(k_##N); \
    DEFINE_KIND(k_##N); \
    \
    void finalise_##N(value v) { \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        delete ptr; \
    } \
    value hx_cv_core_##N(value width, value height) { \
        Cv##N* ptr = new Cv##N; \
        ptr->width  = val_get_##F(width); \
        ptr->height = val_get_##F(height); \
        value v = alloc_abstract(k_##N, ptr); \
        val_gc(v, finalise_##N); \
        return v; \
    } \
    value hx_cv_core_##N##_get_width(value v) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->width); \
    } \
    value hx_cv_core_##N##_get_height(value v) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->height); \
    } \
    value hx_cv_core_##N##_set_width(value v, value x) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->width = val_get_##F(x)); \
    } \
    value hx_cv_core_##N##_set_height(value v, value y) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->height = val_get_##F(y)); \
    } \
    DEFINE_PRIM(hx_cv_core_##N,              2); \
    DEFINE_PRIM(hx_cv_core_##N##_get_width,  1); \
    DEFINE_PRIM(hx_cv_core_##N##_get_height, 1); \
    DEFINE_PRIM(hx_cv_core_##N##_set_width,  2); \
    DEFINE_PRIM(hx_cv_core_##N##_set_height, 2)

INIT_SIZE2D(Size,      int   );
INIT_SIZE2D(Size2D32f, double);



extern "C" void allocateKinds()
{
    k_Point      = alloc_kind();
    k_Point2D32f = alloc_kind();
    k_Point2D64f = alloc_kind();

    k_Point3D32f = alloc_kind();
    k_Point3D64f = alloc_kind();

    k_Size       = alloc_kind();
    k_Size2D32f  = alloc_kind();
}
DEFINE_ENTRY_POINT(allocateKinds);
