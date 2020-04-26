import numpy as np
import pandas as pd 
import seaborn as sns
import matplotlib.pyplot as plt
import random
import math
import sys
import struct
import os.path

if len(sys.argv) < 4:
	print("plot_data.py [nb_iteration] [nb_data per iteration] [output directory]")
	exit()

n_it, n = int(sys.argv[1]), int(sys.argv[2])

x = np.loadtxt("DATA", delimiter=' ')

size_min = np.zeros(n_it)
size_mean = np.zeros(n_it)
size_median = np.zeros(n_it) 
size_max = np.zeros(n_it)

cond_min = np.zeros(n_it)
cond_mean = np.zeros(n_it)
cond_med = np.zeros(n_it) 
cond_max = np.zeros(n_it)

errors_min = np.zeros(n_it)
errors_mean = np.zeros(n_it)
errors_med = np.zeros(n_it) 
errors_max = np.zeros(n_it)

n_canc_min = np.zeros(n_it)
n_canc_mean = np.zeros(n_it)
n_canc_median = np.zeros(n_it) 
n_canc_max = np.zeros(n_it)

canc_avg_min = np.zeros(n_it)
canc_avg_mean = np.zeros(n_it)
canc_avg_median = np.zeros(n_it) 
canc_avg_max = np.zeros(n_it)

for i in range(n_it):
	size_min[i] = np.amin(x[i*n : (i+1)*n, 0])
	size_mean[i] = np.mean(x[i*n : (i+1)*n, 0])
	size_median[i] = np.median(x[i*n : (i+1)*n, 0])
	size_max[i] = np.amax(x[i*n : (i+1)*n, 0])

	cond_min[i] = np.amin(x[i*n : (i+1)*n, 1])
	cond_mean[i] = np.mean(x[i*n : (i+1)*n, 1])
	cond_med[i] = np.median(x[i*n : (i+1)*n, 1])
	cond_max[i] = np.max(x[i*n : (i+1)*n, 1])

	errors_min[i] = np.amin(x[i*n : (i+1)*n, 2])
	errors_mean[i] = np.mean(x[i*n : (i+1)*n, 2])
	errors_med[i] = np.median(x[i*n : (i+1)*n, 2])
	errors_max[i] = np.amax(x[i*n : (i+1)*n, 2])

	n_canc_min[i] = np.amin(x[i*n : (i+1)*n, 3])
	n_canc_mean[i] = np.mean(x[i*n : (i+1)*n, 3])
	n_canc_median[i] = np.median(x[i*n : (i+1)*n, 3])
	n_canc_max[i] = np.amax(x[i*n : (i+1)*n, 3])
	
	canc_avg_min[i] = np.amin(x[i*n : (i+1)*n, 4])
	canc_avg_mean[i] = np.mean(x[i*n : (i+1)*n, 4])
	canc_avg_median[i] = np.median(x[i*n : (i+1)*n, 4])
	canc_avg_max[i] = np.amax(x[i*n : (i+1)*n, 4])

plt.title("Taille des matrices")
plt.plot(size_min, label="Taille minimum")
plt.plot(size_mean, label="Taille moyenne")
plt.plot(size_median, label="Taille médiane") 
plt.plot(size_max, label="Taille maximum")
plt.legend(loc='upper left', fontsize="x-small")
plt.savefig("{}/curve_size.png".format(sys.argv[3]))

plt.clf()

plt.title("Conditionnement des matrices")
plt.plot(cond_min, label="Conditonnement minimum")
plt.plot(cond_mean, label="Conditonnement moyen")
plt.plot(cond_med, label="Conditonnement median") 
plt.plot(cond_max, label="Conditonnement maximum")
plt.legend(loc='upper left', fontsize="x-small")
plt.savefig("{}/curve_cond.png".format(sys.argv[3]))

plt.clf()

plt.title("Erreurs dans la matrice finale")
plt.plot(errors_min, label="Erreur minimum")
plt.plot(errors_mean, label="Erreur moyenne")
plt.plot(errors_med, label="Erreur median") 
plt.plot(errors_max, label="Erreur maximum")
plt.legend(loc='upper left', fontsize="x-small")
plt.savefig("{}/curve_errors.png".format(sys.argv[3]))

plt.clf()

plt.title("Nombre de cancellation lors du traitement")
plt.plot(n_canc_min, label="Nombre de cancellation minimum")
plt.plot(n_canc_mean, label="Nombre de cancellation moyen")
plt.plot(n_canc_median, label="Nombre de cancellation median") 
plt.plot(n_canc_max, label="Nombre de cancellation maximum")
plt.legend(loc='upper left', fontsize="x-small")
plt.savefig("{}/curve_n_canc.png".format(sys.argv[3]))

plt.clf()

plt.title("Taille des cancellations lors du traitement")
plt.plot(canc_avg_min, label="Taille de cancellation minimum")
plt.plot(canc_avg_mean, label="Taille de cancellation moyen")
plt.plot(canc_avg_median, label="Taille de cancellation median") 
plt.plot(canc_avg_max, label="Taille de cancellation maximum")
plt.legend(loc='upper left', fontsize="x-small")
plt.savefig("{}/curve_canc.png".format(sys.argv[3]))

plt.clf()