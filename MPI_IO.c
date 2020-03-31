#include "MPI_IO.h"

size_t get_size(MPI_File *f, 				// fichier MPI //
				MPI_Datatype type)			// taille d'un element (exemple: sizeof(float))	//
{
	long long int matrix_size;
	int size_of_elem;
	MPI_File_get_size (*f, &matrix_size);
	MPI_Type_size(type, &size_of_elem);
	return sqrt(matrix_size / size_of_elem);
}

void get_block(	MPI_File f,					//	fichier MPI	// 
				void *array,				//	tableau dans le quel est alloué l'espace necessaire	//
				MPI_Datatype type, 			// 	type de données a lire	//
				size_t n,					//	taille de la matrice	//
				size_t ia, 					//	coordonnées en i de la 1ere case //
				size_t ja,					//	coordonnées en j de la 1ere case //
				size_t ib, 					//	coordonnées en i de la 2nd case //
				size_t jb)					//	coordonnées en j de la 2nd case //
{	
	// verifiaction des données
	assert(ia <= ib && ja <= jb && ib <= n && jb <= n);

	// recuperation de la taille du type
	int size_of_elem;
	MPI_Type_size(type, &size_of_elem);

	// recuperation du block
	for(size_t y = ia, cpt = 0; y < ib; y++){
		MPI_File_read_at(f, ((y * n) + ja) * size_of_elem, array + (cpt*size_of_elem), (jb - ja), type, MPI_STATUS_IGNORE);
		cpt += (jb - ja);
	}
}

void get_cross(	MPI_File f,					//	fichier MPI	// 
				void *array,				//	tableau dans le quel est alloué l'espace necessaire	//
				MPI_Datatype type, 			// 	type de données a lire	//
				size_t n,					//	taille de la matrice	//
				size_t i, 					//	coordonnées en i de la case d'intersection 	//
				size_t j)					//	coordonnées en j de la case d'intersection	//
{	
	// verifiaction des données
	assert(i < n && j < n);

	// recuperation de la taille du type
	int size_of_elem;
	MPI_Type_size(type, &size_of_elem);

	// case ou ecrire dans array
	size_t cpt = 0;
	
	// lecture des colonnes
	for(size_t y = 0; y < n; y++){
		MPI_File_read_at(f, ((y * n) + j) * size_of_elem, array + (cpt*size_of_elem), 1, type, MPI_STATUS_IGNORE);
		cpt++;
	}
	// lecture de la ligne
	MPI_File_read_at(f, (i*n) * size_of_elem, array + (cpt*size_of_elem), n, type, MPI_STATUS_IGNORE);
	cpt += n;
}

void get_column(MPI_File f,					//	fichier MPI	// 
				void *array,				//	tableau dans le quel est alloué l'espace necessaire	//
				MPI_Datatype type, 			// 	type de données a lire	//
				size_t n,					//	taille de la matrice	//
				size_t j)					//	coordonnées en j de la colonne	//
{	
	// verifiaction des données
	assert(j < n);

	// recuperation de la taille du type
	int size_of_elem;
	MPI_Type_size(type, &size_of_elem);

	// case ou ecrire dans array
	size_t cpt = 0;
	
	// lecture des colonnes
	for(size_t y = 0; y < n; y++){
		MPI_File_read_at(f, ((y * n) + j) * size_of_elem, array + (cpt*size_of_elem), 1, type, MPI_STATUS_IGNORE);
		cpt++;
	}
}

void get_line(MPI_File f,					//	fichier MPI	// 
				void *array,				//	tableau dans le quel est alloué l'espace necessaire	//
				MPI_Datatype type, 			// 	type de données a lire	//
				size_t n,					//	taille de la matrice	//
				size_t i)					//	coordonnées en i de la ligne //
{	
	// verifiaction des données
	assert(i < n);

	// recuperation de la taille du type
	int size_of_elem;
	MPI_Type_size(type, &size_of_elem);

	// lecture de la ligne
	MPI_File_read_at(f, (i*n) * size_of_elem, array, n, type, MPI_STATUS_IGNORE);
}

void get_case(	MPI_File f,					//	fichier MPI	// 
				void *array,				//	tableau dans le quel est alloué l'espace necessaire	//
				MPI_Datatype type, 			// 	type de données a lire	//
				size_t n,					//	taille de la matrice	//
				size_t i, 					//	coordonnées en i de la case	//
				size_t j)					//	coordonnées en j de la case	//
{	
	// verifiaction des données
	assert(i < n && j < n);

	// recuperation de la taille du type
	int size_of_elem;
	MPI_Type_size(type, &size_of_elem);
	
	MPI_File_read_at(f, ((i * n) + j) * size_of_elem, array, 1, type, MPI_STATUS_IGNORE);
}