main: main.c fact_cholesky.o
	gcc -o main main.c fact_cholesky.o -lm

fact_cholesky.o: fact_cholesky.c fact_cholesky.h
	gcc -c fact_cholesky.c -o fact_cholesky.o -lm

clean: 
	rm -f fact_cholesky.o main