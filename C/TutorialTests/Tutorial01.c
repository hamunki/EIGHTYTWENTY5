#include <stdio.h>
#include <stdbool.h>
#include <string.h>

int main(int argc, char *argv[]) {
    if (argc == 1) {
        printf("[%s] supplied with no arguments. using defaults.\n", argv[0]);
    } else {
        printf("argc: %d arguments supplied to [%s]\n", argc, argv[0]);
        printf("Arg 1: %s\n", argv[1]);
    }

    return 0;
}