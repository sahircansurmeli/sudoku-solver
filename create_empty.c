#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    int n;
    char fname[40];
    FILE *fpout;

    n = atoi(argv[1]);

    sprintf(fname, "sudoku_empty_%d.txt", n);

    fpout = fopen(fname, "w");

    fprintf(fpout, "%d\n", n);

    for (int i = 0; i < n*n; i++) {
        for (int j = 0; j < n*n; j++)
            fprintf(fpout, "0 ");
        fprintf(fpout, "\n");
    }

    fclose(fpout);
    return 0;
}