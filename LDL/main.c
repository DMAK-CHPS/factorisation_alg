#include <stdlib.h>
#include <stdio.h>
#include "fact_ldl.h"

int main(int argc, char const *argv[])
{
	if(argc < 2){
		fprintf(stderr, "./main [matrix size]\n");
		abort();
	}

	FILE *fa = fopen("A", "r");
	FILE *fl = fopen("L", "w");
	FILE *fd = fopen("D", "w");

	int n = atoi(argv[1]);
	double *A = calloc(n*n, sizeof(double));
	double *L = calloc(n*n, sizeof(double));
	double *D = calloc(n*n, sizeof(double));

	fread(A, sizeof(double), n*n, fa);

	fact_ldl(A, L, D, n);

	fwrite(L, sizeof(double), n*n, fl);

	fwrite(D, sizeof(double), n*n, fd);

	free(A);
	free(L);
	free(D);

	fclose(fa);
	fclose(fl);
	fclose(fd);


/*

	A[0] = 1, A[1] = 1, A[2] = 1, A[3] = 1;
	A[4] = 1, A[5] = 5, A[6] = 5, A[7] = 5;
	A[8] = 1, A[9] = 5, A[10] = 14, A[11] = 14;
	A[12] = 1, A[13] = 5, A[14] = 14, A[15] = 15;

	fact_ldl(A, L, D, n);

	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			for(int k = 0; k < n; k++){
				r[i*n+j] += L[i*n+k] * D[k*n+j];
			}
		}
	}

	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			for(int k = 0; k < n; k++){
				res[i*n+j] += r[i*n+k] * L[j*n+k];
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


	printf("D=\n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%lf ", D[i*n+j]);
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
	free(D);
	free(r);
	free(res);

	return 0;

*/
}