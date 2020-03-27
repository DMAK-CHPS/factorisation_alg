#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <mpi.h>
#include <time.h>
#include <unistd.h>
#include <string.h>
#include <stddef.h>

#include "matrix.h"

#define N 10

#define DATA_SIZE ((2 * N) + 1)

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

void send_work(size_t i, size_t j, fmatrix_t A, fmatrix_t L, fmatrix_t U, float *data, float **resultats, MPI_Status status, char matrix)
{
	// receptionne le message avec le destinataire
	MPI_Recv(NULL, 0, MPI_INT, status.MPI_SOURCE, 0, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

	// prépare le travail pour le destinataire
	prepare_data(i, j, A, L, U, data);

	// envoie le travail au destinataire
	MPI_Send(data, DATA_SIZE, MPI_FLOAT, status.MPI_SOURCE, matrix, MPI_COMM_WORLD);
				
	// sauvegarde de la ou doit etre ecrit le resultat
	resultats[status.MPI_SOURCE-1] = (matrix) ? &at_i_j(L,i,j) : &at_i_j(U,i,j);	
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

void receive_result(float **resultats, MPI_Status status)
{
	// receptionne le message avec le destinataire
	MPI_Recv(resultats[status.MPI_SOURCE-1], 1, MPI_FLOAT, status.MPI_SOURCE, 1, MPI_COMM_WORLD, MPI_STATUS_IGNORE);
			
	// remise à zero
	resultats[status.MPI_SOURCE-1] = NULL;
}



void master(int rang, int size)
{
	MPI_Status status;
	float *data = malloc(sizeof(float) * DATA_SIZE);
	float **resultats = calloc((size-1), sizeof(float*));
	int dest = 0;
	fmatrix_t A, L, U, R;

	construct_fmatrix(A, N, N);
	construct_fmatrix(L, N, N);
	construct_fmatrix(U, N, N);
	construct_fmatrix(R, N, N);


	rand_matrix(A);
	fprintf(stderr, "Matrice A:\n");
	print_matrix(A);
	
	fprintf(stderr, "Matrice R:\n");
	print_matrix(R);

	for(size_t i = 0; i < N; i++){
		// Travail pour U
		for(size_t j = i; j < N;){
			// Attente de message			
			MPI_Probe(MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, &status);

			// Demande de travail
			if(status.MPI_TAG == 0){
				send_work(i, j, A, L, U, data, resultats, status, 0);
				j = j + 1;
			}

			// Resultat du travail
			else{
				receive_result(resultats, status);
			}
		}

		wait_work(size, resultats);

		// Travail pour L
		for(size_t j = i; j < N; ){
			// Attente de message			
			MPI_Probe(MPI_ANY_SOURCE, MPI_ANY_TAG, MPI_COMM_WORLD, &status);

			// Demande de travail
			if(status.MPI_TAG == 0){
				send_work(j, i, A, L, U, data, resultats, status, 1);
				j = j + 1;
			}

			// Resultat du travail
			else{
				receive_result(resultats, status);
			}		
		}

		wait_work(size, resultats);
	}

	for(size_t i = 1; i < size; i++){
		MPI_Send(NULL, 0, MPI_INT, i, 2, MPI_COMM_WORLD);			
	}

	fprintf(stderr, "\n");
	
	fprintf(stderr, "Matrice L:\n");
	print_matrix(L);
	fprintf(stderr, "Matrice U:\n");
	print_matrix(U);
	mult_matrix(L,U,R);
	fprintf(stderr, "Matrice A:\n");
	print_matrix(A);
	fprintf(stderr, "Matrice R = L*U:\n");
	print_matrix(R);

	free_matrix(A);
	free_matrix(L);
	free_matrix(U);
	free_matrix(R);

	free(data);
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
		// Demande de travail à 0
		MPI_Send(NULL, 0, MPI_INT, 0, 0, MPI_COMM_WORLD);

		MPI_Probe(0, MPI_ANY_TAG, MPI_COMM_WORLD, &status);

		// Travail sur U
		if(status.MPI_TAG == 0){
			MPI_Recv(data, DATA_SIZE, MPI_FLOAT, 0, status.MPI_TAG, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

			res = data[DATA_SIZE-1];

			compute_U(&res, data);

			//print_data(data, rang, status.MPI_TAG);

			//sleep(rand()%2+1);			
		
			MPI_Send(&res, 1, MPI_FLOAT, 0, 1, MPI_COMM_WORLD);
		}

		// Travail sur L
		else if(status.MPI_TAG == 1){
			MPI_Recv(data, DATA_SIZE, MPI_FLOAT, 0, status.MPI_TAG, MPI_COMM_WORLD, MPI_STATUS_IGNORE);

			res = data[DATA_SIZE-1];

			compute_L(&res, data);

			//print_data(data, rang, status.MPI_TAG);

			//sleep(rand()%2+1);

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