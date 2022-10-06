from sys import stdin

input()

for line in stdin:
    i, n = map(int, line.split())
    print(i, n * (n + 3) // 2)
