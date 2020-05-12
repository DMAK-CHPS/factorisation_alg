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

double choix_pivot(double *A, double *B, int n, int it)
{
  // on trouve le pivot en choisissant le maximum
  int pivot = it;
  double max_row_piv = fabs(A[pivot * n + it]); 
  for(int j = it+1; j < n; j++)
    if(fabs(A[pivot * n + j]) > max_row_piv)
      max_row_piv = fabs(A[pivot * n + j]);
  
  for(int i = it + 1; i < n; i++)
    {
      double max_row = fabs(A[i * n + it]); 
      for(int j = it+1; j < n; j++)
	if(fabs(A[i * n + j]) > max_row)
	  max_row = fabs(A[i * n + j]);	  

      
      if( (fabs(A[i * n + it]) / max_row ) > (fabs(A[pivot * n + it]) / max_row_piv ) )
	{
	  pivot = i;
	  max_row_piv = max_row;
	}
    }
  
  // on permute les lignes 
  // on sauvegarde la ligne du pivot
  double *tmp = malloc(sizeof(double) * (n-it+1));

  for(int i = 0; i < (n-it); i++)
    tmp[i] = A[pivot * n + (it+i)];

  tmp[n-it] = B[pivot];
  
  for(int i = it; i < n; i++)
    {
      A[pivot * n + i] = A[it * n + i];
      A[it * n + i] = tmp[i-it];
    }
  
  B[pivot] = B[it];
  B[it] = tmp[n-it];
  
  free(tmp);
  return A[it * n + it];
}


void gauss_choix_pivot(double *A, double *B, int n)
{
  for(int i = 0; i < n; i++)
    {
      double pivot = choix_pivot(A, B, n, i);
      
      // on calcul notre nouvelle ligne
      A[i * n + i] = 1.0;
      
      for(int j = i+1; j < n; j++)
	A[i * n + j] /= pivot;
      
      B[i] /= pivot;
      
      // on soustrait notre ligne aux autres pour les annuler
      for(int j = i+1; j < n; j++)
	{
	  double coeff = A[j * n + i];
	  A[j * n + i] = 0.0;
	  
	  for(int k = i+1; k < n; k++)
	    A[j * n + k] -= coeff * A[i * n + k];
	  
	  B[j] -= coeff * B[i];
	}
    }
}

void solve_gauss(double *A, double *B, double *X, int n)
{
  X[n-1] = B[n-1] / A[(n-1) * n +(n-1)];
  
  for(int i = n-2; i >= 0; i--)
    {
      double sum = 0;
      
      for(int j = n-1; j > i; j--)
        sum += A[i * n + j] * X[j];
      
      X[i] = (B[i] - sum);
    }
}


int main(int argc, char const *argv[])
{
  if(argc < 2)
    {
      fprintf(stderr, "./main [matrix size]\n");
      abort();
    }
  
  FILE *fa = fopen("A", "r");
  FILE *fb = fopen("B", "r");
  FILE *fx = fopen("X", "w");
  
  int n = atoi(argv[1]);
  double *A = calloc(n*n, sizeof(double));
  double *B = calloc(n, sizeof(double));
  double *X = calloc(n, sizeof(double));
  
  fread(A, sizeof(double), n*n, fa);
  fread(B, sizeof(double), n, fb);
  
  gauss_choix_pivot(A, B, n);
  
  solve_gauss(A, B, X, n);
  
  fwrite(X, sizeof(double), n, fx);
  
  fclose(fa);
  fclose(fb);
  fclose(fx);  

  free(A);
  free(B);
  free(X);
  
  return 0;
}




