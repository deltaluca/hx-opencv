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

inline string safe_val_string(value x) {
    return val_is_null(x) ? NULL : val_get<string>(x);
}

// Typical finalisation
template <typename T>
void finaliser(value v) {
    T* ptr = (T*)val_data(v);
    delete ptr;
}



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
