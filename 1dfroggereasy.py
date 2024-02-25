_, s, m = map(int, input().split())

t = [None]
visited = set()

for x in map(int, input().split()):
    t.append(x)

steps = 0

while True:
    if s < 1:
        result = "left"
        break
    elif s > len(t) - 1:
        result = "right"
        break
    elif s in visited:
        result = "cycle"
        break
    elif t[s] == m:
        result = "magic"
        break

    visited.add(s)
    steps += 1
    s += t[s]

print(result)
print(steps)
