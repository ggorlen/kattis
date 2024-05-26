from collections import defaultdict

seen = defaultdict(int)

for _ in range(int(input())):
    s = input()
    print(seen.get(s, 0))

    for i in range(1, len(s) + 1):
        prefix = s[:i]
        seen[prefix] += 1
