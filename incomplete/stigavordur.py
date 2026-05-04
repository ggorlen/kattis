# TLE

import math

_, n = map(int, input().split())
xs = list(map(int, input().split()))

for _ in range(n):
    x, y, z = map(int, input().split())

    if x == 1:
        xs[y-1] = z
    else:
        print(math.gcd(*xs[y-1:z]))
