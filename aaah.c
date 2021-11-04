#include <stdio.h>
#include <string.h>

int main() {
    char jon[1024];
    char doc[1024];
    scanf("%[^\n]\n", jon);
    scanf("%[^\n]", doc);
    printf("%s\n", strlen(jon) >= strlen(doc) ? "go" : "no");
    return 0;
}
