main: fact_svd.o fact_svd.h main.c solve_svd.o
	verificarlo -o main main.c fact_svd.o solve_svd.o -Wall -lm

fact_svd.o: fact_svd.c fact_svd.h
	verificarlo -c fact_svd.c -o fact_svd.o -Wall -lm

solve_svd.o: solve_svd.c solve_svd.h
	verificarlo -c solve_svd.c -o solve_svd.o -Wall -lm

clean:
	rm -f main.o solve_svd.o fact_svd.o main .vfcwrapper.o main.1.ll main.2.ll fact_svd.1.ll fact_svd.2.ll solve_svd.1.ll solve_svd.2.ll 