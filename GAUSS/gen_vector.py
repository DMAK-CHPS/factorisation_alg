import numpy as np
import random
import math
import sys
import struct

if len(sys.argv) < 5:
	print("gen_vector [filename] [vector size] [min value] [max value")
	exit()

filename, n, min_value, max_value = sys.argv[1], int(sys.argv[2]), float(sys.argv[3]), float(sys.argv[4])

V = np.zeros(n)

for i in range(n):
	V[i] = random.uniform(min_value, max_value)

f = open(filename, 'wb')
for i in range(n):
	f.write(np.float64(V[i]))
f.close()