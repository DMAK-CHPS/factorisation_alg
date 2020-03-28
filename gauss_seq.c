#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void gauss(float **A, float *b, int n)
{
  for(int i = 0; i < n; i++)
    {
      // on choisi le pivot
      float pivot = A[i][i];

      //on calcul notre nouvelle ligne
      A[i][i] = 1.;
      for(int j = i+1; j < n; j++)
	  A[i][j] /= pivot;
      b[i] /= pivot;

      //on soustrait notre ligne aux autres pour les annuler 
      for(int j = i+1; j < n; j++)
	{
	  float coeff = A[j][i];
	  A[j][i] = 0.;
	  for(int k = i+1; k < n; k++)
	    A[j][k] -= coeff*A[i][k];
	  b[j] -= coeff*b[i];
	}
    }

  return;
};

int choix_pivot(float **A, float *b, int n, int it)
{
  //on trouve le pivot en choisissant le plus grand
  int i_piv = it;
  for(int i = it + 1; i < n; i++)
    if(fabsf(A[i][it]) > fabsf(A[i_piv][it]))
      i_piv = i;
  
  //on permute les lignes
  //     on sauvegarde la ligne du pivot
  float *tmp = malloc(sizeof(float) * (n-it+1));
  for(int i = 0; i < (n-it); i++)
    tmp[i] = A[i_piv][it+i];
  tmp[n-it+1] = b[i_piv];

  //     on remplace
  for(int i = it; i < n; i++)
    {
      A[i_piv][i] = A[it][i];
      A[it][i] = tmp[i-it];
    }
  b[i_piv] = b[it];
  b[it] = tmp[n-it+1];

  free(tmp);
  printf("pivot : %f\n", A[it][it]);
  return A[it][it];
};

void gauss_choix_pivot(float **A, float *b, int n)
{
  for(int i = 0; i < n; i++)
    {
      float pivot = choix_pivot(A, b, n, i);
      
      //on calcul notre nouvelle ligne
      A[i][i] = 1.;
      for(int j = i+1; j < n; j++)
	  A[i][j] /= pivot;
      b[i] /= pivot;

      //on soustrait notre ligne aux autres pour les annuler 
      for(int j = i+1; j < n; j++)
	{
	  float coeff = A[j][i];
	  A[j][i] = 0.;
	  for(int k = i+1; k < n; k++)
	    A[j][k] -= coeff*A[i][k];
	  b[j] -= coeff*b[i];
	}
    }

  return;
};

int main(int argc, char **argv)
{
  int n = 4;

  float **A = malloc(sizeof(float*) * n);
  for(int i = 0; i < n; i++)
    A[i] = malloc(sizeof(float) * n);

  A[0][0] = 3.;
  A[0][1] = 4.;
  A[0][2] = 7.;
  A[0][3] = 15.;

  A[1][0] = 12.;
  A[1][1] = 9.;
  A[1][2] = 4.;
  A[1][3] = 1.;

  A[2][0] = 92.;
  A[2][1] = 32.;
  A[2][2] = 50.;
  A[2][3] = 6.;

  A[3][0] = 2.;
  A[3][1] = 6.;
  A[3][2] = 9.;
  A[3][3] = 5.;

  float b[n];

  b[0] = 1.;
  b[1] = 2.;
  b[2] = 3.;
  b[3] = 4.;

  for(int i = 0; i < n; i++)
    {
      for(int j = 0; j < n; j++)
      	printf("%f ", A[i][j]);
      printf("\n");
    }
  printf("\n");
  
  //gauss(A, b, n);
  gauss_choix_pivot(A, b, n);

  printf("\n");
  for(int i = 0; i < n; i++)
    {
      for(int j = 0; j < n; j++)
      	printf("%f ", A[i][j]);
      printf("\n");
    }

  float *X = malloc(sizeof(float) * n);
 
  X[n-1] = b[n-1]/A[n-1][n-1];
  for(int i = n-2; i >= 0; i--)
    {
      float sum = 0;
      for(int j = n-1; j > i; j--)
	sum += A[i][j] * X[j];
      X[i] = (b[i] - sum); // on ne divise pas par A[i][i] car = 1
    }

  printf("\n");
  for(int i = 0; i < n; i++)
    printf("X[%d] = %f\n", i, X[i]);
  printf("\n");
  
  return 0;
};
