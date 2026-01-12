#!/bin/bash

# wrong answer, precision is off

read n
n=$(echo "scale=10; $n * 0.09144 / 1" | bc)
if [[ $n =~ ^\. ]]; then
    printf 0
fi
echo $n
