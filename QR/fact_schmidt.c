#include "fact_schmidt.h"

void fact_schmidt(double *A, double *Q, double *R, int n)
{
	for(int k = 0; k < n; k++){
		double sum = 0;
		for(int j = 0; j < n; j++){
			sum += (A[j*n+k] * A[j*n+k]);
		}
		
		R[k*n+k] = sqrt(sum);
		for(int j = 0; j < n; j++){
			Q[j*n+k] = (R[k*n+k] == 0) ? 0 : (A[j*n+k]/R[k*n+k]);
		}
		for(int i = k; i < n; i++){
			double sum = 0; 
			for(int j = 0; j < n; j++){
				sum += A[j*n+i] * Q[j*n+k];
			}
			R[k*n+i] = sum;
			for(int j = 0; j < n; j++){
				A[j*n+i] -= R[k*n+i] * Q[j*n+k];
			}
		}
	}
}