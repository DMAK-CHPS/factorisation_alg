main: fact_svd.o fact_svd.h main.c solve_svd.o
	gcc -o main main.c fact_svd.o solve_svd.o -Wall -lm

fact_svd.o: fact_svd.c fact_svd.h
	gcc -c fact_svd.c -o fact_svd.o -Wall -lm

solve_svd.o: solve_svd.c solve_svd.h
	gcc -c solve_svd.c -o solve_svd.o -Wall -lm

clean:
	rm -f solve_svd.o fact_svd.o main