#ifndef MPI_IO_H
#define MPI_IO_H

#include <stdlib.h>
#include <stdio.h>
#include <mpi.h>
#include <assert.h>
#include <math.h>


size_t get_size(MPI_File *f, 				// fichier MPI //
				MPI_Datatype type);			// taille d'un element (exemple: sizeof(float))	//

//////////////////////////////////////////////////
//		Lit une case [i][j] de la matrice		//
//												//
//			1	 	2		3		4			//
//			5	 	[6]		7		8			//
//			9	 	10		11		12			//
//			13	 	14		15		16			//
//////////////////////////////////////////////////

void get_case(	MPI_File f,					//	fichier MPI	// 
				void *array,				//	tableau dans le quel est alloué l'espace necessaire	//
				MPI_Datatype type, 			// 	type de données a lire	//
				size_t n,					//	taille de la matrice	//
				size_t i, 					//	coordonnées en i de la case	//
				size_t j);					//	coordonnées en j de la case	//

//////////////////////////////////////////////////
//		Lit la ligne i de la matrice			//
//												//
//			1	 	2		3		4			//
//			[5]	 	[6]		[7]		[8]			//
//			9	 	10		11		12			//
//			13	 	14		15		16			//
//////////////////////////////////////////////////

void get_line(MPI_File f,					//	fichier MPI	// 
				void *array,				//	tableau dans le quel est alloué l'espace necessaire	//
				MPI_Datatype type, 			// 	type de données a lire	//
				size_t n,					//	taille de la matrice	//
				size_t i);					//	coordonnées en i de la ligne //

//////////////////////////////////////////////////
//		Lit la colonne j de la matrice			//
//												//
//			1	 	[2]		3		4			//
//			5	 	[6]		7		8			//
//			9	 	[10]	11		12			//
//			13	 	[14]	15		16			//
//////////////////////////////////////////////////

void get_column(MPI_File f,					//	fichier MPI	// 
				void *array,				//	tableau dans le quel est alloué l'espace necessaire	//
				MPI_Datatype type, 			// 	type de données a lire	//
				size_t n,					//	taille de la matrice	//
				size_t j);					//	coordonnées en j de la colonne	//

//////////////////////////////////////////////////
//		Lit la croix [i][j] de la matrice		//
//												//
//			1	 	[2]		3		4			//
//			[5]	 	[6]		[7]		[8]			//
//			9	 	[10]	11		12			//
//			13	 	[14]	15		16			//
//////////////////////////////////////////////////

void get_cross(	MPI_File f,					//	fichier MPI	// 
				void *array,				//	tableau dans le quel est alloué l'espace necessaire	//
				MPI_Datatype type, 			// 	type de données a lire	//
				size_t n,					//	taille de la matrice	//
				size_t i, 					//	coordonnées en i de la case d'intersection 	//
				size_t j);					//	coordonnées en j de la case d'intersection	//

//////////////////////////////////////////////////
//		Lit le block [i][j] -> [i'][j'] 		//
//				de la matrice					//
//												//
//			1	 	2		3		4			//
//			5	 	[6]		[7]		[8]			//
//			9	 	[10]	[11]	[12]		//
//			13	 	[14]	[15]	[16]		//
//////////////////////////////////////////////////

void get_block(	MPI_File f,					//	fichier MPI	// 
				void *array,				//	tableau dans le quel est alloué l'espace necessaire	//
				MPI_Datatype type, 			// 	type de données a lire	//
				size_t n,					//	taille de la matrice	//
				size_t ia, 					//	coordonnées en i de la 1ere case //
				size_t ja,					//	coordonnées en j de la 1ere case //
				size_t ib, 					//	coordonnées en i de la 2nd case //
				size_t jb);					//	coordonnées en j de la 2nd case //

//////////////////////////////////////////////////
//		Ecrit une case [i][j] de la matrice		//
//												//
//			1	 	2		3		4			//
//			5	 	[6]		7		8			//
//			9	 	10		11		12			//
//			13	 	14		15		16			//
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//		Ecrit la ligne i de la matrice			//
//												//
//			1	 	2		3		4			//
//			[5]	 	[6]		[7]		[8]			//
//			9	 	10		11		12			//
//			13	 	14		15		16			//
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//		Ecrit la colonne j de la matrice		//
//												//
//			1	 	[2]		3		4			//
//			5	 	[6]		7		8			//
//			9	 	[10]	11		12			//
//			13	 	[14]	15		16			//
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//		Ecrit la croix [i][j] de la matrice		//
//												//
//			1	 	[2]		3		4			//
//			[5]	 	[6]		[7]		[8]			//
//			9	 	[10]	11		12			//
//			13	 	[14]	15		16			//
//////////////////////////////////////////////////

//////////////////////////////////////////////////
//		Ecrit le block [i][j] -> [i'][j'] 		//
//				de la matrice					//
//												//
//			1	 	2		3		4			//
//			5	 	[6]		[7]		[8]			//
//			9	 	[10]	[11]	[12]		//
//			13	 	[14]	[15]	[16]		//
//////////////////////////////////////////////////

#endif