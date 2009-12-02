#include <stdio.h>
#include <math.h>

long double log2l(long double temp){ 
  long double answer; 
  answer=log10l(temp)/log10l(2.0); 
  return(answer); 
} 

int main (int argc, const char * argv[]) {
//  printf("answer: %Lf\n", log2l(3.0));
	char c[2] = {1};
	c[0] = 48;
	c[1] = '\0';
	printf("1: %c\n", c[0]);
	sprintf(c, "%c", 48);
	printf("2: %s\n", c);
  return 0;
}
