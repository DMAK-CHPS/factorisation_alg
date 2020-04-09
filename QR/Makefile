main: main.c fact_schmidt.o fact_householder.o fact_schmidt.h fact_householder.h
	gcc -o main main.c fact_schmidt.o fact_householder.o -lm

fact_householder.o: fact_householder.c fact_householder.h 
	gcc -c fact_householder.c -o fact_householder.o -lm

fact_schmidt.o: fact_schmidt.c fact_schmidt.h 
	gcc -c fact_schmidt.c -o fact_schmidt.o -lm

clean:
	rm -f main fact_householder.o fact_schmidt.o