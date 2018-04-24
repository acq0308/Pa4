#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char * prepareKey(char* key);

int main()
{
	printf("alphabet in debug.c: %s\n", prepareKey("hello"));
	return 0;
}
