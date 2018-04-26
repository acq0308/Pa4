#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char * prepareKey(char* key);

int main()
{
  char key[40];
  strcpy(key, "hello");
  prepareKey(key);
	printf("alphabet in debug.c: %s\n", key);
	return 0;
}
