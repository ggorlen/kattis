#include <stdio.h>

int main() {
    int n;
    scanf("%d\n", &n);

    for (int i = 0; i < n; i++) {
        int previous = -1;
        int g;
        scanf("%d", &g);

        for (int j = 0; j < g; j++) {
            int current;
            scanf("%d", &current);

            if (previous >= 0 && previous + 1 != current) {
                printf("%d\n", ++j);

                for (; j < g; j++) {
                    scanf("%d", &current); 
                }

                break;
            }

            previous = current;
        }
    }
} 

