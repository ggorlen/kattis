n = int(input())

for _ in range(n):
    input()
    children = int(input())
    total = 0

    for _ in range(children):
        x = int(input())
        total += x
        total %= children

    if total == 0:
        print("YES")
    else:
        print("NO")
