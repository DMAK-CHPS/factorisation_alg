#include <stdlib.h>
#include <stdio.h>
#include "fact_schmidt.h"
#include "fact_householder.h"

int main(int argc, char const *argv[])
{
	int n = 4;
	double *A = calloc(n*n, sizeof(double));
	double *Q = calloc(n*n, sizeof(double));
	double *R = calloc(n*n, sizeof(double));
	double *res = calloc(n*n, sizeof(double));

	for(int i = 0; i < n*n; i++){
		A[i] = i+1;
	}

	fact_schmidt(A, Q, R, n);

	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			for(int k = 0; k < n; k++){
				res[i*n+j] += Q[i*n+k] * R[k*n+j];
			}
		}
	}

	printf("A=\n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%lf ", A[i*n+j]);
		}
		printf("\n");
	}

	printf("Q=\n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%lf ", Q[i*n+j]);
		}
		printf("\n");
	}


	printf("R=\n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%lf ", R[i*n+j]);
		}
		printf("\n");
	}

	printf("RES=\n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%lf ", res[i*n+j]);
		}
		printf("\n");
	}

	free(A);
	free(Q);
	free(R);
	free(res);




	return 0;
}