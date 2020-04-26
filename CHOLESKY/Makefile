main: main.c fact_cholesky.o
	verificarlo -o main main.c fact_cholesky.o -lm

fact_cholesky.o: fact_cholesky.c fact_cholesky.h
	verificarlo -c fact_cholesky.c -o fact_cholesky.o -lm

clean: 
	rm -f main.o fact_cholesky.o main .vfcwrapper.o main.1.ll main.2.ll fact_cholesky.1.ll fact_cholesky.2.ll