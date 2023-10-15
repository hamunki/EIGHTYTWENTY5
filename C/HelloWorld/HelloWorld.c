#include <stdio.h>
#include <stdbool.h>

int main() {
  int iSomething = 12;
  float fSausageCount = 33.86;
  double dMarzipan = 148.2856;

  printf("\n\nHello Linux Mint\n\n");
  printf("iSomething: %d\n\n", iSomething);
  printf("dMarzipan: %.3lf\n\n", dMarzipan);

  int myInt;
  float myFloat;
  double myDouble;
  char myChar;

  // lu = long unsigned int
  printf("%lu\n", sizeof(myInt));
  printf("%lu\n", sizeof(myFloat));
  printf("%lu\n", sizeof(myDouble));
  printf("%lu\n", sizeof(myChar));

  printf("\n\n=====================\n\n");
  int i;
  for (i = 0; i < 10; ++i) {
    if (i == 8) {
      continue;
    }
    printf("%d\n", i);
  }
  printf("\n\n=====================\n\n");

  return 0;
}
