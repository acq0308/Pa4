#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char * prepareKey(char* key);

int main()
{
	printf("alphabet: %s", prepareKey("hello"));
	return 0;
}
