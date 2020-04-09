#include <stdlib.h>
#include <stdio.h>
#include "fact_svd.h"

int main(int argc, char const *argv[])
{
	int n = 4;
	double *a = calloc(n * n, sizeof(double));
	double *u = calloc(n * n, sizeof(double));
	double *w = calloc(n, sizeof(double));
	double *v = calloc(n * n, sizeof(double));

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

	free(a);
	free(u);
	free(w);
	free(v);

	return 0;
}