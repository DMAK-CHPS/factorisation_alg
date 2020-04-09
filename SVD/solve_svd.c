#include "solve_svd.h"

void solve_svd(double* U, double* D, double* V, double tolerance, int n, double *B, double* x) 
{
   int i,j,k;
   double dum;

   dum = DBL_EPSILON * D[0] * (double) n;
   if (tolerance < dum) tolerance = dum;

   for ( i = 0; i < n; i++) {
      x[i] = 0.0;
      for (j = 0; j < n; j++)
         if (D[j] > tolerance ) {
            for (k = 0, dum = 0.0; k < n; k++)
               dum += U[i*n+j] * B[k];
            x[i] += dum * V[i*n+j] / D[j];
         }
   } 
}