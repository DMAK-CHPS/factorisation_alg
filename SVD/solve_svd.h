#ifndef SOLVE_SVD_H
#define SOLVE_SVD_H

#include <string.h>
#include <float.h>
#include <math.h>
#include <stdlib.h>

void solve_svd(double* U, double* D, double* V, double tolerance, int n, double *B, double* x);

#endif