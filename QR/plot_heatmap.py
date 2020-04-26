import numpy as np
import pandas as pd 
import seaborn as sns
import matplotlib.pyplot as plt
import random
import math
import sys
import struct
import os.path

if len(sys.argv) < 5:
	print("plot_heatmap.py [matrix_size] [nb_iteration] [nb_iteration] [output directory]")
	exit()

n, it, n_it = int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3])

DELTA = np.fromfile("MATRIX", dtype=np.float64).reshape(n, n)

DELTA = DELTA / n_it

sns.heatmap(DELTA, cmap="YlOrRd")

plt.title("Localisation des erreurs")

plt.savefig("{}/heatmap{}.png".format(sys.argv[4], it))