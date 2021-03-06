import numpy as np 
import seaborn as sns
import matplotlib.pyplot as plt
import random
import math
import sys
import struct
import os.path

if len(sys.argv) < 5:
	print("plot_heatmap.py [matrix_size] [nb_iteration] [nb smaple per iteration] [output directory]")
	exit()

n, it, n_it = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3])

DELTA = np.fromfile("MATRIX", dtype=np.float64).reshape(n,1)

DELTA = np.round(DELTA / n_it, 8)

sns.heatmap(DELTA, cmap="YlOrRd")

plt.title("Localisation des erreurs")

plt.savefig("{}/heatmap{}.png".format(sys.argv[4], it))
