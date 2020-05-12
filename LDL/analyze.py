import numpy as np
import random
import math
import sys
import struct
import os.path

if len(sys.argv) < 3:
	print("analyze [matrix_size] [conditioning number]")
	exit()

""" Analyse de la sortie """
f = open("canc.log", "r")
log = f.read()
it = canc_sum = 0

for s in log.split():
	if s.isdigit():
		if it != 0:
			canc_sum += int(s)
		it = it + 1
it = it - 1

if it != 0:
	canc_avg = canc_sum/it
else:
	canc_avg = 0

f.close()

""" Calcul des erreurs """

n, cond = int(sys.argv[1]), float(sys.argv[2])
A = np.fromfile("A", dtype=np.float64).reshape(n, n)
L = np.fromfile("L", dtype=np.float64).reshape(n, n)
D = np.fromfile("D", dtype=np.float64).reshape(n, n)
RES = L @ D @ L.transpose()

sum = 0

DELTA = np.zeros((n,n))

for i in range(n):
	for j in range(n):
		if A[i,j] != 0:
			DELTA[i,j] = abs((A[i,j]-RES[i,j])/A[i,j])
		sum += DELTA[i,j]
avg = sum/(n*n)

""" mise a jour des données de la matrice """
if os.path.isfile('MATRIX'):
	DD = np.fromfile("MATRIX", dtype=np.float64).reshape(n, n);
	DELTA = DD + DELTA
f = open("MATRIX", 'wb')
for i in range(n):
	for j in range(n):
		f.write(np.float64(DELTA[i,j]))
f.close()

print(n, cond, avg, it, canc_avg)
