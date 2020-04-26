#!/bin/bash

if [ $# -lt "4" ]
then
	echo "./run.sh [matrix size] [max conditioning number] [tolerance] [Output directory]"
	exit
fi

make main

for i in `seq 1 $2`; do
	echo "$i/$2"
	for j in `seq 1 30`; do
		echo "	$j/30"
		rm -f canc.log

		# generation de la matrice de conditionnement i
		python3 gen_cond_matrix.py A $1 $i

		# calcul de L et de U
		export VFC_BACKENDS="libinterflop_cancellation.so --tolerance $3 --warning 1"
		./main $1 2> canc.log

		# analyse des données
		python3 analyze.py $1 $2 >> DATA
	done

	#plot de la heatmap
	python3 plot_heatmap.py $1 $i 30 $4

	rm -f A L U MATRIX
done

	python3 plot_data.py $2 30 $4

	rm -f DATA

make clean