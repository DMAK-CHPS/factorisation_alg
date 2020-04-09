#include "fact_doolittle.h"

void fact_doolittle(double *A, double *L, double *U, int n)
{
	for(int i = 0; i < n; i++){
		for(int k = i; k < n; k++){
			double sum = 0;
			for(int j = 0; j < i; j++){
				sum += (L[i*n+j] * U[j*n+k]);
			}
			U[i*n+k] = A[i*n+k] - sum;
		}
		for(int k = i; k < n; k++){
			if(i == k){
				L[i*n+i] = 1.0;
			}else{
				double sum = 0;
				for(int j = 0; j < i; j++){
					sum += (L[k*n+j] * U[j*n+i]);
				}
				L[k*n+i] = (U[i*n+i] == 0) ? 0 : (A[k*n+i]-sum)/U[i*n+i];
			}	
		}
	}
}