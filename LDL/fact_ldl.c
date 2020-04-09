#include "fact_ldl.h"

void fact_ldl(double *A, double *L, double *D, int n)
{
	for(int j = 0; j < n; j++){
		D[j*n+j] = A[j*n+j];
		L[j*n+j] = 1;
		for(int k = 0; k < j; k++){
			D[j*n+j] -= ((L[j*n+k] * L[j*n+k]) * D[k*n+k]); 
		}
		for(int i = j+1; i < n; i++){
			L[i*n+j] = A[i*n+j];
			for(int k = 0; k < j; k++){
				L[i*n+j] -= (L[i*n+k] * L[j*n+k] * D[k*n+k]);
			}
			L[i*n+j] /= D[j*n+j];
		}
	}
}