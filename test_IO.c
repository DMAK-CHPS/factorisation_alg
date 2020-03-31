#include <stdlib.h>
#include <stdio.h>
#include <mpi.h>
#include <math.h>
#include <assert.h>

#include "MPI_IO.h"

int main(int argc, char *argv[])
{
	MPI_Init(&argc, &argv);

	// information standard du process
	int rang = 0, size = 0;
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rang);

	// ouverture du fichier	//
	MPI_File f;
	MPI_File_open(MPI_COMM_WORLD, "pamplemousse", MPI_MODE_RDONLY, MPI_INFO_NULL, &f);

	// recuperation de la taille de la matrice n * n
	size_t n = get_size(&f, MPI_FLOAT);

	// test de get_block //
	/*
	// allocation des ressources necessaires
	float *matrix = (float*) malloc(n * n * sizeof(float));
	float *block = (float*) malloc(n * n * sizeof(float));

	// lecture de la matrice en 0
	if(rang == 0){
		MPI_File_read_at(f, 0, matrix, n * n, MPI_FLOAT, MPI_STATUS_IGNORE);

		get_block(f, block, MPI_FLOAT, n, 0, 0, n, n);	
	
		for(size_t i = 0; i < (n * n); i++){
			if(matrix[i] != block[i]){
				fprintf(stderr, "Erreur case n°%zu | matrix[%zu] = %f et block[%zu] = %f\n", i, i, matrix[i], i, block[i]);
			}
		}
	}

	// test de get_cross //
	// allocation des ressources necessaires
	float *matrix = (float*) malloc(n * n * sizeof(float));
	float *cross = (float*) malloc(2 * n * sizeof(float));

	if(rang == 0){
		MPI_File_read_at(f, 0, matrix, n * n, MPI_FLOAT, MPI_STATUS_IGNORE);

		get_cross(f, cross, MPI_FLOAT, n, 49, 49);

		for(size_t i = 0; i < n; i++){
			if(cross[i] != matrix[i*n+49]){
				fprintf(stderr, "Erreur case n°%zu | matrix[%zu] = %f et cross[%zu] = %f\n", i, i*n+49, matrix[i*n+49], i, cross[i]);	
			}
		}
		for(size_t i = 0; i < n; i++){
			if(cross[n+i] != matrix[49*n+i]){
				fprintf(stderr, "Erreur case n°%zu | matrix[%zu] = %f et cross[%zu] = %f\n", i, 49*n+i, matrix[49*n+i], i+n, cross[i+n]);	
			}			
		}
	}

	// test de get_column //
	// allocation des ressources necessaires
	float *matrix = (float*) malloc(n * n * sizeof(float));
	float *column = (float*) malloc(n * sizeof(float));

	if(rang == 0){
		MPI_File_read_at(f, 0, matrix, n * n, MPI_FLOAT, MPI_STATUS_IGNORE);

		get_column(f, column, MPI_FLOAT, n, 49);

		for(size_t i = 0; i < n; i++){
			if(column[i] != matrix[i*n+49]){
				fprintf(stderr, "Erreur case n°%zu | matrix[%zu] = %f et column[%zu] = %f\n", i, i*n+49, matrix[i*n+49], i, column[i]);	
			}
		}
	}
*/

	// test de get_column //
	// allocation des ressources necessaires
	float *matrix = (float*) malloc(n * n * sizeof(float));
	float *line = (float*) malloc(n * sizeof(float));

	if(rang == 0){
		MPI_File_read_at(f, 0, matrix, n * n, MPI_FLOAT, MPI_STATUS_IGNORE);

		get_line(f, line, MPI_FLOAT, n, 49);

		for(size_t i = 0; i < n; i++){
			if(line[i] != matrix[49*n+i]){
				fprintf(stderr, "Erreur case n°%zu | matrix[%zu] = %f et line[%zu] = %f\n", i, 49*n+i, matrix[49*n+i], i, line[i]);	
			}	
		}
	}

/*	

	// test de get_case //
	// allocation des ressources necessaires
	float *matrix = (float*) malloc(n * n * sizeof(float));
	float *Case = (float*) malloc(sizeof(float));

	if(rang == 0){
		MPI_File_read_at(f, 0, matrix, n * n, MPI_FLOAT, MPI_STATUS_IGNORE);

		get_case(f, Case, MPI_FLOAT, n, 49, 49);

		if(*Case != matrix[49*n + 49]){
			fprintf(stderr, "Erreur case n°%zu | matrix[%zu] = %f et Case[%zu] = %f\n", 0, 49*n+49, matrix[49*n+49], 0, *Case);
		}
	}	

*/

	// fermeture du ficher
	MPI_File_close(&f);
	

	MPI_Finalize();























/*
	int count = 0;
	float *array = (float*)malloc(sizeof(float) * 1000);
	float *cross = NULL;
	size_t *data_size = (size_t*)malloc(sizeof(size_t));
	long long int *matrix_size = (long long int*)malloc(sizeof(long long int));;


	MPI_File_read_at(f, 0, array, 1000, MPI_FLOAT, MPI_STATUS_IGNORE);

	fprintf(stderr, "array = %p\n", array);

	if(rang == 0){
		for(size_t i = 0; i < 1000; i++){
			fprintf(stderr, "rang %d = %f\n", rang, array[i]);
		}
	}

	get_block(&f, &cross, 0, 0, 100, 100, data_size, matrix_size);

	fprintf(stderr, "%zu %llu\n", *data_size, *matrix_size);

	if(rang == 0){
		for(size_t i = 0; i < data_size; i++){
			fprintf(stderr, "rang %d = %f\n", rang, array[i]);
		}		
	}

	MPI_File_close(&f);
	
	MPI_Finalize();
*/

	return 0;
}