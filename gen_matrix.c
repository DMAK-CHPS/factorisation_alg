#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#ifndef TYPE
#define TYPE FLOAT
#endif

#if TYPE == FLOAT

float float_rand(float min, float max )
{
    return min + (rand() / (float) RAND_MAX) * ( max - min );
}

float rand_a_b(float a, float b)
{
	return (float)rand()/(float)(RAND_MAX/a);
}


int main(int argc, char const *argv[])
{
	srand(time(NULL));

	if(argc < 6){
		fprintf(stderr, "./gen_matrix [file_name] [nb_column] [nb_line] [lowest_value] [bigest_value]\n");
		return 1;
	}

	size_t n = strtoul(argv[2], NULL, 10);
	size_t m = strtoul(argv[3], NULL, 10);
	float low = atof(argv[4]);
	float big = atof(argv[5]);

	FILE *f = fopen(argv[1], "wr");

	for(size_t i = 0; i < (n*m); i++){
		float alea = float_rand(low, big);
		fwrite(&alea, sizeof(float), 1, f);		
	}

	fclose(f);

	return 0;
}

#elif TYPE == DOUBLE

double double_rand(double min, double max)
{
    return min + (rand() / (double) RAND_MAX) * ( max - min );
}

int main(int argc, char const *argv[])
{
	srand(time(NULL));

	if(argc < 6){
		fprintf(stderr, "./gen_matrix [file_name] [nb_column] [nb_line] [lowest_value] [bigest_value]\n");
		return 1;
	}

	size_t n = strtoul(argv[2], NULL, 10);
	size_t m = strtoul(argv[3], NULL, 10);
	double low = atolf(argv[4]);
	double big = atolf(argv[5]);

	FILE *f = fopen(argv[1], "wr");

	for(size_t i = 0; i < (n*m); i++){
		double alea = double_rand(low, big);
		fwrite(&alea, sizeof(double), 1, f);		
	}

	fclose(f);

	return 0;
}

#else

int main(int argc, char const *argv[])
{
	printf("Type error: must be a float or a double !!!\n");
	return 1;
}

#endif