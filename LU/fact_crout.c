#include "fact_crout.h"

void fact_crout(double *A, double *L, double* U, int n)
{
	for(size_t i = 0; i < n; i++){
		U[i*n+i] = 1;
	}
	for(int j = 0; j < n; j++){
		for(int i = j; i < n; i++){
			double sum = 0;
			for(int k = 0; k < j; k++){
				sum += L[i*n+k]*U[k*n+j];
			}
			L[i*n+j] = A[i*n+j] - sum;
		}
		for(int i = j; i < n; i++){
			double sum = 0; 
			for(int k = 0; k < j; k++){
				sum += L[j*n+k] * U[k*n+i];
			}
			U[j*n+i] = (L[j*n+j] == 0) ? 0 : (A[j*n+i]-sum)/L[j*n+j];
		}
	}
}