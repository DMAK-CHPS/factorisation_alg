#include <stdlib.h>
#include <stdio.h>
#include "fact_svd.h"

int main(int argc, char const *argv[])
{
	if(argc < 2){
		fprintf(stderr, "./main [matrix size]\n");
		abort();
	}

	FILE *fa = fopen("A", "r");
	FILE *fu = fopen("U", "w");
	FILE *fw = fopen("W", "w");
	FILE *fv = fopen("V", "w");

	int n = atoi(argv[1]);
	double *A = calloc(n*n, sizeof(double));
	double *U = calloc(n*n, sizeof(double));
	double *W = calloc(n*n, sizeof(double));
	double *V = calloc(n*n, sizeof(double));

	fread(A, sizeof(double), n*n, fa);

	fact_svd(A, n, U, W, V);

	fwrite(U, sizeof(double), n*n, fu);
	fwrite(W, sizeof(double), n*n, fw);
	fwrite(V, sizeof(double), n*n, fv);

	free(A);
	free(U);
	free(W);
	free(V);

	fclose(fa);
	fclose(fu);
	fclose(fw);
	fclose(fv);

	return 0;

/*
	int n = 4;
	double *a = calloc(n * n, sizeof(double));
	double *u = calloc(n * n, sizeof(double));
	double *w = calloc(n, sizeof(double));
	double *v = calloc(n * n, sizeof(double));
	double *res = calloc(n * n, sizeof(double));
	double *r = calloc(n * n, sizeof(double));

	for(int i = 0; i < n*n; i++){
		a[i] = 68-3*i;
	}

	printf("a = \n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%.2f ", a[i*n+j]);
		}
		printf("\n");
	}

	printf("u = \n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%.2f ", u[i*n+j]);
		}
		printf("\n");
	}

	printf("w = \n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			if(i == j)
				printf("%.2f ", w[i]);
			else
				printf("0.0 ");
		}
		printf("\n");
	}

	printf("v = \n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%.2f ", v[i*n+j]);
		}
		printf("\n");
	}

	fact_svd(a, n, u, w, v);

	for(int i = 0; i < n*n; i++){
		a[i] = 68-3*i;
	}

	printf("a = \n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%.2f ", a[i*n+j]);
		}
		printf("\n");
	}

	printf("u = \n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%.2f ", u[i*n+j]);
		}
		printf("\n");
	}

	printf("w = \n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			if(i == j)
				printf("%.2f ", w[i]);
			else
				printf("0.0 ");
		}
		printf("\n");
	}

	printf("v = \n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%.2f ", v[i*n+j]);
		}
		printf("\n");
	}

	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			for(int k = 0; k < n; k++){
				r[i*n+j] += u[i*n+k] * w[k*n+j];
			}
		}
	}

	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			for(int k = 0; k < n; k++){
				res[i*n+j] += r[i*n+k] * v[j*n+k];
			}
		} 
	}


	printf("res = \n");
	for(int i = 0; i < n; i++){
		for(int j = 0; j < n; j++){
			printf("%.2f ", res[i*n+j]);
		}
		printf("\n");
	}

	free(a);
	free(u);
	free(w);
	free(v);
	free(res);
	free(r);
*/
	return 0;
}