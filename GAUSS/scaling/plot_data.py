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

x = np.loadtxt("DATA2", delimiter=' ')

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

plt.title("Erreurs en fonction de la taille de matrice")
plt.plot(size_mean, errors_min, label="Erreur minimum")
plt.plot(size_mean, errors_mean, label="Erreur moyenne")
plt.plot(size_mean, errors_med, label="Erreur medianne") 
#plt.plot(size_mean, errors_max, label="Erreur maximum")
plt.xlabel("Taille de la matrice")
plt.ylabel("Erreur relative")
plt.legend(loc='upper left', fontsize="x-small")
plt.savefig("{}/errors_size.png".format(sys.argv[3]))
plt.clf()

plt.title("Erreurs en fonction du conditonnement de la matrice")
plt.plot(cond_mean, errors_min, label="Erreur minimum")
plt.plot(cond_mean, errors_mean, label="Erreur moyenne")
plt.plot(cond_mean, errors_med, label="Erreur medianne") 
#plt.plot(cond_mean, errors_max, label="Erreur maximum")
plt.xlabel("Conditionnement de la matrice")
plt.ylabel("Erreur relative")
plt.legend(loc='upper left', fontsize="x-small")
plt.savefig("{}/errors_cond.png".format(sys.argv[3]))
plt.clf()

plt.title("Taille des cancellations en fonction de la taille de matrice")
plt.plot(size_mean, canc_avg_min, label="Taille de cancellation minimum")
plt.plot(size_mean, canc_avg_mean, label="Taille de cancellation moyen")
plt.plot(size_mean, canc_avg_median, label="Taille de cancellation medianne") 
plt.plot(size_mean, canc_avg_max, label="Taille de cancellation maximum")
plt.xlabel("Taille de la matrice")
plt.ylabel("Taille motenne des cancellations")
plt.legend(loc='upper left', fontsize="x-small")
plt.savefig("{}/canc_size.png".format(sys.argv[3]))
plt.clf()

plt.title("Taille des cancellations en fonction du conditonnement de la matrice")
plt.plot(cond_mean, canc_avg_min, label="Taille de cancellation minimum")
plt.plot(cond_mean, canc_avg_mean, label="Taille de cancellation moyen")
plt.plot(cond_mean, canc_avg_median, label="Taille de cancellation medianne") 
plt.plot(cond_mean, canc_avg_max, label="Taille de cancellation maximum")
plt.xlabel("Conditonnement de la matrice")
plt.ylabel("Taille motenne des cancellations")
plt.legend(loc='upper left', fontsize="x-small")
plt.savefig("{}/canc_cond.png".format(sys.argv[3]))
plt.clf()

plt.title("Nombre de cancellations en fonction de la taille de matrice")
plt.plot(size_mean, n_canc_min, label="Nombre de cancellation minimum")
plt.plot(size_mean, n_canc_mean, label="Nombre de cancellation moyen")
plt.plot(size_mean, n_canc_median, label="Nombre de cancellation medianne") 
plt.plot(size_mean, n_canc_max, label="Nombre de cancellation maximum")
plt.xlabel("Taille de la matrice")
plt.ylabel("Nombre moyen de cancellations")
plt.legend(loc='upper left', fontsize="x-small")
plt.savefig("{}/n_canc_size.png".format(sys.argv[3]))
plt.clf()

plt.title("Nombre de cancellations en fonction du conditonnement de la matrice")
plt.plot(cond_mean, n_canc_min, label="Nombre de cancellation minimum")
plt.plot(cond_mean, n_canc_mean, label="Nombre de cancellation moyen")
plt.plot(cond_mean, n_canc_median, label="Nombre de cancellation medianne") 
plt.plot(cond_mean, n_canc_max, label="Nombre de cancellation maximum")
plt.xlabel("Conditonnement de la matrice")
plt.ylabel("Nombre moyen de cancellations")
plt.legend(loc='upper left', fontsize="x-small")
plt.savefig("{}/n_canc_cond.png".format(sys.argv[3]))
plt.clf()
