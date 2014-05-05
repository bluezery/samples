#include <stdio.h>

void * malloc(unsigned int N)
{
	printf("malloc hooking: %d\n", N);
	return NULL;
}
