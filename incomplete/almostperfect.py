# TLE, no obvious OEIS sequence
from sys import stdin

for line in stdin:
    n = int(line)
    total = 0

    for i in range(1, n // 2 + 1):
        if n % i == 0:
            total += i
        if total > n + 2:
            break

    if total == n:
        print(n, "perfect")
    elif abs(total - n) < 3:
        print(n, "almost perfect")
    else:
        print(n, "not perfect")
