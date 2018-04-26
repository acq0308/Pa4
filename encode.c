#include<stdio.h>
#include<string.h>
 
char* encode(char * str, char const* key, char *encryp) 
{
   int count = 0;
 
   while (str[count] != '\0') {
      str[count] -= 'a';
      count++;
   }
   return (str);
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

