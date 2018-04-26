#include <stdio.h>
#include <stdlib.h>

//int isAlphaLower(char);
//char decodeSingleChar(char, char*);
void decode(char *str, char *key, char *decode);


int main()
{
  char encoded[] = "tpptad tp itvh";
  char key[] = "trailbzescdfghjkmnopquvwxy";
  char decoded[40] = "";

  printf("encoded: %s\n", encoded);
  decode(encoded, key, decoded);

  printf("decoded: %s\n", decoded);
}


/*void decode(char *str, char *key, char *decode)
{
  int i;

  for (i = 0; str[i] != '\0'; i++) //Scan through str until we get a null character
  {
    if (isAlphaLower(str[i]))
    {
      decode[i] = decodeSingleChar(str[i], key);
    }
    else decode[i] = str[i];
  }
  str[i] = '\0';

}

int isAlphaLower(char c)
{
  return (c <= 'z' && c >= 'a');
}

char decodeSingleChar(char c, char *key)
{
  char i = 0;

  while (key[i] != c)
  {
    i++;
  }

  i += 'a';
  return i;
}*/
