#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int extend(char *s, size_t len, char last, int i, int *memo) {
    const int memo_idx = last - 'a' + i * 26;

    if (i >= len) {
        return 0;
    }
    else if (memo[memo_idx]) {
        return memo[memo_idx];
    }
    else if (s[i] <= last) {
        return extend(s, len, last, i + 1, memo);
    }

    int take = 1 + extend(s, len, s[i], i + 1, memo);
    int dontTake = extend(s, len, last, i + 1, memo);
    return memo[memo_idx] = take > dontTake ? take : dontTake;
}

int main() {
    int memo[1326] = {};
    char s[51];
    scanf("%s", s);
    int longest = 0;
    int len = strlen(s);

    for (int i = 0; i < len; i++) {
        int run = extend(s, len, s[i], i, memo);
        longest = run > longest ? run : longest;
    }

    printf("%d\n", 25 - longest);
    return 0;
}
