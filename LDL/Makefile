main: main.c fact_ldl.o
	gcc -o main main.c fact_ldl.o -lm

fact_ldl.o: fact_ldl.c fact_ldl.h
	gcc -c fact_ldl.c -o fact_ldl.o -lm

clean:
	rm -f main fact_ldl.o