from itertools import combinations


found = False
cards = []

for _ in range(4):
    cards.extend(input().split())

for (i, x), (j, y), (k, z) in combinations(enumerate(cards), 3):
    if all(len(set([x[i], y[i], z[i]])) != 2 for i in range(4)):
        found = True
        print(i + 1, j + 1, k + 1)

if not found:
    print("no sets")
