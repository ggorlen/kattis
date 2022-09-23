#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char *counts = calloc(1000000000, 1);

    for (;;) {
        int n, m;
        scanf("%d %d\n", &n, &m);

        if (n == 0 && m == 0) {
            break;
        }

        int max = 0;
        int dupes = 0;

        for (int i = m + n; i > 0; i--) {
            int id;
            scanf("%d\n", &id);
            max = id > max ? id : max;

            if (counts[id]++) {
                dupes++;
            }
        }

        printf("%d\n", dupes);
        memset(counts, 0, max + 1);
    }

    return 0;
}
