#ifndef FACT_ALG_H
#define FACT_ALG_H

#include "matrix.h"

void factLU_Doolittle(fmatrix_t A, fmatrix_t L, fmatrix_t U);

void factLU_Crout(fmatrix_t A, fmatrix_t L, fmatrix_t U);

void factQR_Schmidt(fmatrix_t A, fmatrix_t Q, fmatrix_t R);

void factQR_Householder(fmatrix_t A, fmatrix_t Q, fmatrix_t R);

void factCHolesky(fmatrix_t A, fmatrix_t L);

void factLDL(fmatrix_t A, fmatrix_t L, fmatrix_t D);

#endif