quadkey = input()
quadkey_multipliers = (0, 0), (1, 0), (0, 1), (1, 1)
x, y = 0, 0

for level, k in enumerate(quadkey):
    xx, yy = quadkey_multipliers[int(k)]
    x += xx * 2 ** (len(quadkey) - level - 1)
    y += yy * 2 ** (len(quadkey) - level - 1)

print(len(quadkey), x, y)
