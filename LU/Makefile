main: fact_doolittle.o main.c fact_doolittle.h fact_crout.h fact_crout.o
	gcc -o main main.c fact_doolittle.o fact_crout.o -lm

fact_doolittle.o: fact_doolittle.c fact_doolittle.h
	gcc -c fact_doolittle.c -o fact_doolittle.o -lm

fact_crout.o: fact_crout.c fact_crout.h
	gcc -c fact_crout.c -o fact_crout.o -lm

clean:
	rm -f main fact_crout.o fact_doolittle.o