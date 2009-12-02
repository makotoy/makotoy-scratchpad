#include <stdio.h>
#include <math.h>

int main (int argc, const char * argv[]) {
	char c[2] = {1};
	c[0] = 48;
	c[1] = '\0';
	printf("1: %c\n", c[0]);
	sprintf(c, "%c", 48);
	printf("2: %s\n", c);
  return 0;
}
