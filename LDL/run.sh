#!/bin/bash

if [ $# -lt "7" ]
then
	echo "./run.sh [step] [matrix size] [size step] [conditioning number] [conditioning step] [tolerance] [Output directory]"
	exit
fi

rm DATA2

make main

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

		rm -f canc.log

		for k in `seq 1 30`; do

			if [[ $k -eq 1 ]]; 
			then
        		# calcul de L et de U
				export VFC_BACKENDS="libinterflop_cancellation.so --tolerance $tolerance --warning 1"
				#export VFC_BACKENDS="libinterflop_ieee.so"
				./main $size 2> canc.log	
			else
				# calcul de L et de U
				export VFC_BACKENDS="libinterflop_cancellation.so --tolerance $tolerance"
				#export VFC_BACKENDS="libinterflop_ieee.so"
				./main $size 2> /dev/null
			fi

			python3 analyze.py $size $cond >> DATA
		done

		python3 analyze2.py $size $cond >> DATA2

		rm -f A L D DATA

	done

	#plot de la heatmap
	python3 plot_heatmap.py $size $i 300 $output

	rm -f A L D MATRIX

	size=$(($size+$size_step))
	cond=$(($cond+$cond_step))

done

python3 plot_data.py $step 10 $output

rm -f canc.log

make clean