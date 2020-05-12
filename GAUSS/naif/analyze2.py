import numpy as np 
import seaborn as sns
import matplotlib.pyplot as plt
import random
import math
import sys
import struct
import os.path

if len(sys.argv) < 3:
	print("plot_data.py [nb_iteration] [nb_data per nb_iteration] [output directory]")
	exit()

n_it, n = int(sys.argv[1]), int(sys.argv[2])

x = np.loadtxt("DATA", delimiter=' ')

size_mean = np.mean(x[:, 0])

cond_mean = np.mean(x[:, 1])

errors_mean = np.mean(x[:, 2])

n_canc_mean = np.mean(x[:, 3])

canc_avg_mean = np.mean(x[:, 4])

print(size_mean, cond_mean, errors_mean, n_canc_mean, canc_avg_mean)
