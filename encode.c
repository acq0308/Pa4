#include<stdio.h>
#include<string.h>
 
char* encode(char * str, char const* key, char *encryp) 
{
  /*int i;

  for (i = 0; str[i] != '\0'; i++) //Scan through str until we get a null character
  {
    if (isAlphaLower(str[i]))
    {
      decode[i] = decodeSingleChar(str[i], key);
    }
    else decode[i] = str[i];
  }
  str[i] = '\0';
  
  int count = 0;*/
 
   int count = 0;
   for (count = 0; str[count] != '\0'; count++) 
   {
     if(str[count] >= 'a' && str[count] <= 'z')
     {
       str[count] -= 'a';
     }
   return (str);
   } 
}
 
int main() 
{
   char *str;
 
   printf("\nEnter the String to be Encode : ");
   scanf("%s", str);
 
   str = encode(str);
   printf("\nEncoded String : %s", str);
   return 0;
}

