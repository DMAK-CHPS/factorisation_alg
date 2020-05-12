main: fact_doolittle.o main.c fact_doolittle.h 
	verificarlo -o main main.c fact_doolittle.o

fact_doolittle.o: fact_doolittle.c fact_doolittle.h
	verificarlo -c fact_doolittle.c -o fact_doolittle.o

clean:
	rm -f main fact_doolittle.o  fact_doolittle.1.ll main.2.ll fact_doolittle.2.ll  main.1.ll main.o .vfcwrapper.o