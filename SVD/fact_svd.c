#include "fact_svd.h"

static void Reduction(double* A, int n, double* U, double* V, double* D, double* DD);

static int  Iterate( int n, double* U, double* V, double* D, double* DD);

static void Sort(int n, double* singular_value, double* U, double* V);

int fact_svd(double* A, int n, double* U, double* D, double* V)
{
	double *DD = calloc(n * n, sizeof(double));

	Reduction(A, n, U, V, D, DD);

	if (Iterate( n, U, V, D, DD ) < 0) 
		return -1;

	Sort(n, D, U, V);

	free(DD);

	return 0;
}


static void Reduction(double* A, int n, double* U, double* V, double* D, double* DD )
{
   int i,j,k,l;
   double s, s2, si, scale, h;

   memcpy(U,A, sizeof(double) * n * n);
 
   D[0] = s = scale = 0.0;
   for ( i = 0, l = 1; i < n; i++, l++ ) {
      DD[i] = scale * s;
      for (j = i, scale = 0.0; j < n; j++)
         scale += fabs(U[j*n+i]);
       
      if (scale > 0.0) {
         for (j = i, s2 = 0.0; j < n; j++) {
            U[j*n+i] /= scale;
            s2 += U[j*n+i] * U[j*n+i];
         }

         s = ( U[i*n+i] < 0.0 ) ? sqrt(s2) : -sqrt(s2);
         h = U[i*n+i] * s - s2;
         U[i*n+i] -= s;
         
         for (j = l; j < n; j++) {
            for (k = i, si = 0.0; k < n; k++)
               si += U[k*n+i] * U[k*n+j];
            si /= h;
            for (k = i; k < n; k++) {
               U[k*n+j] += si * U[k*n+i];
            }
         }
      }
      for (j = i; j < n; j++){
        U[j*n+i] *= scale;
      }
      D[i] = s * scale;

      s = scale = 0.0;
      if (i == (n - 1)) 
        continue;
      for (j = l; j < n; j++){
        scale += fabs (U[i*n+j]);
      } 
      if(scale > 0.0 ){
         for(j = l, s2 = 0.0; j < n; j++) {
            U[i*n+j] /= scale;
            s2 += U[i*n+j] * U[i*n+j];
         }
         s = ( U[i*n+l] < 0.0 ) ? sqrt(s2) : -sqrt(s2);
         h = U[i*n+l] * s - s2;
         U[i*n+l] -= s;

         for (k = l; k < n; k++)
            DD[k] = U[i*n+k] / h;
         if (i < (n - 1)) {
            for (j = l; j < n; j++) {
               for (k = l, si = 0.0; k < n; k++) 
                  si += U[i*n+k] * U[j*n+k];
               for (k = l; k < n; k++) { 
                  U[j*n+k] += si * DD[k];
               }
            }
         }
         for (k = l; k < n; k++) 
          U[i*n+k] *= scale;
      }
   }

// Update V
   V[(n-1)*n+(n-1)]= 1.0;
   s = DD[n - 1];
   for (i = n - 2, l = n - 1; i >= 0; i--, l-- ) {
      if(s != 0.0 ){
         for(j = l; j < n; j++)
          V[j*n+i] = ( U[i*n+j] / U[i*n+l]) / s;
         for (j = l; j < n; j++) { 
            si = 0.0;
            for (k = l; k < n; k++)
               si += U[i*n+k] * V[k*n+j];
            for (k = l; k < n; k++)
               V[k*n+j]+= si * V[k*n+i];                  
         }
      }
      for(j = l; j < n; j++){
        V[i*n+j] = V[j*n+i] = 0.0;
      }
      V[i*n+i] = 1.0;
      s = DD[i];
   }

// Update U
   for (i = n - 1, l = n; i >= 0; l = i, i--) {
      s = D[i];
      for ( j = l; j < n; j++) 
        U[i*n+j] = 0.0;
      if(s != 0.0) {
         for (j = l; j < n; j++) { 
            si = 0.0;
            for (k = l; k < n; k++)
              si += U[k*n+i] * U[k*n+j];
            si = (si / U[i*n+i] ) / s;
            for (k = i; k < n; k++)
               U[k*n+j] += si * U[k*n+i];                  
         }
         for (j = i; j < n; j++){
           U[j*n+i] /= s;
         }
      }
      else 
         for(j = i; j < n; j++) U[j*n+i] = 0.0;
      U[i*n+i] += 1.0;
   }
}

static int Iterate(int n, double* U, double* V, double* D, double* DD )
{
   double epsilon;
   double c, s;
   double f,g,h;
   double x,y,z;
   int i,j,k,m;
   int flag;
   int its;
  
   for (i = 0, x = 0.0; i < n; i++) {
      y = fabs(D[i]) + fabs(DD[i]);
      if ( x < y ) x = y;
   }

   epsilon = x * DBL_EPSILON;

   for (k = n - 1; k >= 0; k--) {
      its = 0;
      while(1) {
         flag = 1;
         for (m = k; m >= 0; m--) { 
            if (fabs(DD[m]) <= epsilon) {flag = 0; break;}
            if (fabs(D[m-1]) <= epsilon) break;
         }
         if (flag) {
            c = 0.0;
            s = 1.0;
            for (i = m; i <= k; i++) {  
               f = s * DD[i];
               DD[i] *= c;
               if (fabs(f) <= epsilon) break;
               g = D[i];
               h = sqrt(f*f + g*g);
               D[i] = h;
               c = g / h;
               s = -f / h; 
               for (j = 0; j < n; j++) { 
                  y = U[j*n+(m-1)];
                  z = U[j*n+i];
                  U[j*n+(m-1)] = y * c + z * s;
                  U[j*n+i] = -y * s + z * c;
               }
            }
         }
         z = D[k];
         if (m == k ) {
            if ( z < 0.0 ) {
               D[k] = -z;
               for ( j = 0; j < n; j++) 
                V[j*n+k] = -V[j*n+k];
            }
            break;
         }
         else {
            if ( its >= MAX_ITERATION_COUNTS ) return -1;
            its++;
            x = D[m];
            y = D[k-1];
            g = DD[k-1];
            h = DD[k];
            f = ( (y - z) * ( y + z ) + (g - h) * (g + h) )/(2.0 * h * y);
            g = sqrt( f * f + 1.0 );
            if ( f < 0.0 ) g = -g;
            f = ( (x - z) * (x + z) + h * (y / (f + g) - h) ) / x;
            c = 1.0;
            s = 1.0;
            for (i = m + 1; i <= k; i++) {
               g = DD[i];
               y = D[i];
               h = s * g;
               g *= c;
               z = sqrt( f * f + h * h );
               DD[i-1] = z;
               c = f / z;
               s = h / z;
               f =  x * c + g * s;
               g = -x * s + g * c;
               h = y * s;
               y *= c;
               for (j = 0; j < n; j++) {
                  x = V[j*n+(i-1)];
                  z = V[j*n+i];
                  V[j*n+(i-1)] = x * c + z * s;
                  V[j*n+i] = -x * s + z * c;
               }
               z = sqrt( f * f + h * h );
               D[i - 1] = z;
               if (z != 0.0) {
                  c = f / z;
                  s = h / z;
               } 
               f = c * g + s * y;
               x = -s * g + c * y;
               for (j = 0; j < n; j++) {
                  y = U[j*n+(i-1)];
                  z = U[j*n+i];
                  U[j*n+(i-1)] = c * y + s * z;
                  U[j*n+i] = -s * y + c * z;
               }
            }
            DD[m] = 0.0;
            DD[k] = f;
            D[k] = x;
         }
      } 
   }
   return 0;
}

static void Sort(int n, double* D, double* U, double* V)
{
   int i,j,max_index;
   double temp;
   double *p1, *p2;

   for (i = 0; i < n - 1; i++) {
      max_index = i;
      for (j = i + 1; j < n; j++)
         if (D[j] > D[max_index] ) 
            max_index = j;
      if (max_index == i) 
        continue;
      temp = D[i];
      D[i] = D[max_index];
      D[max_index] = temp;
      p1 = U + max_index;
      p2 = U + i;
      for (j = 0; j < n; j++, p1 += n, p2 += n) {
         temp = *p1;
         *p1 = *p2;
         *p2 = temp;
      } 
      p1 = V + max_index;
      p2 = V + i;
      for (j = 0; j < n; j++, p1 += n, p2 += n) {
         temp = *p1;
         *p1 = *p2;
         *p2 = temp;
      }
   } 
}