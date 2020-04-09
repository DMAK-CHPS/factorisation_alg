#ifndef FACT_SVD_H
#define FACT_SVD_H

#include <string.h>
#include <float.h>
#include <math.h>
#include <stdlib.h>

#define MAX_ITERATION_COUNTS 30 

int fact_svd(double* A, int n, double* U, double* D, double* V);

#endif