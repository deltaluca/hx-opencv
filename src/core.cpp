#include <core/core_c.h>

#include "utils.h"
#define CONST(N) PCONST(core, N)
#define GETPROP(N, M, I) PGETPROP(core, N, M, I)
#define SETPROP(N, M, I) PSETPROP(core, N, M, I)
#define PROP(N, M, I) PPROP(core, N, M, I)



//
// CvPoint
// CvPoint2D32f
// CvPoint2D64f
//
#define INIT_POINT2D(N, F) \
    DECLARE_KIND(k_##N); \
    DEFINE_KIND(k_##N); \
    value hx_cv_core_##N(value x, value y) { \
        Cv##N* ptr = new Cv##N; \
        ptr->x = val_get<F>(x); \
        ptr->y = val_get<F>(y); \
        value v = alloc_abstract(k_##N, ptr); \
        val_gc(v, finaliser<Cv##N>); \
        return v; \
    } \
    DEFINE_PRIM(hx_cv_core_##N, 2); \
    PROP(N, x, F); \
    PROP(N, y, F)
INIT_POINT2D(Point,      int   );
INIT_POINT2D(Point2D32f, double);
INIT_POINT2D(Point2D64f, double);



//
// CvPoint3D32f
// CvPoint3D64f
//
#define INIT_POINT3D(N) \
    DECLARE_KIND(k_##N); \
    DEFINE_KIND(k_##N); \
    value hx_cv_core_##N(value x, value y, value z) { \
        Cv##N* ptr = new Cv##N; \
        ptr->x = val_get<double>(x); \
        ptr->y = val_get<double>(y); \
        ptr->z = val_get<double>(z); \
        value v = alloc_abstract(k_##N, ptr); \
        val_gc(v, finaliser<Cv##N>); \
        return v; \
    } \
    DEFINE_PRIM(hx_cv_core_##N, 3); \
    PROP(N, x, double); \
    PROP(N, y, double); \
    PROP(N, z, double)

INIT_POINT3D(Point3D32f);
INIT_POINT3D(Point3D64f);



//
// CvSize
// CvSize2D32f
//
#define INIT_SIZE2D(N, F) \
    DECLARE_KIND(k_##N); \
    DEFINE_KIND(k_##N); \
    value hx_cv_core_##N(value width, value height) { \
        Cv##N* ptr = new Cv##N; \
        ptr->width  = val_get<F>(width); \
        ptr->height = val_get<F>(height); \
        value v = alloc_abstract(k_##N, ptr); \
        val_gc(v, finaliser<Cv##N>); \
        return v; \
    } \
    DEFINE_PRIM(hx_cv_core_##N, 2); \
    PROP(N, width,  F); \
    PROP(N, height, F)

INIT_SIZE2D(Size,      int   );
INIT_SIZE2D(Size2D32f, double);



//
// CvRect
//
DECLARE_KIND(k_Rect);
DEFINE_KIND(k_Rect);
value hx_cv_core_Rect(value x, value y, value width, value height) {
    CvRect* ptr = new CvRect;
    ptr->x      = val_get<int>(x);
    ptr->y      = val_get<int>(y);
    ptr->width  = val_get<int>(width);
    ptr->height = val_get<int>(height);
    value v = alloc_abstract(k_Rect, ptr);
    val_gc(v, finaliser<CvRect>);
    return v;
}
DEFINE_PRIM(hx_cv_core_Rect, 4);
PROP(Rect, x,      int);
PROP(Rect, y,      int);
PROP(Rect, width,  int);
PROP(Rect, height, int);



//
// CvScalar
//
DECLARE_KIND(k_Scalar);
DEFINE_KIND(k_Scalar);
value hx_cv_core_Scalar(value v0, value v1, value v2, value v3) {
    CvScalar* ptr = new CvScalar;
    ptr->val[0] = val_get<double>(v0);
    ptr->val[1] = val_get<double>(v1);
    ptr->val[2] = val_get<double>(v2);
    ptr->val[3] = val_get<double>(v3);
    value v = alloc_abstract(k_Scalar, ptr);
    val_gc(v, finaliser<CvScalar>);
    return v;
}
value hx_cv_core_Scalar_get_i(value v, value i) {
    val_check_kind(v, k_Scalar);
    CvScalar* ptr = (CvScalar*)val_data(v);
    return alloc<float>(ptr->val[val_get<int>(i)]);
}
value hx_cv_core_Scalar_set_i(value v, value i, value x) {
    val_check_kind(v, k_Scalar);
    CvScalar* ptr = (CvScalar*)val_data(v);
    return alloc<float>(ptr->val[val_get<int>(i)] = val_get<double>(x));
}
DEFINE_PRIM(hx_cv_core_Scalar,       4);
DEFINE_PRIM(hx_cv_core_Scalar_get_i, 2);
DEFINE_PRIM(hx_cv_core_Scalar_set_i, 3);



//
// CV_TERMCRIT_*
//
CONST(TERMCRIT_ITER);
CONST(TERMCRIT_NUMBER);
CONST(TERMCRIT_EPS);



//
// CvTermCriteria
//
DECLARE_KIND(k_TermCriteria);
DEFINE_KIND(k_TermCriteria);
value hx_cv_core_TermCriteria(value type, value max_iter, value epsilon) {
    CvTermCriteria* ptr = new CvTermCriteria;
    ptr->type     = val_get<int>(type);
    ptr->max_iter = val_get<int>(max_iter);
    ptr->epsilon  = val_get<double>(epsilon);
    value v = alloc_abstract(k_TermCriteria, ptr);
    val_gc(v, finaliser<CvTermCriteria>);
    return v;
}
value hx_cv_core_TermCriteria_check(value criteria, value default_eps, value default_max_iters) {
    val_check_kind(criteria, k_TermCriteria);
    CvTermCriteria* ptr = (CvTermCriteria*)val_data(criteria);
    CvTermCriteria nxt = cvCheckTermCriteria(*ptr, val_get<double>(default_eps), val_get<int>(default_max_iters));
    return hx_cv_core_TermCriteria(alloc<int>(nxt.type), alloc<int>(nxt.max_iter), alloc<double>(nxt.epsilon));
}
DEFINE_PRIM(hx_cv_core_TermCriteria,       3);
DEFINE_PRIM(hx_cv_core_TermCriteria_check, 3);
PROP(TermCriteria, type, int);
PROP(TermCriteria, max_iter, int);
PROP(TermCriteria, epsilon, double);



//
// CV_*
//
CONST(8U);
CONST(8S);
CONST(16U);
CONST(16S);
CONST(32S);
CONST(32F);
CONST(64F);
CONST(8UC1);
CONST(8UC2);
CONST(8UC3);
CONST(8UC4);
CONST(8SC1);
CONST(8SC2);
CONST(8SC3);
CONST(8SC4);
CONST(16UC1);
CONST(16UC2);
CONST(16UC3);
CONST(16UC4);
CONST(16SC1);
CONST(16SC2);
CONST(16SC3);
CONST(16SC4);
CONST(32SC1);
CONST(32SC2);
CONST(32SC3);
CONST(32SC4);
CONST(32FC1);
CONST(32FC2);
CONST(32FC3);
CONST(32FC4);
CONST(64FC1);
CONST(64FC2);
CONST(64FC3);
CONST(64FC4);



//
// CvMat
//
DECLARE_KIND(k_Mat);
DEFINE_KIND(k_Mat);
static void finalise_Mat(value v) {
    CvMat* ptr = (CvMat*)val_data(v);
    cvReleaseMat(&ptr);
}
value hx_cv_core_createMat(value rows, value cols, value type) {
    CvMat* ptr = cvCreateMat(val_get<int>(rows), val_get<int>(cols), val_get<int>(type));
    value v = alloc_abstract(k_Mat, ptr);
    val_gc(v, finalise_Mat);
    return v;
}
value hx_cv_core_createMatHeader(value rows, value cols, value type) {
    CvMat* ptr = cvCreateMatHeader(val_get<int>(rows), val_get<int>(cols), val_get<int>(type));
    value v = alloc_abstract(k_Mat, ptr);
    val_gc(v, finalise_Mat);
    return v;
}
value hx_cv_core_mGet(value mat, value row, value col) {
    val_check_kind(mat, k_Mat);
    CvMat* ptr = (CvMat*)val_data(mat);
    return alloc<double>(cvmGet(ptr, val_get<int>(row), val_get<int>(col)));
}
value hx_cv_core_mSet(value mat, value row, value col, value value) {
    val_check_kind(mat, k_Mat);
    CvMat* ptr = (CvMat*)val_data(mat);
    cvmSet(ptr, val_get<int>(row), val_get<int>(col), val_get<double>(value));
    return value;
}
#define MATVAL(N, P, F) \
    value hx_cv_core_mat_##N##_get(value mat, value i) { \
        val_check_kind(mat, k_Mat); \
        CvMat* ptr = (CvMat*)val_data(mat); \
        return alloc<F>(ptr->data.P[val_get<int>(i)]); \
    } \
    value hx_cv_core_mat_##N##_set(value mat, value i, value v) { \
        val_check_kind(mat, k_Mat); \
        CvMat* ptr = (CvMat*)val_data(mat); \
        return alloc<F>(ptr->data.P[val_get<int>(i)] = val_get<F>(v)); \
    } \
    DEFINE_PRIM(hx_cv_core_mat_##N##_get, 2); \
    DEFINE_PRIM(hx_cv_core_mat_##N##_set, 3)
DEFINE_PRIM(hx_cv_core_createMat,       3);
DEFINE_PRIM(hx_cv_core_createMatHeader, 3);
DEFINE_PRIM(hx_cv_core_mGet,            3);
DEFINE_PRIM(hx_cv_core_mSet,            4);
GETPROP(Mat, type, int);
GETPROP(Mat, step, int);
GETPROP(Mat, rows, int);
GETPROP(Mat, cols, int);
MATVAL(uchar,  ptr, int   );
MATVAL(short,  s,   int   );
MATVAL(int,    i,   int   );
MATVAL(float,  fl,  double);
MATVAL(double, db,  double);



//
// IPL_DEPTH_*
//
GCONST(core, IPL, DEPTH_8U);
GCONST(core, IPL, DEPTH_8S);
GCONST(core, IPL, DEPTH_16U);
GCONST(core, IPL, DEPTH_16S);
GCONST(core, IPL, DEPTH_32S);
GCONST(core, IPL, DEPTH_32F);
GCONST(core, IPL, DEPTH_64F);



//
// IplImage
//
DECLARE_KIND(k_Image);
DEFINE_KIND(k_Image);
static void finalise_Image(value v) {
    IplImage* ptr = (IplImage*)val_data(v);
    cvReleaseImage(&ptr);
}
value hx_cv_core_createImage(value size, value depth, value channels) {
    val_check_kind(size, k_Size);
    IplImage* ptr = cvCreateImage(*(CvSize*)val_data(size), val_get<int>(depth), val_get<int>(channels));
    value v = alloc_abstract(k_Image, ptr);
    val_gc(v, finalise_Image);
    return v;
}
value hx_cv_core_createImageHeader(value size, value depth, value channels) {
    val_check_kind(size, k_Size);
    IplImage* ptr = cvCreateImageHeader(*(CvSize*)val_data(size), val_get<int>(depth), val_get<int>(channels));
    value v = alloc_abstract(k_Image, ptr);
    val_gc(v, finalise_Image);
    return v;
}
DEFINE_PRIM(hx_cv_core_createImage,       3);
DEFINE_PRIM(hx_cv_core_createImageHeader, 3);
GGETPROP(core, Ipl, Image, nChannels, int);
GGETPROP(core, Ipl, Image, depth,     int);
GGETPROP(core, Ipl, Image, dataOrder, int);
GGETPROP(core, Ipl, Image, origin,    int);
GGETPROP(core, Ipl, Image, width,     int);
GGETPROP(core, Ipl, Image, height,    int);
GGETPROP(core, Ipl, Image, imageSize, int);
GGETPROP(core, Ipl, Image, widthStep, int);


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
    k_Mat          = alloc_kind();
    k_Image        = alloc_kind();
}
DEFINE_ENTRY_POINT(allocateKinds);
