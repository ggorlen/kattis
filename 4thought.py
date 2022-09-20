from itertools import combinations

lookup = {
    eval(f"4{'4'.join(c)}4"): f"4 {' 4 '.join(c).replace('//', '/')} 4"
    for c in combinations([*"+-*", "//"] * 3, r=3)
}

for _ in range(int(input())):
    i = int(input())
    
    if i in lookup:
        print(lookup[i] + f" = {i}")
    else:
        print("no solution")
