#!/bin/bash

if [ $# -lt "3" ]
then
	echo "./run.sh [matrix size] [conditioning number] [tolerance]"
	exit
fi

python3 gen_cond_matrix.py A $1 $2 

make main

rm -f MATRIX

for i in `seq 0 30`; do
	rm -f canc.log

	export VFC_BACKENDS="libinterflop_cancellation.so --tolerance $3 --warning 1"
	./main $1 2> canc.log

	python3 analyze.py $1 $2 >> DATA
done

python3 plot.py $1 30

rm -f A L U
make clean