import numpy as np
import random
import math
import sys
import struct

if len(sys.argv) < 4:
	print("gen_cond_matrix [filename] [matrix size] [conditioning number]")
	exit()

filename, n, cond = sys.argv[1], int(sys.argv[2]), float(sys.argv[3])

''' Premiere etape: generer les valeurs propres avec max(|valeurs propres| - min(|valeurs propres| = cond))'''

eig_min = random.uniform(0, 10 * cond + 10)

eig_max = cond * eig_min

print(eig_min, eig_max, eig_max/eig_min)

M = np.zeros((n,n))

for i in range(n):
	M[i,i] = random.uniform(eig_min,eig_max)

i, j =  random.randrange(0, math.floor((n-1)/2)), random.randrange(math.floor((n-1)/2) + 1, n-1)
M[i,i] = eig_min
M[j,j] = eig_max

print("--------------- valeurs propres a la generation ---------------")
print(M)

''' Seconde etape: generer la matrice de vecteurs propres '''

S = np.random.random((n,n)) 
S = S * 1000 - 500

print("--------------- vecteurs propres a la generation---------------")
print(S)

''' troisieme etape: generer lamatrice finale '''

A = S @ M @ np.linalg.inv(S);

print("--------------- matrice finale ---------------")
print(A)

''' quatrième étape on verifie le resultat '''

print("--------------- conditionnement ---------------")
print(np.linalg.cond(A, -np.inf))
eigenvalues, eigenvectors = np.linalg.eig(A)
print("--------------- vecteurs propres ---------------")
print(eigenvectors)
print("--------------- valeurs propres ---------------")
print(eigenvalues)

''' cinquieme étape on ecrit le resultat dans le fichier '''
f = open(filename, 'wb')
for i in range(n):
	for j in range(n):
		f.write(np.float32(A[i,j]))
f.close()

B = np.zeros((n,n))

f = open(filename, 'rb')

B = struct.unpack('f'*n*n, f.read(4*n*n))

f.close()

print("--------------- matrice finale apres lecture ---------------")
print(B)