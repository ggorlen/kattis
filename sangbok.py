n, *_ = map(int, input().split())
n *= 60
xs = sorted(map(int, input().split()))
taken = 0

for x in xs:
    if taken + x > n:
        break

    taken += x

print(taken)
