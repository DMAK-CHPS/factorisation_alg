#ifndef MATRIX_H
#define MATRIX_H

#define construct_fmatrix(_M, _l, _c)	(_M.matrix = calloc(_l*_c, sizeof(float)),_M.n = _l,_M.m = _c)
#define construct_dmatrix(_M, _l, _c)	(_M.matrix = calloc(_l*_c, sizeof(double)),_M.n = _l,_M.m = _c)

#define free_matrix(_M)				(free(_M.matrix))


#define mult_matrix(_A, _B, _C)											\
	for(size_t i = 0; i < _A.n; i++){									\
		for(size_t j = 0; j < _B.m; j++){								\
			at_i_j(_C,i,j) = 0;											\
			for(size_t k = 0; k < _A.m; k++){							\
				at_i_j(_C,i,j) += at_i_j(_A, i, k) * at_i_j(_B, k, j);	\
			}															\
		}																\
	}

#define print_matrix(_M)																												\
	for(size_t i = 0; i < _M.n; i++){									\
		for(size_t j = 0; j < _M.m; j++){								\
			printf("%.1lf\t", (double)at_i_j(_M, i, j));				\
		}																\
		printf("\n");													\
	}																	\
	printf("\n");


#define rand_matrix(_M)																												\
	for(size_t i = 0; i < _M.n; i++){									\
		for(size_t j = 0; j < _M.m; j++){								\
			at_i_j(_M, i, j) = rand()%100+1;							\
		}																\
	}																	\


#define at_i_j(_M, _i, _j)				(_M.matrix[(_i * _M.m) + _j])

typedef struct fmatrix{
	float *matrix;
	size_t n;
	size_t m;
}fmatrix_t;

typedef struct dmatrix{
	double *matrix;
	size_t n;
	size_t m;
}dmatrix_t;

#endif