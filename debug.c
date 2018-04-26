#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char * prepareKey(char* key);

int main(int argc, char *argv[])
{
  char key[100];
  strcpy(key, (argc == 2) ? argv[1] : "testkeyword");
  prepareKey(key);
	printf("key in debug.c: %s\n", key);
	return 0;
}
