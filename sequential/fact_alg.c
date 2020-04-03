#include <stdio.h>

#include "fact_alg.h"

void factLU_Doolittle(fmatrix_t A, fmatrix_t L, fmatrix_t U)
{
	for(size_t i = 0; i < A.n; i++){
		for(size_t k = i; k < A.n; k++){
			float sum = 0;
			for(size_t j = 0; j < i; j++){
				printf("calcul de U -- i=%zu k=%zu j=%zu -> L[%zu][%zu](%f) * U[%zu][%zu](%f)\n", i, k, j, i, j, at_i_j(L,i,j), j, k, at_i_j(U, j, k));
				sum += (at_i_j(L,i,j) * at_i_j(U, j, k));
			}
			printf("calcul de U -- A[%zu][%zu](%f)\n\n", i, k, at_i_j(A,i,k));
			at_i_j(U,i,k) = at_i_j(A,i,k) - sum;
		}
		for(size_t k = i; k < A.n; k++){
			if(i == k){
				at_i_j(L, i, i) = 1;
			}else{
				float sum = 0;
				for(size_t j = 0; j < i; j++){
					printf("calcul de L -- i=%zu k=%zu j=%zu -> L[%zu][%zu](%f) * U[%zu][%zu](%f)\n", i, k, j, k, j, at_i_j(L, k, j), j, i, at_i_j(U, j, i));
					sum += (at_i_j(L, k, j) * at_i_j(U, j, i));
				}
				printf("calcul de L -- A[%zu][%zu](%f) - sum / U[%zu][%zu](%f)\n\n", k, i, at_i_j(A,k,i), i, i, at_i_j(U,i,i));
				at_i_j(L, k, i) = (at_i_j(A,k,i) - sum) / at_i_j(U,i,i);
			}	
		}
	}
}

void factLU_Crout(fmatrix_t A, fmatrix_t L, fmatrix_t U)
{
	for(size_t i = 0; i < A.n; i++){
		at_i_j(U,i,i) = 1;
	}
	for(size_t j = 0; j < A.n; j++){
		for(size_t i = j; i < A.n; i++){
			float sum = 0;
			for(size_t k = 0; k < j; k++){
				sum += (at_i_j(L,i,k) * at_i_j(U,k,j));
			}
			at_i_j(L,i,j) = at_i_j(A,i,j) - sum;
		}
		for(size_t i = j; i < A.n; i++){
			float sum = 0; 
			for(size_t k = 0; k < j; k++){
				sum += (at_i_j(L,j,k) * at_i_j(U,k,i));
			}
			at_i_j(U,j,i) = (at_i_j(A,j,i) - sum) / at_i_j(L,j,j);
		}
	}
}

void factQR_Schmidt(fmatrix_t A, fmatrix_t Q, fmatrix_t R)
{
	for(size_t k = 0; k < A.n; k++){
		float sum = 0;
		for(size_t j = 0; j < A.m; j++){
			sum += (at_i_j(A,j,k) * at_i_j(A,j,k));
		}
		at_i_j(R,k,k) = sqrt(sum);
		for(size_t j = 0; j < A.m; j++){
			at_i_j(Q,j,k) = (at_i_j(A,j,k)/at_i_j(R,k,k));
		}
		for(size_t i = k; i < A.n; i++){
			float sum = 0; 
			for(size_t j = 0; j < A.m; j++){
				sum += (at_i_j(A,j,i) * at_i_j(Q,j,k));
			}
			at_i_j(R,k,i) = sum;
			for(size_t j = 0; j < A.m; j++){
				at_i_j(A,j,i) -= (at_i_j(R,k,i) * at_i_j(Q,j,k));
			}
		}
	}
}

void factQR_Householder(fmatrix_t A, fmatrix_t Q, fmatrix_t R)
{
	for(size_t j = 0; j < A.n; j++){
		float sum = 0;
		for(size_t i = j; i < A.m; i++){
			sum += (at_i_j(A,i,j) * at_i_j(A,i,j));
		}
		sum = sqrt(sum);
		at_i_j(R,j,j) = (at_i_j(A,j,j) > 0) ? -sum : sum;
		float fak = sqrt(sum * (sum + abs(at_i_j(A,j,j))));
		at_i_j(A,j,j) -= at_i_j(R,j,j);
		for(size_t k = j; k < A.m; k++){
			at_i_j(A,k,j) = at_i_j(A,k,j)/fak;
		}
		for(size_t i = j+1; i < A.n; i++){
			sum = 0;
			for(size_t k = j; k < A.m; k++){
				sum += (at_i_j(A,k,j) * at_i_j(A,k,i));
			}
			for(size_t k = j; k < A.m; k++){
				at_i_j(A,k,i) -= (at_i_j(A,k,j) * sum);
			}
			at_i_j(R,j,i) = at_i_j(A,j,i);
		}
	}
} 

void factCHolesky(fmatrix_t A, fmatrix_t L)
{
	for(size_t j = 0; j < A.n; j++){
		float v = at_i_j(A,j,j);
		for(size_t k = 0; k < j; k++){
			v -= at_i_j(L,j,k) * at_i_j(L,j,k);
		}
		v = sqrt(v);
		at_i_j(L,j,j) = v;
		float x = 1.0/v;
		for(size_t i = j+1; i < A.n; i++){
			v = at_i_j(A,i,j);
			for(size_t k = 0; k < j; k++){
				v -= at_i_j(L,i,k) * at_i_j(L,j,k);
			}
			at_i_j(L,i,j) = v * x;
		}
	}
}

void factLDL(fmatrix_t A, fmatrix_t L, fmatrix_t D)
{
	for(size_t j = 0; j < A.n; j++){
		at_i_j(D,j,j) = at_i_j(A,j,j);
		at_i_j(L,j,j) = 1;
		for(size_t k = 0; k < j; k++){
			at_i_j(D,j,j) -= ((at_i_j(L,j,k) * at_i_j(L,j,k)) * at_i_j(D,k,k)); 
		}
		for(size_t i = j+1; i < A.n; i++){
			at_i_j(L,i,j) = at_i_j(A,i,j);
			for(size_t k = 0; k < j; k++){
				at_i_j(L,i,j) -= (at_i_j(L,i,k) * at_i_j(L,j,k) * at_i_j(D,k,k));
			}
			at_i_j(L,i,j) /= at_i_j(D,j,j);
		}
	}
}