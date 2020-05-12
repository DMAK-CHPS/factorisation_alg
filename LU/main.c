#include <stdio.h>
#include <stdlib.h>
#include "fact_doolittle.h"

int main(int argc, char const *argv[])
{
	if(argc < 2){
		fprintf(stderr, "./main [matrix size]\n");
		abort();
	}

	FILE *fa = fopen("A", "r");
	FILE *fl = fopen("L", "w");
	FILE *fu = fopen("U", "w");

	int n = atoi(argv[1]);
	double *A = calloc(n*n, sizeof(double));
	double *L = calloc(n*n, sizeof(double));
	double *U = calloc(n*n, sizeof(double));

	fread(A, sizeof(double), n*n, fa);

	fact_doolittle(A, L, U, n);

	fwrite(L, sizeof(double), n*n, fl);

	fwrite(U, sizeof(double), n*n, fu);

	free(A);
	free(L);
	free(U);

	fclose(fa);
	fclose(fl);
	fclose(fu);

	return 0;
}
