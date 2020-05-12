#!/bin/bash

if [ $# -lt "7" ]
then
	echo "./run.sh [step] [matrix size] [size step] [conditioning number] [conditioning step] [tolerance] [Output directory]"
	exit
fi

make gauss_scaling

rm DATA2

step=$1
size=$2
size_step=$3
cond=$4
cond_step=$5
tolerance=$6
output=$7


for i in `seq 1 $step`; do
	echo "$i/$step"

	for j in `seq 1 10`; do
		echo "$j/10"
		# generation de la matrice de conditionnement i
		python3 gen_cond_matrix.py A $size $cond
		python3 gen_vector.py B $size -10 10

		rm -f canc.log

		for k in `seq 1 30`; do

        	# calcul de L et de U
			export VFC_BACKENDS="libinterflop_cancellation.so --tolerance $tolerance --warning 1"
			#export VFC_BACKENDS="libinterflop_ieee.so"
			./gauss_scaling $size 2> canc.log

			python3 analyze.py $size $cond >> DATA
		done

		python3 analyze2.py $size $cond >> DATA2

		rm -f A X B DATA

	done

	#plot de la heatmap
	python3 plot_heatmap.py $size $i 300 $output

	rm -f A X B MATRIX

	size=$(($size+$size_step))
	cond=$(($cond+$cond_step))

done

python3 plot_data.py $step 10 $output

#rm -f canc.log

make clean

exit

if [ $# -lt "4" ]
then
	echo "./run.sh [matrix size] [max conditioning number] [tolerance] [Output directory]"
	exit
fi

make gauss_scaling

for i in `seq 1 $2`; do
	echo "$i/$2"
	for j in `seq 1 30`; do
		echo "$j/30"
		rm -f canc.log

		# generation de la matrice de conditionnement i
		python3 gen_cond_matrix.py A $1 $i
		python3 gen_vector.py B $1 -10 10 

		# calcul de L et de U
		export VFC_BACKENDS="libinterflop_cancellation.so --tolerance $3 --warning 1"
		./gauss_scaling $1 2> canc.log

		# analyse des données
		python3 analyze.py $1 $2 >> DATA
	done

	#plot de la heatmap
	python3 plot_heatmap.py $1 $i 30 $4

	rm -f A X B MATRIX
done

	python3 plot_data.py $2 30 $4

	rm -f DATA

make clean
