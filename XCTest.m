#import <Foundation/Foundation.h>

// #import "MyObject.h"

long double log2l(long double temp){ 
  long double anser; 
  anser=log10l(temp)/log10l(2.0); 
  return(anser); 
} 

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    printf("answer: %lf\n", log2(3.0));
    
    [pool drain];
    return 0;
}
