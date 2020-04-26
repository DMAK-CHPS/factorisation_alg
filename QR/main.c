#include <stdlib.h>
#include <stdio.h>
#include "fact_schmidt.h"

int main(int argc, char const *argv[])
{

	if(argc < 2){
		fprintf(stderr, "./main [matrix size]\n");
		abort();
	}

	FILE *fa = fopen("A", "r");
	FILE *fq = fopen("Q", "w");
	FILE *fr = fopen("R", "w");

	int n = atoi(argv[1]);
	double *A = calloc(n*n, sizeof(double));
	double *Q = calloc(n*n, sizeof(double));
	double *R = calloc(n*n, sizeof(double));

	fread(A, sizeof(double), n*n, fa);

	fact_schmidt(A, Q, R, n);

	fwrite(Q, sizeof(double), n*n, fq);

	fwrite(R, sizeof(double), n*n, fr);

	free(A);
	free(Q);
	free(R);

	fclose(fa);
	fclose(fq);
	fclose(fr);

	/*
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

	*/
}