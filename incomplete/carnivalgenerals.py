# TLE
# Idea: later elements have more restrictions, so they should go first.
# iterate backwards to find the first match, then repeat until all are used

# maybe also backtracking? try picking elements one by one, and any time there's a bad fit backtrack - ---- TLE backtracking!

def compatible(x, y):
    # Could also work off of beginning of array positively rather than end
    if len(y) % 2 == 0:
        return len(x) not in y[len(y)//2:]

    return len(x) not in y[len(y)//2+1:]

generals = [[int(x) for x in input().split()] for _ in range(int(input()) - 1)] + [[]][::-1]

def place(generals, result=None, i=0, used= set()):
    if result is None:
        result = []

    if i >= len(generals):
        print(" ".join([str(len(x)) for x in result]))
        import sys
        sys.exit(0)
        return result

    for j in range(0, len(generals)):
        if not result or (j not in used and compatible(result[-1], generals[j]) and compatible(generals[j], result[-1])):
            result.append(generals[j])
            used.add(j)
            if result_ := place(generals, result, i + 1):
                return result_
            used.remove(j)
            result.pop()

print(place(generals))

'''
used = set()

for i, g1 in enumerate(generals):
    found = False

    for j, g2 in enumerate(generals):
        if compatible(g1, g2):
            found = True
            break
'''

'''
import itertools
import sys


def compatible(x, y):
    if len(y) % 2 == 0:
        return len(x) not in y[len(y)//2:]

    return len(x) not in y[len(y)//2+1:]

generals = [[int(x) for x in input().split()] for _ in range(int(input()) - 1)] + [[]]

results = 0
for perm in itertools.permutations(generals):
    ok = True
    for i in range(1, len(perm) - 1):
        if (
            not compatible(perm[i], perm[i-1]) or
            not compatible(perm[i], perm[i+1]) or
            not compatible(perm[i-1], perm[i]) or
            not compatible(perm[i+1], perm[i])
        ):
            ok = False
            break

    if ok:
        print(" ".join([str(len(x)) for x in perm]))
        #sys.exit(0)
        results += 1
print(results, len(list(itertools.permutations(generals))))
'''
