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

sing_min = random.uniform(0, 10 * cond + 10)

sing_max = cond * sing_min

print(sing_min, sing_max, sing_max/sing_min)

M = np.zeros((n,n))

for i in range(n):
	M[i,i] = random.uniform(sing_min,sing_max)

i, j =  random.randrange(0, math.floor((n-1)/2)), random.randrange(math.floor((n-1)/2) + 1, n-1)
M[i,i] = sing_min
M[j,j] = sing_max

print("--------------- valeurs singulieres a la generation ---------------")
print(M)

''' Seconde etape: generer les matrices de vecteurs propres '''

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

V = np.zeros((n,n))
k = math.sqrt(1/n)
V[0] = np.ones((1,n)) * k
for i in range(1,n):
	aux = np.zeros((1,n))
	for j in range(n):
		if j < i:
			aux[0,j] = 1
		elif j == i: 
			aux[0,j] = -j
		else:
			aux[0,j] = 0
	V[i] = aux/np.linalg.norm(aux)

print("--------------- vecteurs propres de U a la generation---------------")
print(U)

print("--------------- vecteurs propres de V a la generation---------------")
print(V)

''' troisieme etape: generer la matrice finale '''

A = U @ M @ V


print("--------------- matrice finale ---------------")
print(A)

''' quatrième étape on verifie le resultat '''

print("--------------- conditionnement ---------------")
print(np.linalg.cond(A))
print(np.linalg.norm(A))
u, s, v = np.linalg.svd(A)
print("--------------- u ---------------")
print(u)
print("--------------- s ---------------")
print(s)
print("--------------- v ---------------")
print(v)


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