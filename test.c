#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#include "matrix.h"
#include "fact_alg.h"

int main(int argc, char const *argv[])
{
/*
	fmatrix_t A, L, U;

	construct_fmatrix(A, 3, 3);
	construct_fmatrix(L, 3, 3);
	construct_fmatrix(U, 3, 3);

	at_i_j(A, 0, 0) = 2;
	at_i_j(A, 0, 1) = -1;
	at_i_j(A, 0, 2) = -2;

	at_i_j(A, 1, 0) = -4;
	at_i_j(A, 1, 1) = 6;
	at_i_j(A, 1, 2) = 3;


	at_i_j(A, 2, 0) = -4;
	at_i_j(A, 2, 1) = -2;
	at_i_j(A, 2, 2) = 8;

	print_matrix(A);
	print_matrix(L);
	print_matrix(U);

	//factLU_Doolittle(A,L,U);
	//factLU_Crout(A,L,U);

	mult_matrix(L, U, A);

	print_matrix(A);
	print_matrix(L);
	print_matrix(U);

	free_matrix(A);
	free_matrix(L);
	free_matrix(U);

	fmatrix_t A, Q, R;

	construct_fmatrix(A, 3, 3);
	construct_fmatrix(Q, 3, 3);
	construct_fmatrix(R, 3, 3);

	at_i_j(A, 0, 0) = 12;
	at_i_j(A, 0, 1) = -51;
	at_i_j(A, 0, 2) = 4;

	at_i_j(A, 1, 0) = 6;
	at_i_j(A, 1, 1) = 167;
	at_i_j(A, 1, 2) = -68;


	at_i_j(A, 2, 0) = -4;
	at_i_j(A, 2, 1) = 24;
	at_i_j(A, 2, 2) = -41;

	print_matrix(A);
	print_matrix(Q);
	print_matrix(R);

	factQR_Householder(A,Q,R);

	//mult_matrix(Q, R, A);

	print_matrix(A);
	print_matrix(Q);
	print_matrix(R);

	free_matrix(A);
	free_matrix(Q);
	free_matrix(R);
*/

	fmatrix_t A, L, D;

	construct_fmatrix(A, 3, 3);
	construct_fmatrix(L, 3, 3);
	construct_fmatrix(D, 3, 3);

	at_i_j(A, 0, 0) = 4;
	at_i_j(A, 0, 1) = 12;
	at_i_j(A, 0, 2) = -16;

	at_i_j(A, 1, 0) = 12;
	at_i_j(A, 1, 1) = 37;
	at_i_j(A, 1, 2) = -43;


	at_i_j(A, 2, 0) = -16;
	at_i_j(A, 2, 1) = -43;
	at_i_j(A, 2, 2) = 98;

	print_matrix(A);
	print_matrix(L);
	print_matrix(D);

	factCHolesky(A,L);

	print_matrix(A);
	print_matrix(L);
	print_matrix(D);

	free_matrix(A);
	free_matrix(L);
	free_matrix(D);

	return 0;
}