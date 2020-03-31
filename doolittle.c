#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <mpi.h>
#include <time.h>
#include <unistd.h>
#include <string.h>
#include <stddef.h>

#include "matrix.h"

#define N 10000

#define DATA_SIZE ((2 * N) + 1)

void alloc_work_array(float **work_array)
{
	(*work_array) = malloc(sizeof(float) * DATA_SIZE);
}

void free_work_array(float **work_array)
{
	free((*work_array));
}

void alloc_result_array(float ***result_array, int size)
{
	(*result_array) = calloc(sizeof(float*), (size - 1));
}

void free_result_array(float ***result_array, int size)
{
	free((*result_array));
}

void prepare_data(size_t i, size_t j, fmatrix_t A, fmatrix_t L, fmatrix_t U, float *data)
{
	// J'initialise ce sur quoi il va bosser //
	for(size_t k = 0; k < N; k++){
		if(k <= i){
			data[k] = at_i_j(U,k,j);
		}else{
			data[k] = NAN;
		}
	}
	// L[i,0] => L[i,j-1] et A[i,j] => A[i,N-1]	//
	for(size_t k = 0; k < N; k++){
		if(k < j){
			data[k+N] = at_i_j(L,i,k);
		}else{
			data[k+N] = NAN;
		}
	}

	data[DATA_SIZE-1] = at_i_j(A,i,j);
}

int find_work(float **result_array, int left, int right)
{
	if(left == right){
		return (result_array[left] == NULL) ? left : -1;
	}else{
		int pivot = left + (right - left)/2, res = -1;

		if((res = find_work(result_array, left, pivot)) != -1){
			return res;
		}else if((res = find_work(result_array, pivot + 1, right)) != -1){
			return res;
		}else{
			return -1;
		}
	}
}

void send_work(size_t i, size_t j, fmatrix_t A, fmatrix_t L, fmatrix_t U, float *data, float **resultats, int dest, char matrix)
{
	// prépare le travail pour le destinataire
	prepare_data(i, j, A, L, U, data);

	// envoie le travail au destinataire
	MPI_Send(data, DATA_SIZE, MPI_FLOAT, dest+1, matrix, MPI_COMM_WORLD);
				
	// sauvegarde de la ou doit etre ecrit le resultat
	resultats[dest] = (matrix) ? &at_i_j(L,i,j) : &at_i_j(U,i,j);	
}

void receive_result(float **result_array, MPI_Status status)
{
	// receptionne le message avec le destinataire
	MPI_Recv(result_array[status.MPI_SOURCE-1], 1, MPI_FLOAT, status.MPI_SOURCE, 1, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
			
	// remise à zero des resultats
	result_array[status.MPI_SOURCE-1] = NULL;
}

void wait_work(int size, float **resultats)
{
	for(int k = 0; k < size-1; k++){
		if(resultats[k] != NULL){
			// receptionne le message avec le destinataire
			MPI_Recv(resultats[k], 1, MPI_FLOAT, k+1, 1, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
		
			// remise à zero
			resultats[k] = NULL;				
		}
	}
}

void master(int rang, int size)
{
	// creation du tableau de resultats //
	float **result_array;
	alloc_result_array(&result_array, size);

	// creation du tableau de travail
	float *work_array;
	alloc_work_array(&work_array);

	// processus esclave destinataire 	//
	int dest = -1;

	//flag, requete et status pour la reception de resultats //
	MPI_Request request;
	MPI_Status status;
	int flag = 0;

	// Initialisation des matrices	//
	fmatrix_t A, L, U, R;

	construct_fmatrix(A, N, N);
	construct_fmatrix(L, N, N);
	construct_fmatrix(U, N, N);
	construct_fmatrix(R, N, N);

	rand_matrix(A);

	// Algorithme
	for(size_t i = 0; i < N; i++){
		// Travail pour U 	//
		for(size_t j = i; j < N;){
			// préparation du travail et envoi si necessaire	//
			while((dest = find_work(result_array, 0, size-2)) != -1 && j < N){
				send_work(i, j, A, L, U, work_array, result_array, dest, 0);
				j++;
			}			

			// reception des resultats
			do{
				MPI_Iprobe(MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, &flag, &status);
				
				if(flag)	
					receive_result(result_array, status);	
			}while(flag);
		}

		// attente du travail de la ligne	//
		wait_work(size, result_array);

		// Travail pour L 	//
		for(size_t j = i; j < N;){
			// préparation du travail et envoi si necessaire	//
			while((dest = find_work(result_array, 0, size-2)) != -1 && j < N){
				send_work(j, i, A, L, U, work_array, result_array, dest, 1);
				j++;
			}			

			// reception des resultats
			do{
				MPI_Iprobe(MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, &flag, &status);
				
				if(flag)	
					receive_result(result_array, status);	
			}while(flag);
		}		

		// attente du travail de la colonne	//
		wait_work(size, result_array);
	}

	// envoi du message de sortie a tous les esclaves
	for(size_t i = 1; i < size; i++){
		MPI_Send(NULL, 0, MPI_INT, i, 2, MPI_COMM_WORLD);			
	}

/*
	// libération et affichage des matrices
	fprintf(stderr, "\n");
	
	print_matrix(L);
	print_matrix(U);
	mult_matrix(L,U,R);
	print_matrix(A);
	print_matrix(R);

	free_matrix(A);
	free_matrix(L);
	free_matrix(U);
	free_matrix(R);
*/

	// liberation du tableau de resultats //
	free_result_array(&result_array, size);

	// creation du tableau de travail
	free_work_array(&work_array);
}

void print_data(const float * data, int rang, int flag)
{
	char buff[100] = {}, buff_total[300] = {};

	if(flag){
		sprintf(buff, "L -> ");
		strcat(buff_total, buff);
	}else{
		sprintf(buff, "U -> ");
		strcat(buff_total, buff);
	}

	sprintf(buff, "Rang %d: ", rang);
	strcat(buff_total, buff);

	for(size_t k = 0; k < DATA_SIZE-1; k++){
		sprintf(buff, "%.0f ", data[k]);
		strcat(buff_total, buff);
	}
			
	sprintf(buff, " |%.0f|\n", data[DATA_SIZE-1]);
	strcat(buff_total, buff);
	fprintf(stderr, "%s", buff_total);

	fflush(stderr);
}

void compute_U(float *res, const float *data)
{
	float sum = 0;
	size_t k;

	for(k = 0; k < (DATA_SIZE-1)/2 && (!isnan(data[k])) && (!isnan(data[N+k])); k++){
		sum += data[k] * data[N+k];
	}

	(*res) -= sum;
}

void compute_L(float *res, const float *data)
{
	float sum = 0;
	size_t k;

	for(k = 0; k < (DATA_SIZE-1)/2 && (!isnan(data[k])) && (!isnan(data[N+k])); k++){
		sum += data[k] * data[N+k];
	}

	(*res) = ((*res) - sum) / data[k];
}

void slave(int rang, int size)
{
	MPI_Status status;
	float *data = malloc(sizeof(float) * DATA_SIZE);
	float res = 0;

	while(1){
		MPI_Probe(0, MPI_ANY_TAG, MPI_COMM_WORLD, &status);

		// Travail sur U
		if(status.MPI_TAG == 0){
			MPI_Recv(data, DATA_SIZE, MPI_FLOAT, 0, status.MPI_TAG, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

			res = data[DATA_SIZE-1];

			compute_U(&res, data);
		
			MPI_Send(&res, 1, MPI_FLOAT, 0, 1, MPI_COMM_WORLD);
		}

		// Travail sur L
		else if(status.MPI_TAG == 1){
			MPI_Recv(data, DATA_SIZE, MPI_FLOAT, 0, status.MPI_TAG, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

			res = data[DATA_SIZE-1];

			compute_L(&res, data);

			MPI_Send(&res, 1, MPI_FLOAT, 0, 1, MPI_COMM_WORLD);
		}

		// Quitter
		else{
			// message stop
			MPI_Recv(NULL, 0, MPI_INT, 0, status.MPI_TAG, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

			// quit
			break;
		}
	}

	free(data);
}

int main(int argc, char *argv[])
{
	srand(time(NULL));
	MPI_Init(&argc, &argv);

	int rang = 0, size = 0;

	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rang);


	if(rang == 0){
		master(rang, size);
	}else{
		slave(rang, size);	
	}

	MPI_Finalize();

	return 0;
}