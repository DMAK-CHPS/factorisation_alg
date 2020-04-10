main: fact_doolittle.o main.c fact_doolittle.h fact_crout.h fact_crout.o
	verificarlo -o main main.c fact_doolittle.o fact_crout.o

fact_doolittle.o: fact_doolittle.c fact_doolittle.h
	verificarlo -c fact_doolittle.c -o fact_doolittle.o

fact_crout.o: fact_crout.c fact_crout.h
	verificarlo -c fact_crout.c -o fact_crout.o

clean:
	rm -f main fact_crout.o fact_doolittle.o fact_crout.2.ll  fact_doolittle.1.ll main.2.ll fact_doolittle.2.ll fact_crout.1.ll  main.1.ll main.o .vfcwrapper.o