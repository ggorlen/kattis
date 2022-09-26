#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    int n, target;
    scanf("%d %d\n", &n, &target);

    char buffer[n*11];
    fgets(buffer, sizeof(buffer), stdin);

    char *lookup = calloc(100000001, 1);
    int line = 0;

    for (char *n; (n = strtok(line++ == 0 ? buffer : NULL, " "));) {
        int i = atoi(n);

        if (target - i >= 0 && lookup[target-i]) {
            puts("YES");
            return 0;
        }

        bool has_3_4_or_7 = false;

        for (int j = 0, k = strlen(n) - 1; j < k; j++, k--) {
            char t = n[j];

            if (t == '3' || t == '4' || t == '7') {
                has_3_4_or_7 = true;
                break;
            }

            n[j] = n[k];
            n[k] = t;
        }

        if (has_3_4_or_7) {
            lookup[i] = 1;
            continue;
        }

        int reversed = atoi(n);

        if (target - reversed >= 0 && lookup[target-reversed]) {
            puts("YES");
            return 0;
        }

        lookup[i] = 1;
        lookup[reversed] = 1;
    }

    puts("NO");
    return 0;
}
