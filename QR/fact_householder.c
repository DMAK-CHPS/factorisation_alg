#include "fact_householder.h"

void fact_householder(double *A, double *Q, double *R, int n)
{
	for(int j = 0; j < n; j++){
		double sum = 0;
		for(int i = j; i < n; i++){
			sum += A[i*n+j] * A[i*n+j];
		}
		R[j*n+j] = (A[j*n+j] > 0) ? -sqrt(sum) : sqrt(sum);
		double fak = sqrt(sum * (sum + abs(A[j*n+j])));
		A[j*n+j] -= R[j*n+j];
		for(int k = j; k < n; k++){
			A[k*n+j] = A[k*n+j]/fak;
		}
		for(int i = j+1; i < n; i++){
			sum = 0;
			for(int k = j; k < n; k++){
				sum += (A[k*n+j] * A[k*n+i]);
			}
			for(int k = j; k < n; k++){
				A[k*n+i] -= (A[k*n+j] * sum);
			}
		}
	}
}