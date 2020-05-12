import numpy as np
import random
import math
import sys
import struct
import scipy.stats as sc

if len(sys.argv) < 4:
	print("gen_cond_matrix [filename] [matrix size] [conditioning number] [optional: scale]")
	exit()

filename, n, cond = sys.argv[1], int(sys.argv[2]), float(sys.argv[3])

if len(sys.argv) == 5:
	scale = float(sys.argv[4])
else:
	scale = 1000.0

''' Premiere etape: generer les valeurs propres avec max(|valeurs propres| - min(|valeurs propres| = cond))'''

sing_max = random.uniform(0, scale)

sing_min = sing_max / cond

M = np.zeros((n,n))

for i in range(n):
	M[i,i] = random.uniform(sing_min,sing_max)

i, j =  random.randrange(0, math.floor((n-1)/2)), random.randrange(math.floor((n-1)/2) + 1, n-1)
M[i,i] = sing_min
M[j,j] = sing_max


''' Seconde etape: generer les matrices de vecteurs propres '''

#U  = sc.ortho_group.rvs(n)

U = np.zeros((n,n))
k = math.sqrt(1/n)
U[0] = np.ones((1,n)) * k
for i in range(1,n):
	aux = np.zeros((1,n))
	for j in range(n):
		if j < i:
			aux[0,j] = 1
		elif j == i: 
			aux[0,j] = -j
		else:
			aux[0,j] = 0
	U[i] = aux/np.linalg.norm(aux)

V = U.transpose()

''' troisieme etape: generer la matrice finale '''

A = U @ M @ V

if round(np.linalg.cond(A),2) != cond:
	print("error conditioning")
	exit()

''' quatrième étape on ecrit le resultat dans le fichier '''
f = open(filename, 'wb')
for i in range(n):
	for j in range(n):
		f.write(np.float64(A[i,j]))
f.close()