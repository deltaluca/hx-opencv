#pragma once
#ifndef UTILS_H
#define UTILS_H
#include <hx/CFFI.h>



typedef const char* string;



// Parameterised allocs
template <typename T>
static value alloc(T x) { neko_error(); }
template <>
inline value alloc(int x) { return alloc_int(x); }
template <>
inline value alloc(float x) { return alloc_float(x); }
template <>
inline value alloc(double x) { return alloc_float(x); }
template <>
inline value alloc(bool x) { return alloc_bool(x); }

inline value alloc_double(float  x) { return alloc(x); }
inline value alloc_double(double x) { return alloc(x); }



// Parameterised val_gets
template <typename T>
T val_get(value x) { neko_error(); }
template <>
inline int val_get(value x) { return val_get_int(x); }
template <>
inline float val_get(value x) { return val_get_double(x); }
template <>
inline double val_get(value x) { return val_get_double(x); }
template <>
inline string val_get(value x) { return val_get_string(x); }
template <>
inline bool val_get(value x) { return val_get_bool(x); }

inline string safe_val_string(value x) {
    return val_is_null(x) ? NULL : val_get<string>(x);
}

// Typical finalisation
template <typename T>
void finaliser(value v) {
    T* ptr = (T*)val_data(v);
    delete ptr;
}



// Conversions between moduels
#define GDECLARE_CONVERT(R, P, N) \
    value hx_cv_##P##_to##N(R##N* x); \
    value hx_cv_##P##_to##N##_nogc(R##N* x)
#define PDECLARE_CONVERT(P, N) GDECLARE_CONVERT(Cv, P, N)
#define GDEFINE_CONVERT(R, P, N, F) \
    value hx_cv_##P##_to##N(R##N* ptr) { \
        if (ptr == NULL) return val_null; \
        value v = alloc_abstract(k_##N, ptr); \
        val_gc(v, F); \
        return v; \
    } \
    value hx_cv_##P##_to##N##_nogc(R##N* ptr) { \
        if (ptr == NULL) return val_null; \
        value v = alloc_abstract(k_##N, ptr); \
        return v; \
    }
#define PDEFINE_CONVERT(P, N, F) GDEFINE_CONVERT(Cv, P, N, F)
#define PDEFINE_CONVERT_GENERIC(P, N) GDEFINE_CONVERT(Cv, P, N, finaliser<Cv##N>)

#define CONVERT(P, N, x) hx_cv_##P##_to##N(x)
#define CONVERT_NOGC(P, N, x) hx_cv_##P##_to##N##_nogc(x)


// Defining general integer consts.
// Defining CV_# integer consts.
#define GCONST(P, R, N) \
    value hx_cv_##P##_##R##_##N() { return alloc_int(R##_##N); } \
    DEFINE_PRIM(hx_cv_##P##_##R##_##N, 0)
#define PCONST(P, N) GCONST(P, CV, N)



// Defining properties of a Cv# object.
#define GGETPROP(P, R, N, M, I) \
    value hx_cv_##P##_##N##_get_##M(value v) { \
        val_check_kind(v, k_##N); \
        R##N* ptr = (R##N*)val_data(v); \
        return alloc<I>(ptr->M); \
    } \
    DEFINE_PRIM(hx_cv_##P##_##N##_get_##M, 1)
#define PGETPROP(P, N, M, I) GGETPROP(P, Cv, N, M, I)
#define PSETPROP(P, N, M, I) \
    value hx_cv_##P##_##N##_set_##M(value v, value M) { \
        val_check_kind(v, k_##N); \
        Cv##N* ptr = (Cv##N*)val_data(v); \
        return alloc<I>(ptr->M = val_get<I>(M)); \
    } \
    DEFINE_PRIM(hx_cv_##P##_##N##_set_##M, 2)
#define PPROP(P, N, M, I) \
    PGETPROP(P, N, M, I); \
    PSETPROP(P, N, M, I)
#endif
