#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char * prepareKey(char* key);
void decode(char * str, char * key, char * dec);
void encode(char * str, char * key, char * dec);


int main(int argc, char *argv[])
{
  char key[100];
  char message[] = "attack at dawn";
  char output[100];
  strcpy(key, (argc == 2) ? argv[1] : "trailblazers");
  prepareKey(key);
	printf("key: %s\n", key);
  printf("message: %s\n", message);
  encode(message, key, output);
  printf("encoded: %s\n", output);
  strcpy(message, output);
  decode(message, key, output);
  printf("decoded: %s\n", output);
  
	return 0;
}
