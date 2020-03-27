all: fact_alg.o test.c matrix.h 
	gcc -o test test.c fact_alg.o -lm

fact_alg.o : fact_alg.c fact_alg.h matrix.h
	gcc -c fact_alg.c -o fact_alg.o -lm

doolittle: doolittle.c matrix.h
	mpicc doolittle.c -o doolittle -lm

clean: 
	rm -f matrix test fact_alg.o doolittle