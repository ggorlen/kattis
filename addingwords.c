#include <ctype.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool eq(char *a, char *b) {
    return !strcmp(a, b);
}

int split_whitespace(char *s, char ***result, int chunk_size) {
    int len = strlen(s);
    *result = malloc(sizeof(**result) * len);
    int result_len = 0;

    for (int i = 0; i < len; i++) {
        if (!isspace(s[i])) {
            char chunk[chunk_size];
            memset(chunk, 0, chunk_size);

            for (int j = 0; j < chunk_size && i < len && !isspace(s[i]); chunk[j++] = s[i++]);

            (*result)[result_len] = malloc(chunk_size);
            strcpy((*result)[result_len++], chunk);
        }
    }

    return result_len;
}

struct table {
    int capacity;
    int size;
    int *vals;
    char **vars;
};

bool table_key_to_value(struct table *t, char *var, int *val) {
    for (int i = 0; i < t->size; i++) {
        if (eq(t->vars[i], var)) {
            *val = t->vals[i];
            return true;
        }
    }

    return false;
}

char *table_value_to_key(struct table *t, int val) {
    for (int i = 0; i < t->size; i++) {
        if (val == t->vals[i]) {
            return t->vars[i];
        }
    }

    return NULL;
}

void table_set_key_to_value(struct table *t, char *var, int val) {
    for (int i = 0; i < t->size; i++) {
        if (eq(t->vars[i], var)) {
            t->vals[i] = val;
            return;
        }
    }

    strcpy(t->vars[t->size], var);
    t->vals[t->size++] = val;
    return;
}

void table_clear(struct table *t) {
    t->size = 0;
}

struct table table_create(int capacity, int max_strlen) {
    struct table t = {0};
    t.capacity = capacity;
    t.size = 0;
    t.vals = malloc(sizeof(*t.vals) * capacity);
    t.vars = malloc(sizeof(*t.vars) * capacity);

    for (int i = 0; i < t.capacity; i++) {
        t.vars[i] = calloc(max_strlen, 1);
    }

    return t;
}

void table_destroy(struct table *t) {
    for (int i = 0; i < t->size; i++) {
        free(t->vars[i]);
    }

    free(t->vals);
    free(t->vars);
}

bool calc(struct table *t, char **ops, int *result) {
    *result = 0;

    for (int i = 0;; i += 2) {
        int val;

        if (!table_key_to_value(t, ops[i], &val)) {
            return false;
        }
        else if (i == 0 || eq(ops[i-1], "+")) {
            *result += val;
        }
        else {
            *result -= val;
        }

        if (eq(ops[i+1], "=")) {
            return true;
        }
    }

    return true;
}

void process_command(char *cmd, char **args, char *buffer, struct table *t) {
    if (eq(cmd, "calc")) {
        int result;

        if (calc(t, args, &result)) {
            char *var = table_value_to_key(t, result);
            printf("%s %s\n", buffer + 5, var ? var : "unknown");
        }
        else {
            printf("%s unknown\n", buffer + 5);
        }
    }
    else if (eq(cmd, "def")) {
        table_set_key_to_value(t, args[0], atoi(args[1]));
    }
    else if (eq(cmd, "clear")) {
        table_clear(t);
    }
}

int main() {
    struct table t = table_create(2000, 40);

    for (char buffer[1000]; fgets(buffer, sizeof(buffer), stdin);) {
        int buf_len = strlen(buffer);
        buffer[buf_len-1] = '\0';
        char **split;
        int length = split_whitespace(buffer, &split, 40);

        if (length) {
            process_command(split[0], split + 1, buffer, &t);
        }

        for (int i = 0; i < length; i++) {
            free(split[i]);
        }

        free(split);
    }

    table_destroy(&t);
    return 0;
}
