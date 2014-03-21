 // X.cpp
#include <R.h>
#include "X.h"

static Y y;

X::X()  { REprintf("constructor X\n"); }
X::~X() { REprintf("destructor X\n");  }
Y::Y()  { REprintf("constructor Y\n"); }
Y::~Y() { REprintf("destructor Y\n");  }
