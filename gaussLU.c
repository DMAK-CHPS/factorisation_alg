#include <stdlib.h>
#include <math.h>
#include <stdio.h>
#include <mpi.h>
#include <time.h>
#include <unistd.h>
#include <string.h>
#include <stddef.h>

#include "matrix.h"
#include "MPI_IO.h"

int main(int argc, char *argv[])
{
	// entree
	MPI_Init(&argc, &argv);

	// informations standards
	int rang = 0, size = 0;
	MPI_Comm_size(MPI_COMM_WORLD, &size);
	MPI_Comm_rank(MPI_COMM_WORLD, &rang);

	//////////////////////////////////////////////
	//				Initialisation				//
	//////////////////////////////////////////////
	
	// ouverture du fichier	//
	MPI_File f;
	MPI_File_open(MPI_COMM_WORLD, "pamplemousse", MPI_MODE_RDONLY, MPI_INFO_NULL, &f);

	// recuperation de la taille de la matrice n * n //
	size_t n = get_size(&f, MPI_FLOAT);

	// allocation du tableau de croix
	size_t array_size = (rang < (n % size)) ? (n / size + 1) : (n / size);

	float **cross_array = (float**)malloc(sizeof(float*) * array_size);
	
	for(size_t i = 0; i < array_size; i++){
		cross_array[i] = (float*)malloc(sizeof(float) * 2 * n);
	}

	// redcuperation des croix	//
	for(size_t i = rang, cpt = 0; i < n; i += size, cpt++){
		get_cross(f, cross_array[cpt], MPI_FLOAT, n, i, i);
	}

	//////////////////////////////////////////////
	//					Travail					//
	//////////////////////////////////////////////

	// nombre de case traitees	//
	size_t nb_step = 0;

	// croix traitee
	float *update_cross = malloc(sizeof(float) * 2 * n);

	// tant que toutes les cases du tableau n'ont pas ete traitees	//
	while(nb_step < n){
		// nombre de rotation effectuee //
		size_t z = nb_step/size;

		// Calcul de la croix d'intersection nb_step nb_step //
		if(nb_step % size == rang){
			// traitement de la case du tableau //

			fprintf(stderr, "Traitement de A[%zu][%zu] = %f par le rang n°%d\n", nb_step, nb_step, cross_array[z][nb_step], rang);

			for(size_t i = nb_step + 1; i < n; i++){
				// A[i][nb_step] /= A[nb_step][nb_step] //				
				cross_array[z][i] /= cross_array[z][nb_step];
			}

			for(size_t i = 0; i < 2 * n; i++){
				update_cross[i] = cross_array[z][i];
			}	
		}

		MPI_Bcast(update_cross, 2 * n, MPI_FLOAT, nb_step % size, MPI_COMM_WORLD);
		// mise a jour des cases ]nb_step:n[ ]nb_step:n[ // 
		size_t start = (rang <= (nb_step % size)) ? z+1: z;

		for(size_t i = start; i < array_size; i++){
			// centre de la croix //
			size_t centre = i * size + rang;

			// mise a jour du centre //
			cross_array[i][centre] = cross_array[i][centre + n] = cross_array[i][centre] - (update_cross[centre] * update_cross[n + centre]);

			for(size_t j = centre + 1; j < n; j++){
				// mise a jour de la colonnne //
				cross_array[i][j] -= (update_cross[n + centre] * update_cross[j]);

				// mise a jour de la ligne 	//
				cross_array[i][j] -= (update_cross[centre] * update_cross[n + j]);
			}
		}

		MPI_Barrier(MPI_COMM_WORLD);
		nb_step++;
	}

	//////////////////////////////////////////////
	//			Ecriture des resultats			//
	//////////////////////////////////////////////
	
	MPI_File f_out;
	MPI_File_open(MPI_COMM_WORLD, "pamplemousse_out", MPI_MODE_RDWR | MPI_MODE_CREATE, MPI_INFO_NULL, &f_out);

	if(rang == 0){
		init_matrix(f_out,	MPI_FLOAT, 	n);	
	}
	MPI_Barrier(MPI_COMM_WORLD);

	// ecriture des croix	//
	for(size_t i = rang, cpt = 0; i < n; i += size, cpt++){
		set_cross(f_out, cross_array[cpt], MPI_FLOAT, n, i, i);
	}

	for(size_t i = 0; i < array_size; i++){
		free(cross_array[i]);
	}

	free(cross_array);

	// fermeture du ficher
	MPI_File_close(&f_out);

	// fermeture du ficher
	MPI_File_close(&f);
	
	// sortie
	MPI_Finalize();

	return 0;
}