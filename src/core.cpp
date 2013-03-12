#include <hx/CFFI.h>
#include <core/core_c.h>

template <typename T>
static value alloc(T x) { neko_error(); }
template <>
value alloc(int x)    { return alloc_int  (x); }
template <>
value alloc(float x)  { return alloc_float(x); }
template <>
value alloc(double x) { return alloc_float(x); }

static value alloc_double(float  x) { return alloc(x); }
static value alloc_double(double x) { return alloc(x); }

template <typename T>
static T val_get(value x) { neko_error(); }
template <>
int val_get(value x)    { return val_get_int   (x); }
template <>
double val_get(value x) { return val_get_double(x); }
template <>
float val_get (value x) { return val_get_double(x); }

template <typename T, typename I>
static value get_x(value v, vkind k) {
    val_check_kind(v, k);
    T* ptr = (T*)val_data(v);
    return alloc<I>(ptr->x);
}
template <typename T, typename I>
static value get_y(value v, vkind k) {
    val_check_kind(v, k);
    T* ptr = (T*)val_data(v);
    return alloc<I>(ptr->y);
}
template <typename T, typename I>
static value get_width(value v, vkind k) {
    val_check_kind(v, k);
    T* ptr = (T*)val_data(v);
    return alloc<I>(ptr->width);
}
template <typename T, typename I>
static value get_height(value v, vkind k) {
    val_check_kind(v, k);
    T* ptr = (T*)val_data(v);
    return alloc<I>(ptr->height);
}

template <typename T, typename I>
static value set_x(value v, vkind k, value x) {
    val_check_kind(v, k);
    T* ptr = (T*)val_data(v);
    return alloc<I>(ptr->x = val_get<I>(x));
}
template <typename T, typename I>
static value set_y(value v, vkind k, value y) {
    val_check_kind(v, k);
    T* ptr = (T*)val_data(v);
    return alloc<I>(ptr->y = val_get<I>(y));
}
template <typename T, typename I>
static value set_width(value v, vkind k, value width) {
    val_check_kind(v, k);
    T* ptr = (T*)val_data(v);
    return alloc<I>(ptr->width = val_get<I>(width));
}
template <typename T, typename I>
static value set_height(value v, vkind k, value height) {
    val_check_kind(v, k);
    T* ptr = (T*)val_data(v);
    return alloc<I>(ptr->height = val_get<I>(height));
}


// Name Ffitype
#define INIT_POINT2D(N, F) \
    DECLARE_KIND(k_##N); \
    DEFINE_KIND(k_##N); \
    \
    static void finalise_##N(value v) { \
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
    value hx_cv_core_##N##_get_x(value v) { return get_x<Cv##N, F>(v, k_##N); } \
    value hx_cv_core_##N##_get_y(value v) { return get_y<Cv##N, F>(v, k_##N); } \
    value hx_cv_core_##N##_set_x(value v, value x) { return set_x<Cv##N, F>(v, k_##N, x); } \
    value hx_cv_core_##N##_set_y(value v, value y) { return set_y<Cv##N, F>(v, k_##N, y); } \
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
    static void finalise_##N(value v) { \
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
    value hx_cv_core_##N##_get_x(value v) { return get_x<Cv##N, F>(v, k_##N); } \
    value hx_cv_core_##N##_get_y(value v) { return get_y<Cv##N, F>(v, k_##N); } \
    value hx_cv_core_##N##_get_z(value v) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc_##F(ptr->z); \
    } \
    value hx_cv_core_##N##_set_x(value v, value x) { return set_x<Cv##N, F>(v, k_##N, x); } \
    value hx_cv_core_##N##_set_y(value v, value y) { return set_y<Cv##N, F>(v, k_##N, y); } \
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
    static void finalise_##N(value v) { \
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
    value hx_cv_core_##N##_get_width (value v) { return get_width <Cv##N, F>(v, k_##N); } \
    value hx_cv_core_##N##_get_height(value v) { return get_height<Cv##N, F>(v, k_##N); } \
    value hx_cv_core_##N##_set_width (value v, value width)  { return set_width <Cv##N, F>(v, k_##N, width ); } \
    value hx_cv_core_##N##_set_height(value v, value height) { return set_height<Cv##N, F>(v, k_##N, height); } \
    DEFINE_PRIM(hx_cv_core_##N,              2); \
    DEFINE_PRIM(hx_cv_core_##N##_get_width,  1); \
    DEFINE_PRIM(hx_cv_core_##N##_get_height, 1); \
    DEFINE_PRIM(hx_cv_core_##N##_set_width,  2); \
    DEFINE_PRIM(hx_cv_core_##N##_set_height, 2)

INIT_SIZE2D(Size,      int   );
INIT_SIZE2D(Size2D32f, double);



DECLARE_KIND(k_Rect);
DEFINE_KIND(k_Rect);
static void finalise_Rect(value v) {
    CvRect* ptr = (CvRect*)val_data(v);
    delete ptr;
}
value hx_cv_core_Rect(value x, value y, value width, value height) {
    CvRect* ptr = new CvRect;
    ptr->x      = val_get_int(x);
    ptr->y      = val_get_int(y);
    ptr->width  = val_get_int(width);
    ptr->height = val_get_int(height);
    value v = alloc_abstract(k_Rect, ptr);
    val_gc(v, finalise_Rect);
    return v;
}
value hx_cv_core_Rect_get_x     (value v) { return get_x     <CvRect, int>(v, k_Rect); }
value hx_cv_core_Rect_get_y     (value v) { return get_y     <CvRect, int>(v, k_Rect); }
value hx_cv_core_Rect_get_width (value v) { return get_width <CvRect, int>(v, k_Rect); }
value hx_cv_core_Rect_get_height(value v) { return get_height<CvRect, int>(v, k_Rect); }
value hx_cv_core_Rect_set_x     (value v, value x)      { return set_x     <CvRect, int>(v, k_Rect, x); }
value hx_cv_core_Rect_set_y     (value v, value y)      { return set_y     <CvRect, int>(v, k_Rect, y); }
value hx_cv_core_Rect_set_width (value v, value width)  { return set_width <CvRect, int>(v, k_Rect, width ); }
value hx_cv_core_Rect_set_height(value v, value height) { return set_height<CvRect, int>(v, k_Rect, height); }
DEFINE_PRIM(hx_cv_core_Rect,            4);
DEFINE_PRIM(hx_cv_core_Rect_get_x,      1);
DEFINE_PRIM(hx_cv_core_Rect_get_y,      1);
DEFINE_PRIM(hx_cv_core_Rect_set_x,      2);
DEFINE_PRIM(hx_cv_core_Rect_set_y,      2);
DEFINE_PRIM(hx_cv_core_Rect_get_width,  1);
DEFINE_PRIM(hx_cv_core_Rect_get_height, 1);
DEFINE_PRIM(hx_cv_core_Rect_set_width,  2);
DEFINE_PRIM(hx_cv_core_Rect_set_height, 2);



DECLARE_KIND(k_Scalar);
DEFINE_KIND(k_Scalar);
static void finalise_Scalar(value v) {
    CvScalar* ptr = (CvScalar*)val_data(v);
    delete ptr;
}
value hx_cv_core_Scalar(value v0, value v1, value v2, value v3) {
    CvScalar* ptr = new CvScalar;
    ptr->val[0] = val_get_double(v0);
    ptr->val[1] = val_get_double(v1);
    ptr->val[2] = val_get_double(v2);
    ptr->val[3] = val_get_double(v3);
    value v = alloc_abstract(k_Scalar, ptr);
    val_gc(v, finalise_Scalar);
    return v;
}
value hx_cv_core_Scalar_get_i(value v, value i) {
    val_check_kind(v, k_Scalar);
    CvScalar* ptr = (CvScalar*)val_data(v);
    return alloc_float(ptr->val[val_get_int(i)]);
}
value hx_cv_core_Scalar_set_i(value v, value i, value x) {
    val_check_kind(v, k_Scalar);
    CvScalar* ptr = (CvScalar*)val_data(v);
    return alloc_float(ptr->val[val_get_int(i)] = val_get_double(x));
}
DEFINE_PRIM(hx_cv_core_Scalar,       4);
DEFINE_PRIM(hx_cv_core_Scalar_get_i, 2);
DEFINE_PRIM(hx_cv_core_Scalar_set_i, 3);



extern "C" void allocateKinds()
{
    k_Point      = alloc_kind();
    k_Point2D32f = alloc_kind();
    k_Point2D64f = alloc_kind();

    k_Point3D32f = alloc_kind();
    k_Point3D64f = alloc_kind();

    k_Size       = alloc_kind();
    k_Size2D32f  = alloc_kind();

    k_Rect       = alloc_kind();

    k_Scalar     = alloc_kind();
}
DEFINE_ENTRY_POINT(allocateKinds);
