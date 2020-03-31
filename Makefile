all: fact_alg.o test.c matrix.h 
	gcc -o test test.c fact_alg.o -lm

fact_alg.o : fact_alg.c fact_alg.h matrix.h
	gcc -c fact_alg.c -o fact_alg.o -lm

doolittle: doolittle.c matrix.h
	mpicc doolittle.c -o doolittle -lm

gaussLU: gaussLU.c matrix.h
	mpicc gaussLU.c -o gaussLU -lm

MPI_IO.o:	MPI_IO.c MPI_IO.h
	mpicc -c MPI_IO.c -o MPI_IO.o -lm

test_IO: test_IO.c MPI_IO.o
	mpicc -o test_IO test_IO.c MPI_IO.o -lm

gen_matrix: gen_matrix.c 
	gcc gen_matrix.c -o gen_matrix 

clean: 
	rm -f matrix test fact_alg.o doolittle gaussLU gen_matrix test_IO
