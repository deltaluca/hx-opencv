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



#define PROP(N, M, I) \
    value hx_cv_core_##N##_get_##M(value v) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc<I>(ptr->M); \
    } \
    value hx_cv_core_##N##_set_##M(value v, value M) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc<I>(ptr->M = val_get<I>(M)); \
    } \
    DEFINE_PRIM(hx_cv_core_##N##_get_##M, 1); \
    DEFINE_PRIM(hx_cv_core_##N##_set_##M, 2)



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
    DEFINE_PRIM(hx_cv_core_##N, 2); \
    PROP(N, x, F); \
    PROP(N, y, F)

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
    DEFINE_PRIM(hx_cv_core_##N, 3); \
    PROP(N, x, F); \
    PROP(N, y, F); \
    PROP(N, z, F)

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
    DEFINE_PRIM(hx_cv_core_##N, 2); \
    PROP(N, width,  F); \
    PROP(N, height, F)

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
DEFINE_PRIM(hx_cv_core_Rect, 4);
PROP(Rect, x,      int);
PROP(Rect, y,      int);
PROP(Rect, width,  int);
PROP(Rect, height, int);



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



value hx_cv_core_CV_TERMCRIT_ITER  () { return alloc_int(CV_TERMCRIT_ITER);   }
value hx_cv_core_CV_TERMCRIT_NUMBER() { return alloc_int(CV_TERMCRIT_NUMBER); }
value hx_cv_core_CV_TERMCRIT_EPS   () { return alloc_int(CV_TERMCRIT_EPS);    }

DEFINE_PRIM(hx_cv_core_CV_TERMCRIT_ITER,   0);
DEFINE_PRIM(hx_cv_core_CV_TERMCRIT_NUMBER, 0);
DEFINE_PRIM(hx_cv_core_CV_TERMCRIT_EPS,    0);



DECLARE_KIND(k_TermCriteria);
DEFINE_KIND(k_TermCriteria);
static void finalise_TermCriteria(value v) {
    CvTermCriteria* ptr = (CvTermCriteria*)val_data(v);
    delete ptr;
}
value hx_cv_core_TermCriteria(value type, value max_iter, value epsilon) {
    CvTermCriteria* ptr = new CvTermCriteria;
    ptr->type     = val_get_int(type);
    ptr->max_iter = val_get_int(max_iter);
    ptr->epsilon  = val_get_double(epsilon);
    value v = alloc_abstract(k_TermCriteria, ptr);
    val_gc(v, finalise_TermCriteria);
    return v;
}
value hx_cv_core_TermCriteria_check(value criteria, value default_eps, value default_max_iters) {
    val_check_kind(criteria, k_TermCriteria);
    CvTermCriteria* ptr = (CvTermCriteria*)val_data(criteria);
    CvTermCriteria nxt = cvCheckTermCriteria(*ptr, val_get_double(default_eps), val_get_int(default_max_iters));
    return hx_cv_core_TermCriteria(alloc_int(nxt.type), alloc_int(nxt.max_iter), alloc_double(nxt.epsilon));
}
DEFINE_PRIM(hx_cv_core_TermCriteria,       3);
DEFINE_PRIM(hx_cv_core_TermCriteria_check, 3);
PROP(TermCriteria, type, int);
PROP(TermCriteria, max_iter, int);
PROP(TermCriteria, epsilon, double);



extern "C" void allocateKinds()
{
    k_Point        = alloc_kind();
    k_Point2D32f   = alloc_kind();
    k_Point2D64f   = alloc_kind();
    k_Point3D32f   = alloc_kind();
    k_Point3D64f   = alloc_kind();
    k_Size         = alloc_kind();
    k_Size2D32f    = alloc_kind();
    k_Rect         = alloc_kind();
    k_Scalar       = alloc_kind();
    k_TermCriteria = alloc_kind();
}
DEFINE_ENTRY_POINT(allocateKinds);
