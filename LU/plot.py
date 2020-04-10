import numpy as np
import pandas as pd 
import seaborn as sns
import matplotlib.pyplot as plt
import random
import math
import sys
import struct
import os.path

if len(sys.argv) < 3:
	print("plot.py [matrix_size] [nb_iteration]")
	exit()

n, n_it = int(sys.argv[1]), int(sys.argv[2])

DELTA = np.fromfile("MATRIX", dtype=np.float64).reshape(n, n)

DELTA = DELTA / n_it

sns.heatmap(DELTA, cmap="YlOrRd")

plt.title("Localisation des erreurs")

plt.show()

x = np.loadtxt("DATA", delimiter=' ')

size = x[:,0]
cond = x[:,1]
errors = x[:,2]
n_canc = x[:,3]
canc_avg = x[:,4]

plt.plot(errors)

plt.show()