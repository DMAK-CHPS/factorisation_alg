#include <stdio.h>
#include <stdlib.h>
#include "fact_doolittle.h"
#include "fact_crout.h"

int main(int argc, char const *argv[])
{
	int n = 4;
	double *A = calloc(n*n, sizeof(double));
	double *L = calloc(n*n, sizeof(double));
	double *U = calloc(n*n, sizeof(double));
	double *res = calloc(n*n, sizeof(double));

	for(int i = 0; i < n*n; i++){
		A[i] = i+1;
	}

	fact_crout(A, L, U, n);

	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			for(int k = 0; k < n; k++){
				res[i*n+j] += L[i*n+k] * U[k*n+j];
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

	printf("L=\n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%lf ", L[i*n+j]);
		}
		printf("\n");
	}


	printf("U=\n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%lf ", U[i*n+j]);
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
	free(L);
	free(U);
	free(res);

	return 0;
}