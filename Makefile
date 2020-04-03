all: common sequential mpi

common: common/MPI_IO.o common/MPI_IO.h common/matrix.h common/gen_matrix.c
	echo "common compilation done"

sequential:	sequential/fact_alg.o test 	
	echo "sequential compilation done"

mpi: mpi/doolittle mpi/gaussLU 
	echo "mpi compilation done"

test: sequential/fact_alg.o sequential/test.c common/matrix.h 
	gcc -o sequential/test sequential/test.c sequential/fact_alg.o -lm

sequential/fact_alg.o : sequential/fact_alg.c sequential/fact_alg.h common/matrix.h
	gcc -c sequential/fact_alg.c -o sequential/fact_alg.o -lm

mpi/doolittle: mpi/doolittle.c common/matrix.h
	mpicc mpi/doolittle.c -o mpi/doolittle -lm

mpi/gaussLU: mpi/gaussLU.c common/matrix.h common/MPI_IO.o common/MPI_IO.h
	mpicc mpi/gaussLU.c common/MPI_IO.o -o mpi/gaussLU -lm

common/MPI_IO.o: common/MPI_IO.c common/MPI_IO.h
	mpicc -c common/MPI_IO.c -o common/MPI_IO.o -lm

test_IO: common/test_IO.c common/MPI_IO.o common/MPI_IO.h
	mpicc -o common/test_IO common/test_IO.c common/MPI_IO.o -lm

common/gen_matrix: common/gen_matrix.c 
	gcc common/gen_matrix.c -o common/gen_matrix 

clean: 
	rm -f common/matrix sequential/test sequential/fact_alg.o common/MPI_IO.o mpi/doolittle mpi/gaussLU common/gen_matrix common/test_IO
