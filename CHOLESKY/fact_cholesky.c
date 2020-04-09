#include "fact_cholesky.h"

void fact_cholesky(double *A, double *L, int n)
{
	for(int j = 0; j < n; j++){
		double v = A[j*n+j];
		for(int k = 0; k < j; k++){
			v -= L[j*n+k] * L[j*n+k];
		}
		v = sqrt(v);
		L[j*n+j] = v;
		double x = 1.0/v;
		for(int i = j+1; i < n; i++){
			v = A[i*n+j];
			for(int k = 0; k < j; k++){
				v -= L[i*n+k] * L[j*n+k];
			}
			L[i*n+j] = v * x;
		}
	}
}