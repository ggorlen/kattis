x = (
    [],
    (1,),
    (2, 1),
    (3, 1, 2),
    (2, 1, 4, 3),
    (3, 1, 4, 5, 2),
    (4, 1, 6, 3, 2, 5),
    (5, 1, 3, 4, 2, 6, 7),
    (3, 1, 7, 5, 2, 6, 8, 4),
    (7, 1, 8, 6, 2, 9, 4, 5, 3),
    (9, 1, 8, 5, 2, 4, 7, 6, 3, 10),
    (5, 1, 6, 4, 2, 10, 11, 7, 3, 8, 9),
    (7, 1, 4, 9, 2, 11, 10, 8, 3, 6, 5, 12),
    (4, 1, 13, 11, 2, 10, 6, 7, 3, 5, 12, 9, 8),
)

for _ in range(int(input())):
    print(" ".join(map(str, x[int(input())])))


import sys

sys.exit()
# generated with:

from itertools import permutations


def test(nums):
    orig = nums[:]
    cards = []

    for i in range(len(nums)):
        if not nums:
            break

        for _ in range(i + 1):
            if not nums:
                break

            nums.append(nums.pop(0))

        if not nums:
            break

        cards.append(nums.pop(0))

    return cards == sorted(orig)


for n in range(1, 9):
    for perm in permutations(list(range(1, n + 1))):
        if len(perm) < 1 and test(list(perm)):
            print(perm)
            break
        elif len(perm) > 4 and perm[1] == 1 and perm[4] == 2 and test(list(perm)):
            print(perm)
            break
        elif (
            len(perm) > 8
            and perm[1] == 1
            and perm[4] == 2
            and perm[8] == 3
            and test(list(perm))
        ):
            print(perm)
            break
        elif test(list(perm)):
            print(perm)
            break

for n in range(9, 14):
    for perm in permutations(list(range(4, n + 1))):
        perm = list(perm)
        perm = perm[:1] + [1] + perm[1:3] + [2] + perm[3:6] + [3] + perm[6:]

        if test(perm[:]):
            print(perm)
            break
