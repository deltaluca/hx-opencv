#include <features2d/features2d.hpp>
#include "utils.h"

DECLARE_KIND(k_KeyPoint);
CPPDECLARE_CONVERT(features2d, KeyPoint);

extern "C" { void features2d_allocateKinds(); }
