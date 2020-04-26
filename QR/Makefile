main: main.c fact_schmidt.o fact_schmidt.h
	verificarlo -o main main.c fact_schmidt.o -lm

fact_schmidt.o: fact_schmidt.c fact_schmidt.h 
	verificarlo -c fact_schmidt.c -o fact_schmidt.o -lm

clean:
	rm -f main main.o fact_schmidt.o .vfcwrapper.o main.1.ll main.2.ll fact_schmidt.1.ll fact_schmidt.2.ll 