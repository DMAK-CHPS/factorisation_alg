main: main.c fact_ldl.o
	verificarlo -o main main.c fact_ldl.o -lm

fact_ldl.o: fact_ldl.c fact_ldl.h
	verificarlo -c fact_ldl.c -o fact_ldl.o -lm

clean:
	rm -f main fact_ldl.o .vfcwrapper.o main.1.ll main.2.ll fact_ldl.1.ll fact_ldl.2.ll main.o