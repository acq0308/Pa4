#include <stdio.h>
#include <stdlib.h>



int main(int argc, char *argv[])
{
	if (argc != 2)
	{
		fprintf(stderr, "Proper usage: %s <key>\n", argv[0]);
		exit(-1);
	}
	char alphabet[27];
	char key[27];
	int i,j=0;

	for (i = 0; i < 26; i++)
	{
		alphabet[i] = i + 'a';
	}
	alphabet[26] = '\0';

	printf("alphabet: %stest\n", alphabet);
	for (i = 0; argv[1][i] != '\0'; i++)
	{
		if ((argv[1][i] <= 'z' && argv[1][i] >= 'a') && alphabet[argv[1][i] - 'a'] != ' ') //Is the letter a lowercase number, and is it unused?
		{
			key[j] = argv[1][i];
			alphabet[argv[1][i] - 'a'] = ' ';
			j++;
		}
	}
	printf("alphabet: %stest\n", alphabet);
	for (i = 0; i < 26; i++)
	{
		if (alphabet[i] != ' ')
		{
			key[j] = alphabet[i];
			j++;
		}
	}
	key[26] = '\0';

	printf("key: %stest\n", key);
	return 0;
}
